package TMS::API::Feature::Features;

use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use namespace::autoclean;
use Devel::Confess;
use Data::Dumper;
use Try::Tiny;

use Moose;

has coreapi => (is => 'rw', required => 1, isa => 'Str', init_arg => undef, lazy_build => 1);
has prefetch => (is => 'rw', required => 0, isa => 'Undef|HashRef|ArrayRef', lazy_build => 1);

sub Core {
    my $self  = shift;
    my $core  = $self->coreapi;
    my $trait = $core . 'Search';
    my $inst  = $core->with_traits($trait)->new();
    return $inst;
} ## end sub Core

sub Search {
    $DB::single = 2;
    my ($self, $post) = @_;
    my $core   = $self->coreapi;
    my $trait  = $core . 'Search';
    my $caller = (caller(1))[3];
    my $method = defined $caller && $caller eq 'TMS::API::Feature::Features::Fetch' ? 'Show' : 'Like';
    my $cond   = undef;
    my %args
        = defined $post
        && ref($post) eq 'HASH'
        && exists $$post{POST}
        && ref($$post{POST}) eq 'HASH' ? %{$$post{POST}} : ();

    my %attrs = ();
    $attrs{_prefetch} = $self->prefetch if defined $self->prefetch;
    $attrs{_rows}     = $args{rows}    if exists $args{rows}    && defined $args{rows};
    $attrs{_page}     = $args{page}    if exists $args{page}    && defined $args{page};
    $attrs{_order_by} = $args{orderby} if exists $args{orderby} && defined $args{orderby};

    if (exists $args{search} && defined $args{search} && ref($args{search})) {
        if (ref($args{search}) eq 'HASH') {
            $attrs{$_} = $args{search}{$_} foreach keys %{$args{search}};
        } elsif (ref($args{search}) eq 'ARRAY') {
            my @and = ();
            foreach my $grp (@{$args{search}}) {
                if (ref($grp) eq 'HASH') {
                    my @or = ();
                    foreach my $cl (keys %$grp) {
                        if (!(defined $$grp{$cl})) {
                            push @or, $cl => {'=', undef};
                        } elsif ($method eq 'Show') {
                            push @or, $cl => $$grp{$cl};
                        } else {
                            push @or, $cl => {'like' => "\%$$grp{$cl}\%"};
                        }
                    }
                    push @and, '-or' => \@or;
                } else {
                    local $Data::Dumper::Terse  = 1;
                    local $Data::Dumper::Indent = 3;
                    confess "Found non-hash elemenent in search" . Dumper($grp);
                }
            }
            $cond = {'-and' => \@and};
            $attrs{_flatten} = 0;
        } else {
            $$post{ERROR} = "Search must be either HashRef or an Array of Hashes";
            $$post{DATA}  = undef;
        }
    }

    if (exists $args{strict} && defined $args{strict} && ref($args{strict})) {
        if (ref($args{strict}) eq 'HASH') {
            $attrs{$_} = $args{strict}{$_} foreach keys %{$args{strict}};
        } elsif (ref($args{strict}) eq 'ARRAY') {
            my @and = ();
            foreach my $grp (@{$args{strict}}) {
                if (ref($grp) eq 'HASH') {
                    my @or = ();
                    foreach my $cl (keys %$grp) {
                        push @or, $cl => $$grp{$cl};
                    }
                    if (scalar keys %$grp > 1) {
                        push @and, '-or' => \@or;
                    } else {
                        push @and, \@or;
                    }

                } else {
                    local $Data::Dumper::Terse  = 1;
                    local $Data::Dumper::Indent = 3;
                    confess "Found non-hash elemenent in search" . Dumper($grp);
                }
            }
            push @{$$cond{'-and'}}, @and;
            $attrs{_flatten} = 0;
        } else {
            $$post{ERROR} = "Search must be either HashRef or an Array of Hashes";
            $$post{DATA}  = undef;
        }
    }

    try {
        my $inst = $core->with_traits($trait)->new(%attrs);
        $$post{DATA} = $inst->$method($cond);
    }
    catch {
        $$post{ERROR} = "$_";
    };

    return $post;
} ## end sub Search

sub Fetch {&Search}

sub Update {
    my ($self, $post) = @_;
    my $data     = $$post{POST};
    my $core     = $self->coreapi;
    my $trait    = $core . 'Search';
    my $prefetch = $self->prefetch;

    try {
        my $inst = $core->with_traits($trait)->new($data);
        my $row  = $inst->UpdateOrNew;
        if ($row) {
            my $record = undef;
            $$record{$_} = $inst->$_ foreach $inst->ColumnsList;
            $$post{DATA} = $inst->Show($record, {prefetch => $self->prefetch});
        }
    }
    catch {
        $$post{ERROR} = "$_";
    };

    return $post;
} ## end sub Update

sub Create {
    my ($self, $post) = @_;
    my $data     = $$post{POST};
    my $core     = $self->coreapi;
    my $trait    = $core . 'Strict';
    my $prefetch = $self->prefetch;

    try {
        my $inst = $core->with_traits($trait)->new($data);
        my $row  = $inst->UpdateOrCreate();
        if ($row) {
            my $record = undef;
            $$record{$_} = $inst->$_ foreach $inst->ColumnsList;
            $$post{DATA} = $inst->Show($record, {prefetch => $self->prefetch});
        }
    }
    catch {
        $$post{ERROR} = "$_";
    };

    return $post;
} ## end sub Create

sub Delete {
    my ($self, $post) = @_;
    my $data     = $$post{POST};
    my $core     = $self->coreapi;
    my $trait    = $core . 'Search';
    my $prefetch = $self->prefetch;

    try {
        my $inst = $core->with_traits($trait)->new($data);
        $$post{DATA} = {"records_removed" => defined $inst->Delete ? 'yes' : 'no'};
    }
    catch {
        $$post{ERROR} = "$_";
    };

    return $post;
} ## end sub Delete

1;
