package TMS::API::Feature::Businesses::General;
use Moose;
use TMS::API::Core::EntBusiness;
use TMS::API::Joins::OfficeBranch;

extends 'TMS::API::Feature::Features';

sub _build_coreapi { shift->coreapi('TMS::API::Core::EntBusiness') }
sub _build_prefetch {
    shift->prefetch(
        [
            TMS::API::Joins::OfficeBranch->new->joins('biz_branches'),
            TMS::API::Joins::EntityBilling->new->joins('entity')
        ]
    );
}
1;
