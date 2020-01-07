package TMS::API::Feature::Carriers::CarrierBranches;
use Moose;
use TMS::API::Core::BizBranch;

use TMS::API::Joins::CarrierBranches;
extends 'TMS::API::Feature::Features';

sub _build_coreapi  { shift->coreapi('TMS::API::Core::BizBranch') }
sub _build_prefetch { shift->prefetch(TMS::API::Joins::CarrierBranches->new->prefetch) }

1;
