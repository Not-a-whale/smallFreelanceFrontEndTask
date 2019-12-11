package TMS::SchemaWrapper;
use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use namespace::autoclean;
use Devel::Confess;
use Data::Dumper;
use Try::Tiny;

use Moose;
use TMS::Schema;

$Data::Dumper::Terse = 1;

# -------------------------------------------------------------------------------------------------------------
has Schema => (is => 'rw', lazy => 1, builder => '_get_dbix_hdl');
sub _get_dbix_hdl { shift->Schema(TMS::Schema->new()->DBIxHandle) }

has PrimaryKey => (is => 'rw');

# -------------------------------------------------------------------------------------------------------------
sub Storage { shift->Schema->storage }

# -------------------------------------------------------------------------------------------------------------
sub Connected { shift->Storage->connected }

# -------------------------------------------------------------------------------------------------------------
sub EnsureConnected { shift->Storage->ensure_connected }

# -------------------------------------------------------------------------------------------------------------
sub _meta_loop {
    my $self   = shift;
    my $method = (caller(1))[3];
    my $data   = {};
    my %list   = map { $_, 1 } $self->ColumnsList;
    for my $attr ($self->meta->get_all_attributes) {
        my $name = $attr->name;
        next if !exists $list{$name};
        my $type = ref($$self{$name});
        if ($type =~ /TMS::/) {
            try {
                my $row = $self->$name->$method;
                if (ref($row) =~ /^TMS::Schema::Result::\w+$/ && $row->can('id')) {
                    $$data{$name} = $row->id;
                } else {
                    $$data{$name} = $row;
                }
            } catch {
                my $error = $_;
                if ($attr->is_required) {
                    confess "$error";
                } else {
                    $$data{$name} = undef;
                }
            };
        } else {
            $$data{$name} = $self->$name if defined $self->$name;
        }
    }
    return $data;
}

# -------------------------------------------------------------------------------------------------------------
sub DataHash { shift->_meta_loop }

# -------------------------------------------------------------------------------------------------------------
sub DataHashTell { print Dumper(shift->DataHash) }

# -------------------------------------------------------------------------------------------------------------
sub Do {    # execute raw SQL command
    my ($self, $sql, @vals) = @_;
    $self->Storage->dbh_do(
        sub {
            my ($storage, $dbh, $sql, @values) = @_;
            print "Custom SQL: $sql\n" . Dumper(\@values) if $ENV{DBIC_TRACE};
            return $dbh->do($sql, undef, @values);
        },
        $sql,
        @vals
    );
}

# -------------------------------------------------------------------------------------------------------------
sub ResultSet {    # result set for given table
    my $self = shift;
    (my $name = ref($self)) =~ s/.*:://g;
    return $self->Schema->resultset($name);
}

# -------------------------------------------------------------------------------------------------------------
sub Transaction { shift->Schema->txn_do(@_) }    # As Is wrapper arount txn_do

# -------------------------------------------------------------------------------------------------------------
sub TransactionBegin { shift->Schema->txn_begin }

# -------------------------------------------------------------------------------------------------------------
sub Commit { shift->Schema->txn_commit }

# -------------------------------------------------------------------------------------------------------------
sub Rollback { shift->Schema->txn_rollback }

# -------------------------------------------------------------------------------------------------------------
sub ResultSource { shift->ResultSet->result_source }

# -------------------------------------------------------------------------------------------------------------
sub PrimaryColumns { shift->ResultSource->primary_columns }

# -------------------------------------------------------------------------------------------------------------
sub NonPrimaryColumns {
    my $self = shift;
    my %Keys = map { $_, 1 } $self->PrimaryColumns;
    grep { !exists $Keys{$_} } $self->ColumnsList;
}

# -------------------------------------------------------------------------------------------------------------
sub UniqueConstraints {
    my %data = shift->ResultSource->unique_constraints;
    return \%data;
}

# -------------------------------------------------------------------------------------------------------------
sub Relationships { shift->ResultSource->relationships() }

# -------------------------------------------------------------------------------------------------------------
sub RelationshipInfo {
    my $self = shift;
    my %info = map { $_, $self->ResultSource->relationship_info($_) } $self->Relationships;
    return \%info;
}

# -------------------------------------------------------------------------------------------------------------
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

# -------------------------------------------------------------------------------------------------------------
sub ReverseRelationshipInfo {
    my $self = shift;
    my %info = map { $_, $self->ResultSource->reverse_relationship_info($_) } $self->Relationships;
    return \%info;
}

# -------------------------------------------------------------------------------------------------------------
sub ColumnsList { shift->ResultSource->columns }

# -------------------------------------------------------------------------------------------------------------
sub ColumnsInfo {
    my $self = shift;
    my %cols = map { $_, $self->ResultSource->column_info($_) } $self->ColumnsList;
    return \%cols;
}

# -------------------------------------------------------------------------------------------------------------
# buld WHERE hash based on primary or unique keys
# -------------------------------------------------------------------------------------------------------------
sub FetchWhereKeys {
    my $self = shift;
    my $data = $self->_meta_loop;                                         # process parameter types
    my $uniq = $self->UniqueConstraints;
    my $prim = exists $$uniq{primary} ? delete $$uniq{primary} : undef;
    my $cond = undef;                                                     # hash ref of where conditions

    if ($prim) {
        my $pk_cntr = 0;                                                  # count all PKs in case we have more than one
        my $pk_size = scalar(@$prim);                                     # find count of primary keys
        my $pk_cond = undef;                                              # temp storage for the 'where' conditions
        foreach (@$prim) {
            next unless exists $$self{$_} && defined $$self{$_};
            $$pk_cond{$_} = $self->$_;
            $pk_cntr++;
        }
        $cond = $pk_cond if defined $pk_cond && $pk_size == $pk_cntr;     # promote 'where' only if all keys accounted for
    }

    if (!$cond) {
        foreach my $ky (keys %$uniq) {                                    # loop through unique constraints
            my $uq_cntr = 0;
            my $uq_size = scalar(@{$$uniq{$ky}});
            my $uq_cond = undef;
            foreach (@{$$uniq{$ky}}) {
                next unless exists $$self{$_} && defined $$self{$_};
                $$uq_cond{$_} = $self->$_;
                $uq_cntr++;
            }

            if (defined $uq_cond && $uq_cntr == $uq_size) {               # only if all the fields within constraint are present
                $cond = $uq_cond;
                last;
            }
        }
    }
    return $cond;
}

# -------------------------------------------------------------------------------------------------------------
sub Create {
    my $self = shift;
    my @cond = scalar(@_) ? @_ : ($self->_meta_loop);
    my $row  = $self->ResultSet->create(@cond);
    if ($row) {
        my %data = $row->get_columns();
        $self->$_($data{$_}) foreach (keys %data);
    }
    return $row;
}

# -------------------------------------------------------------------------------------------------------------
sub Find {
    my $self = shift;
    my @cond = scalar(@_) ? @_ : ($self->_meta_loop);
    return $self->ResultSet->find(@cond);
}

# -------------------------------------------------------------------------------------------------------------
sub FindOrCreate {
    my $self = shift;
    my @cond = scalar(@_) ? @_ : ($self->_meta_loop);
    my $row  = $self->ResultSet->find_or_create(@cond);
    if ($row) {
        my %columns = $row->get_columns;
        $self->$_($columns{$_}) foreach keys %columns;
    }
    return $row;
}

# -------------------------------------------------------------------------------------------------------------
sub UpdateOrCreate {
    my $self = shift;
    my @cond = scalar(@_) ? @_ : ($self->_meta_loop);
    my $row  = $self->ResultSet->update_or_create(@cond);
    if ($row) {
        my %columns = $row->get_columns;
        $self->$_($columns{$_}) foreach keys %columns;
    }
    return $row;
}

# -------------------------------------------------------------------------------------------------------------
sub Update {    # https://github.com/castaway/dbix-class-book/blob/master/chapters/04-Creating-Reading-Updating-Deleting.md
    my $self = shift;
    my $what = shift || $self->_meta_loop;
    my $cond = shift || $self->FetchWhereKeys;
    my $row  = $self->Find($cond);
    return undef unless $row;
    $row->update($what);
    my %columns = $row->get_columns;
    $self->$_($columns{$_}) foreach keys %columns;
    return $row;
}

# -------------------------------------------------------------------------------------------------------------
sub Delete {
    my $self = shift;
    my @cond = scalar(@_) ? @_ : ($self->FetchWhereKeys);
    my $row  = $self->ResultSet->find(@cond);
    return 0 unless $row;
    return $row->delete->in_storage;
}

# -------------------------------------------------------------------------------------------------------------
sub DeleteIgnore {
    my $self = shift;
    return 0 unless $self->ResultSet->find($self->_meta_loop);
    $self->Storage->dbh_do(
        sub {
            my ($storage, $dbh, $class) = @_;
            my $table     = $class->ResultSource->name();
            my $condition = $class->FetchWhereKeys;
            my $sql       = "DELETE IGNORE FROM \`$table\`";
            if ($condition) {
                my @cols = keys %$condition;
                my @vals = map { $$condition{$_} } @cols;
                $sql .= ' WHERE ( ' . join('and', map {"\`$_\` = ?"} @cols) . ' )';
                print "$sql: " . join(',', qq(@vals)) . "\n" if $ENV{DBIC_TRACE};
                return $dbh->do($sql, undef, @vals);
            }
            return undef;
        },
        $self
    );
    return $self->ResultSet->find($self->_meta_loop) ? 1 : 0;
}

# -------------------------------------------------------------------------------------------------------------
sub Search {
    my $self = shift;
    $DB::single = 2;
    my @cond = scalar(@_) ? @_ : ($self->FetchWhereKeys);
    push @cond,$self->prefetch if $self->can('prefetch');
    return $self->ResultSet->search(@cond);
}

# -------------------------------------------------------------------------------------------------------------
sub Show { shift->Search(@_)->hashref_array() }

# -------------------------------------------------------------------------------------------------------------
sub Dump { Dumper([shift->Show(@_)]) }

# -------------------------------------------------------------------------------------------------------------
sub Tell { print shift->Dump(@_) }

1;
