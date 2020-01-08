package TMS::API::Feature::Insurance::InsPolicy;
use Moose;
use TMS::API::Core::InsPolicy;
use TMS::API::Joins::InsurancePolicies;
extends 'TMS::API::Feature::Features';

sub _build_coreapi  { shift->coreapi('TMS::API::Core::InsPolicy') }
sub _build_prefetch { shift->prefetch(TMS::API::Joins::InsurancePolicies->new->prefetch) }

1;
