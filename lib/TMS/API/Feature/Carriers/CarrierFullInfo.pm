package TMS::API::Feature::Carriers::CarrierFullInfo;
use Moose;
use TMS::API::Core::EntCarrier;

use TMS::API::Joins::CarrierFullInfo;
extends 'TMS::API::Feature::Features';

sub _build_coreapi  { shift->coreapi('TMS::API::Core::EntCarrier') }
sub _build_prefetch { shift->prefetch(TMS::API::Joins::CarrierFullInfo->new->prefetch) }

1;
