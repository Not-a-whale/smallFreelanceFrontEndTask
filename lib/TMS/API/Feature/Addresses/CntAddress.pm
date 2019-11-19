package TMS::API::Feature::Addresses::CntAddress;

use strict;
use warnings FATAL => 'all';
use Moose;

extends 'TMS::API::Core::CntAddress';

my $TREE = {
    AddrId  => {required => 0},
    Street1 => {required => 1},
    Street2 => {required => 0},
    Street3 => {required => 0},
    City    => {required => 1},
    Zip     => {required => 1},
    State   => {required => 1},
    Country => {required => 0},
    GpsLng  => {required => 0},
    GpsLat  => {required => 0},
    Notes   => {required => 0},
};

has "+Street1" => (required => 0);
has "+City"    => (required => 0);
has "+Zip"     => (required => 0);
has "+State"   => (required => 0);

sub Sifter {
    my $posts = shift;
    my $flour = {};
    $posts = shift if ref($posts) ne 'HASH';
    foreach (keys %$TREE) {
        $$flour{$_} = $$posts{$_} if exists $$posts{$_} && defined $$posts{$_};
        delete $$flour{$_} if $$TREE{$_}{required} && exists $$flour{$_} && $$flour{$_} !~ /\S/;
        # $$flour{$_} = undef       if !exists $$flour{$_} && $$TREE{$_}{required};
    }

    return $flour;
}

1;

