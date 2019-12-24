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

sub Search {
    my ($self, $post) = @_;
    my $core  = $self->coreapi;
    my $trait = $core . 'Search';
    my %args
        = defined $post
        && ref($post) eq 'HASH'
        && exists $$post{POST}
        && ref($$post{POST}) eq 'HASH' ? %{$$post{POST}} : ();

    my %attrs = ();
    $attrs{_prefetch} = $self->prefetch if defined $self->prefetch;
    $attrs{_rows} = $args{rows} if exists $args{rows} && defined $args{rows};
    $attrs{_page} = $args{page} if exists $args{page} && defined $args{page};

    if (exists $args{search} && defined $args{search} && ref($args{search}) eq 'HASH') {
        $attrs{$_} = $args{search}{$_} foreach keys %{$args{search}};
    }

    try {
        my $inst = $core->with_traits($trait)->new(%attrs);
        $$post{DATA} = $inst->Like();
    } catch {
        $$post{ERROR} = $_;
    };

    return $post;
}

sub Create {
    my ($self, $post) = @_;
    my $data     = $$post{POST};
    my $core     = $self->coreapi;
    my $trait    = $core . 'Strict';
    my $prefetch = $self->prefetch;

    my $inst = $core->with_traits($trait)->new($data);
    my $row  = $inst->Find;
    if ($row) {
        my $update = undef;
        foreach ($inst->ColumnsList) {
            $$update{$_} = $inst->$_;
        }
        print STDERR "--------------------------------------------------\n";
        $row->update($update);

        return $inst->Show($update, {prefetch => $inst->_prefetch});
    }
}

1;
