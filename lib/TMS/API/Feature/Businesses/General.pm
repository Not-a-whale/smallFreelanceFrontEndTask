package TMS::API::Feature::Businesses::General;
use Moose;
use TMS::API::Core::EntBusiness;
use TMS::API::Core::FinBillingTag;
use TMS::API::Joins::BusinessBranchesAndBilling;

extends 'TMS::API::Feature::Features';

sub _build_coreapi { shift->coreapi('TMS::API::Core::EntBusiness') }
sub _build_prefetch { shift->prefetch(TMS::API::Joins::BusinessBranchesAndBilling->new->prefetch) }
1;
