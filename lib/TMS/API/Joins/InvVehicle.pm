package TMS::API::Joins::InvVehicle;
use Moose;
use TMS::API::Joins::InvEquipment;
extends 'TMS::API::Joins::Prefetch';

sub _build_prefetch {
    shift->prefetch(
        [
            'carrier',
            TMS::API::Joins::InvEquipment->new->joins('vehicle'),
            'crr_ifta_decals',
            'crr_state_permits',
            'tire_size',
        ]
    );
}
1;
