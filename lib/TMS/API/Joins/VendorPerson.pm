package TMS::API::Joins::VendorPerson;
use Moose;
use TMS::API::Joins::VendorBranch;
extends 'TMS::API::Joins::Prefetch';
sub _build_prefetch {
    shift->prefetch(
        [
            TMS::API::Joins::VendorBranch->new->joins('brnch_vendor'),
        ]
    );
};
1;
