package TMS::API::Joins::BusinessBranchesAndBilling;
use Moose;
use TMS::API::Joins::OfficeBranch;
use TMS::API::Joins::EntityBilling;
extends 'TMS::API::Joins::Prefetch';
sub _build_prefetch {
    [
        TMS::API::Joins::OfficeBranch->new->joins('biz_branches'),
        TMS::API::Joins::EntityBilling->new->joins('entity')
    ]
}
1;
