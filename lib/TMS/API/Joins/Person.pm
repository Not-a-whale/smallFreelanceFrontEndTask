package TMS::API::Joins::Person;
use Moose;
use TMS::API::Joins::OfficeBranch;
extends 'TMS::API::Joins::Prefetch';
sub _build_prefetch {
    shift->prefetch(
        [
            TMS::API::Joins::OfficeBranch->new->joins('brnch'),
        ]
    );
};
1;
