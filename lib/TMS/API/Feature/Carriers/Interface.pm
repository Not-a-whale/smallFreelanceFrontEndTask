package TMS::API::Feature::Carriers::Interface;

use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use Devel::Confess;
use Data::Dumper;
use Try::Tiny;

use TMS::API::Feature::Carriers::EntCarrier;

sub default {shift}

sub create {
    my $post = shift;
    my $args = $$post{POST};
    my $obj  = TMS::API::Feature::Carriers::EntCarrier->new();
    try {
        my $row = $obj->create($args);
        if ($row) {
            $$post{DATA} = $obj->Show({'CarrierId' => $row->id});
        }
    } catch {
        $$post{ERROR} = $_;
    };

    return $post;
}

sub search {
    my $post = shift;
    my $obj  = TMS::API::Feature::Carriers::EntCarrier->new();
    $$post{DATA} = $obj->Show();
    return $post;
}

1;
