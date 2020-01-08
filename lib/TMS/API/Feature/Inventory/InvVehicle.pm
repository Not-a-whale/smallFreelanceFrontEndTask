package TMS::API::Feature::Inventory::InvVehicle;
use Moose;
use TMS::API::Core::InvVehicle;
use TMS::API::Joins::InvVehicle;

extends 'TMS::API::Feature::Features';

sub _build_coreapi  { shift->coreapi('TMS::API::Core::InvVehicle') }
sub _build_prefetch { shift->prefetch(TMS::API::Joins::InvVehicle->new->prefetch) }

1;
