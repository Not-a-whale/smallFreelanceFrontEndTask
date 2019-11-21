package TMS::API::Feature::BizSimple::EntBusiness;

use strict;
use warnings FATAL => 'all';

use Moose;
use TMS::API::Feature::MixedUtils qw(Sift);

extends 'TMS::API::Core::EntBusiness';

my $TREE = {
    BizId    => {required => 0},
    BizName  => {required => 1},
    BizURL   => {required => 0},
    RootNode => {required => 0},
};

has "+BizName" => (required => 0);

sub Sifter {
    my $rec = Sift(shift, $TREE);
    delete $$rec{RootNode} if exists $$rec{RootNode};
    return $rec;
}

1;

