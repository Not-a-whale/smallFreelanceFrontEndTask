package TMS::API::Feature::Inventory::InvEquipment;
use Moose;
use TMS::API::Core::InvEquipment;
use TMS::API::Joins::InvEquipment;
extends 'TMS::API::Feature::Features';

sub _build_coreapi  { shift->coreapi('TMS::API::Core::InvEquipment') }
sub _build_prefetch { shift->prefetch(TMS::API::Joins::InvEquipment->new->prefetch) }

1;
