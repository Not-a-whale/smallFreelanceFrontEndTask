package TMS::API::Joins::BusinessBranchesPrimary;
use Moose;
use TMS::API::Joins::OfficeBranch;
extends 'TMS::API::Joins::Prefetch';
sub _build_prefetch {
    [
        @{TMS::API::Joins::OfficeBranch->new->prefetch},
        { 'primary_contact' => [ 'hr_primary' ] },
    ]
}
1;
