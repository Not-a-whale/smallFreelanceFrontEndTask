package TMS::API::Joins::InvVehicle;
use Moose;
use TMS::API::Joins::InvEquipment;
use TMS::API::Joins::CrrIftaDecal;
extends 'TMS::API::Joins::Prefetch';

sub _build_prefetch {
    shift->prefetch(
        [
            'carrier',
            TMS::API::Joins::InvEquipment->new->joins('vehicle'),
            TMS::API::Joins::CrrIftaDecal->new->joins('crr_ifta_decals'),
            'crr_state_permits',
            'tire_size',
        ]
    );
}
1;
