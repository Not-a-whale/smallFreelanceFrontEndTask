package TMS::API::Feature::BusinessNames::EntBusiness;
use Moose;
use TMS::API::Core::EntBusiness;
use TMS::API::Joins::BusinessNames;
extends 'TMS::API::Feature::Features';

sub _build_coreapi  { shift->coreapi('TMS::API::Core::EntBusiness') }
sub _build_prefetch { shift->prefetch(TMS::API::Joins::BusinessNames->new->prefetch) }

1;
