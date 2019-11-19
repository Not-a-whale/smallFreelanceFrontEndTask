package TMS::API::Feature::PhonesFaxes::CntPhonesfax;

use strict;
use warnings FATAL => 'all';
use Moose;

extends 'TMS::API::Core::CntPhonesfax';

my $TREE = {
    PhnFaxId  => {required => 0,},
    Number    => {required => 1,},
    Extension => {required => 0,},
    Features  => {required => 0,},
    Mobility  => {required => 0,},
    Notes     => {required => 0,},
};

has "+Number" => (required => 0);

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

