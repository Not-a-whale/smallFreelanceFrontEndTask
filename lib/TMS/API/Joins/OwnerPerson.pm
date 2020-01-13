package TMS::API::Joins::OwnerPerson;
use Moose;
use TMS::API::Joins::OwnerBranch;
extends 'TMS::API::Joins::Prefetch';
sub _build_prefetch {
    shift->prefetch(
        [
            TMS::API::Joins::OwnerBranch->new->joins('brnch_owner'),
        ]
    );
};
1;
