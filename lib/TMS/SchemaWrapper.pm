package TMS::SchemaWrapper;

use strict;
use warnings FATAL => 'all';
use feature 'current_sub';

use Carp qw( confess longmess );
use namespace::autoclean;
use Devel::Confess;
use Data::Dumper;
use JSON;

use Moose;
use TMS::Schema;

$Data::Dumper::Terse = 1;
my $JSON = JSON->new->utf8->allow_nonref->indent->space_after->space_before;

has '_rows'     => (is => 'rw', required => 0, isa     => 'Undef|Int');
has '_page'     => (is => 'rw', required => 0, isa     => 'Undef|Int');
has '_order_by' => (is => 'rw', required => 0, isa     => 'Undef|ArrayRef');
has '_prefetch' => (is => 'rw', required => 0, isa     => 'Undef|ArrayRef|HashRef');
has Schema      => (is => 'rw', lazy     => 1, builder => '_get_dbix_hdl');
sub _get_dbix_hdl { shift->Schema(TMS::Schema->new()->DBIxHandle) }

sub BUILDARGS {
    my $class = shift;
    my %args  = ref $_[0] ? %{$_[0]} : @_;
    my $data  = Sift(\%args);
    return $data;
}

sub Sift {
    my $data = shift;
    if (ref $data eq 'ARRAY') {
        if (scalar(@$data)) {
            my $valid = [];
            foreach my $elm (@$data) {
                $elm = __SUB__->($elm) if ref $elm;
                push @$valid, $elm if defined $elm;
            }
            $data = $valid;
        } else {
            $data = undef;
        }
    } elsif (ref $data eq 'HASH') {
        foreach (keys %$data) {
            $$data{$_} = __SUB__->($$data{$_}) if ref $$data{$_};
            if (!defined $$data{$_}) {
                delete $$data{$_};
                next;
            }
        }
    }
    return $data;
}

sub Validate {
    my $self = shift;
    return @_ if scalar(@_);
    my %args = ();
    foreach my $clrel ($self->ColumnsList, $self->Relationships) {
        next if !defined $self->$clrel;    # calling as method to trigger lazy build
        if (ref $$self{$clrel}) {
            if (ref($$self{$clrel}) =~ /(::API::|^MooseX::Traits)::/) {
                $args{$clrel} = $$self{$clrel}->Validate;
            } elsif (ref($$self{$clrel}) eq 'HASH') {
                foreach (keys %{$$self{$clrel}}) {
                    $$self{$clrel}{$_} = $$self{$clrel}{$_}->Validate
                        if (ref($$self{$clrel}{$_}) =~ /(::API::|^MooseX::Traits)::/);
                }
                $args{$clrel} = $self->$clrel;
            } elsif (ref($$self{$clrel}) eq 'ARRAY') {
                my $arr = [];
                foreach my $elm (@{$$self{$clrel}}) {
                    if (ref($elm) =~ /(::API::|MooseX::Traits)::/) {
                        push @$arr, $elm->Validate;
                    } else {
                        push @$arr, $elm;
                    }
                }
                $args{$clrel} = $arr;
            } else {
                confess "Illegal type " . ref($$self{$clrel});
            }
        } else {
            $args{$clrel} = $self->$clrel;
        }
    }
    return scalar(%args) ? \%args : undef;
}

sub _inner_loop {
    my $self   = shift;
    my %rlns   = $self->RelationshipsInfo;
    my $method = (caller(1))[3];
    $method = (caller(2))[3] if $method =~ /_loop_manager$/;

    foreach my $rel (grep { $rlns{$_}{attrs}{accessor} eq 'single' } keys %rlns) {
        next unless exists $$self{$rel} && defined $$self{$rel} && ref($$self{$rel});
        my $row = $self->$rel->$method;
        if (defined $row && ref($row) =~ /Schema::Result::/) {
            my %rcls = $row->get_columns();
            foreach (keys %rcls) { delete $rcls{$_} if !defined $rcls{$_} }
            foreach (keys %{$rlns{$rel}{'cond'}}) {
                (my $lcol = $rlns{$rel}{'cond'}{$_}) =~ s/^self\.//;
                (my $fcol = $_) =~ s/^foreign\.//;
                $self->$lcol($rcls{$fcol});
            }
        }
    }
}

sub _outter_loop {
    my $self = shift;
    my %rlns = $self->RelationshipsInfo;

    my $method = (caller(1))[3];
    $method = (caller(2))[3] if $method =~ /_loop_manager$/;

    foreach my $rel (grep { $rlns{$_}{attrs}{accessor} ne 'single' } keys %rlns) {
        next unless exists $$self{$rel} && defined $$self{$rel} && ref($$self{$rel}) eq 'ARRAY';
        foreach my $inst (@{$$self{$rel}}) {
            foreach (keys %{$rlns{$rel}{'cond'}}) {
                (my $lcol = $rlns{$rel}{'cond'}{$_}) =~ s/^self\.//;
                (my $fcol = $_) =~ s/^foreign\.//;
                $inst->$fcol($self->$lcol) if exists $$self{$lcol};
            }
            $inst->$method;
        }
    }
}

sub _loop_manager {
    my $self = shift;
    my $dbix = shift;

    my %rlns = $self->RelationshipsInfo;

    $self->_inner_loop;
    my $valid = $self->Validate;
    if (defined $valid) {
        foreach my $rel (grep { $rlns{$_}{attrs}{accessor} ne 'single' } keys %rlns) {
            delete $$valid{$rel} if exists $$valid{$rel};
        }

        my $row = $self->ResultSet->$dbix($valid);
        if (defined $row && ref($row) =~ /Schema::Result::/) {
            my %data = $row->get_columns();
            foreach (keys %data) {
                if (defined $data{$_}) {
                    $self->$_($data{$_});
                }
            }
        }
        $self->_outter_loop;
        return $row;
    }
    return undef;
}

#{                                      #{
#    "home_ph" => {                     #    'PhExt'           => 0,
#        "PhNum" => "916-880-8506",     #    'PhNum'           => '415-555-1212',
#        "PhExt" => "0",                #    'people_home_phs' => [
#        "PhId"  => 7                   #        {   'LastName'   => 'Smith',
#    },                                 #            'FirstName'  => 'John',
#    "CellPhId"  => 5,                  #            'MiddleName' => ''
#    "LastName"  => "Chuk",             #        }
#    "FirstName" => "Peter",            #    ]
#    "cell_ph"   => {                   #}
#        "PhExt" => "0",
#        "PhId"  => 5,
#        "PhNum" => "916-718-8451"
#    },
#    "PrsnId"     => 3,
#    "HomePhId"   => 7,
#    "MiddleName" => ""
#};

sub _tree_to_flat {
    my ($tree, $name, $flat) = @_;
    $name = 'me' if !defined $name;
    $flat = {}   if !defined $flat;

    if (ref($tree) eq 'HASH') {
        foreach my $cl (keys %$tree) {
            if (ref($$tree{$cl})) {
                __SUB__->($$tree{$cl}, $cl, $flat);
            } else {
                $$flat{"$name.$cl"} = $$tree{$cl};
            }
        }
    } elsif (ref($tree) eq 'ARRAY') {
        foreach my $clhs (@$tree) {    # column is HASH
            my ($cl, $vl) = %$clhs;
            if (ref($vl)) {
                __SUB__->($vl, $cl, $flat);
            } else {
                $$flat{"$name.$cl"} = $vl;
            }
        }
    }
    return $flat;
}

sub Like  {&Show}
sub RLike {&Show}
sub Rlike {&Show}

sub Show {
    my $self   = shift;
    my $acnt   = scalar @_;         # attributes count
    my $method = (caller(1))[3];    # who called us, maybe nobody, maybe LIKE or RLIKE

    if ($acnt == 1 && !defined $_[0]) {
        return $self->Search(undef, {prefetch => $self->_prefetch})->hashref_array();
    } elsif ($acnt > 1 && ref($_[1]) eq 'HASH') {
        my $attr = _tree_to_flat($_[0]);
        $_[0] = $attr;
        $_[1]->{prefetch} = $self->_prefetch if !exists $_[1]->{prefetch} && defined $self->_prefetch;
        return $self->Search(@_)->hashref_array();
    } else {
        my $attr = _tree_to_flat($self->Validate);
        if ($method =~ /::(R?Like)$/) {
            my $type = uc($1);
            foreach (keys %$attr) {
                my $value = $$attr{$_};
                if ($type eq 'LIKE') {
                    $$attr{$_} = {$type => '%' . $value . '%'};
                } else {
                    $$attr{$_} = {$type => $value};
                }
            }
        }

        my $rules = {};

        $$rules{prefetch} = $self->_prefetch if defined $self->_prefetch;
        $$rules{rows}     = $self->_rows     if defined $self->_rows;
        $$rules{page}     = $self->_page     if defined $self->_page;

        if (defined $self->_order_by) {
            my $order = [];
            foreach (@{$self->_order_by}) {
                my ($col, $dir) = %$_;
                $col = 'me.' . $col if $col !~ /\./;
                if ($dir =~ /(asc|desc)/i) {
                    $dir = '-' . lc($1);
                } else {
                    $dir = '-asc';
                }
                push @$order, {$dir => $col};
            }
            $$rules{order_by} = $order;
        }

        return $self->Search($attr, $rules)->hashref_array();
    }
    confess "No idea what to do";
}

# ----------------------------------------------------------------------------
# wrapper methods
# ----------------------------------------------------------------------------
sub ResultSet {    # result set for given table
    my $self = shift;
    $self->EnsureConnected;
    return $self->Schema->resultset($self->_dbix_class);
}

sub RelationshipsInfo {
    my $rs = shift->ResultSource;
    {
        map { $_, $rs->relationship_info($_) } $rs->relationships
    }
}

sub ColumnsList      { shift->ResultSource->columns }
sub Commit           { shift->Schema->txn_commit }
sub Connected        { shift->Storage->connected }
sub CreateOrUpdate   {&UpdateOrCreate}
sub Dump             { Dumper([shift->Show(@_)]) }
sub EnsureConnected  { shift->Storage->ensure_connected }
sub Find             { my $self = shift; $self->ResultSet->find($self->Validate(@_)) }
sub Json             { $JSON->encode([shift->Show(@_)]) }
sub JsonTell         { print shift->Json(@_) }
sub PrimaryColumns   { shift->ResultSource->primary_columns }
sub Relationships    { shift->ResultSource->relationships() }
sub ResultSource     { shift->ResultSet->result_source }
sub Rollback         { shift->Schema->txn_rollback }
sub Search           { my $self = shift; $self->ResultSet->search($self->Validate(@_)) }
sub Storage          { shift->Schema->storage }
sub Tell             { print shift->Dump(@_) }
sub Transaction      { shift->Schema->txn_do(@_) }
sub TransactionBegin { shift->Schema->txn_begin }
sub SvpBegin         { shift->Storage->svp_begin(@_) }
sub SvpRelease       { shift->Storage->svp_release(@_) }
sub SvpRollback      { shift->Storage->svp_rollback(@_) }

sub _find_or_create   { shift->_loop_manager('update_or_create') }
sub _update_or_new    { shift->_loop_manager('update_or_new') }
sub _update_or_create { shift->_loop_manager('update_or_create') }

sub _strict_create {
    my $self = shift;
    $self->ResultSet->create($self->Validate(@_));
}

sub _basic_delete {
    my $self = shift;
    my $row  = $self->Find(@_);
    if ($row) {
        $self->_outter_loop;
        $row->delete;
        $self->_inner_loop;
        return $row->in_storage;
    } else {
        return undef;
    }
}

sub Delete {
    my $self = shift;
    my $trxn = $self->Schema->txn_scope_guard;
    my $rslt = $self->_basic_delete(@_);
    $trxn->commit;
    return $rslt;
}

sub Create {
    my $self = shift;
    my $trxn = $self->Schema->txn_scope_guard;
    my $rslt = $self->_strict_create(@_);
    $trxn->commit;
    return $rslt;
}

sub FindOrCreate {
    my $self = shift;
    my $trxn = $self->Schema->txn_scope_guard;
    my $rslt = $self->_find_or_create;
    $trxn->commit;
    return $rslt;
}

sub UpdateOrNew {
    my $self = shift;
    my $trxn = $self->Schema->txn_scope_guard;
    my $rslt = $self->_update_or_new;
    $trxn->commit;
    return $rslt;
}

sub UpdateOrCreate {
    my $self = shift;                            # $self->EnsureConnected;
    my $trxn = $self->Schema->txn_scope_guard;
    my $rslt = $self->_update_or_create;
    $trxn->commit;
    return $rslt;
}

sub NonPrimaryColumns {
    my $self = shift;
    my %Keys = map { $_, 1 } $self->PrimaryColumns;
    grep { !exists $Keys{$_} } $self->ColumnsList;
}

sub UniqueConstraints {
    my %data = shift->ResultSource->unique_constraints;
    return \%data;
}

sub RelationshipInfo {
    my $self = shift;
    my %info = map { $_, $self->ResultSource->relationship_info($_) } $self->Relationships;
    return \%info;
}

sub RelationshipAttr {
    my $self = shift;
    my $attr = undef;
    my %info = map { $_, $self->ResultSource->relationship_info($_) } $self->Relationships;
    foreach my $name (keys %info) {
        next unless exists $info{$name}{attrs}{is_foreign_key_constraint};
        my ($col) = values %{$info{$name}{cond}};
        $col =~ s/self\.//;
        $$attr{$col} = $info{$name};
        $$attr{$col}{name} = $name;
    }
    return $attr;
}

sub ReverseRelationshipInfo {
    my $self = shift;
    my %info = map { $_, $self->ResultSource->reverse_relationship_info($_) } $self->Relationships;
    return \%info;
}

sub ColumnsInfo {
    my $self = shift;
    my %cols = map { $_, $self->ResultSource->column_info($_) } $self->ColumnsList;
    return \%cols;
}

1;
