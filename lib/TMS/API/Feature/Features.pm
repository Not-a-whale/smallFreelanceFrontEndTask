package TMS::API::Feature::Features;

use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use namespace::autoclean;
use Devel::Confess;
use Data::Dumper;
use Try::Tiny;

$Data::Dumper::Terse = 1;

use Moose;

has coreapi => (is => 'rw', required => 1, isa => 'Str', init_arg => undef, lazy_build => 1);
has prefetch => (is => 'rw', required => 0, isa => 'Undef|HashRef|ArrayRef', lazy_build => 1);

sub Search {
    my ($self, $user, $pass, $post) = @_;
    my $core   = $self->coreapi;
    my $trait  = $core . 'Search';
    my $caller = (caller(1))[3];
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

    if (exists $args{search} && defined $args{search} && ref($args{search}) eq 'HASH') {
        $attrs{$_} = $args{search}{$_} foreach keys %{$args{search}};
    }

    try {
        my $inst   = $core->with_traits($trait)->new(%attrs);
        my $method = defined $caller && $caller eq 'TMS::API::Feature::Features::Fetch' ? 'Show' : 'Like';
        $$post{DATA} = $inst->$method;
    } catch {
        $$post{ERROR} = $_;
    };

    return $post;
} ## end sub Search

sub Fetch {&Search}

sub Update {
    my ($self, $user, $pass, $post) = @_;
    my $data     = $$post{POST};
    my $core     = $self->coreapi;
    my $trait    = $core . 'Strict';
    my $prefetch = $self->prefetch;

    try {
        my $inst = $core->with_traits($trait)->new($data);
        my $row  = $inst->UpdateOrNew;
        if ($row) {
            my $record = undef;
            $$record{$_} = $inst->$_ foreach $inst->ColumnsList;
            $$post{DATA} = $inst->Show($record, {prefetch => $self->prefetch});
        }
    } catch {
        $$post{ERROR} = $_;
    };
    return $post;
} ## end sub Update

sub Create {
    my ($self, $user, $pass, $post) = @_;
    my $data     = $$post{POST};
    my $core     = $self->coreapi;
    my $trait    = $core . 'Strict';
    my $prefetch = $self->prefetch;

    try {
        my $inst = $core->with_traits($trait)->new($data);
        my $row  = $inst->FindOrCreate();
        if ($row) {
            my $record = undef;
            $$record{$_} = $inst->$_ foreach $inst->ColumnsList;
            $$post{DATA} = $inst->Show($record, {prefetch => $self->prefetch});
        }
    } catch {
        $$post{ERROR} = $_;
    };
    return $post;
} ## end sub Create

sub Delete {
    my ($self, $user, $pass, $post) = @_;
    my $data     = $$post{POST};
    my $core     = $self->coreapi;
    my $trait    = $core . 'Strict';
    my $prefetch = $self->prefetch;

    try {
        my $inst = $core->with_traits($trait)->new($data);
        $$post{DATA} = {"records_removed" => defined $inst->Delete ? 'yes' : 'no' };
    } catch {
        $$post{ERROR} = $_;
    };

    return $post;
} ## end sub Delete

1;
