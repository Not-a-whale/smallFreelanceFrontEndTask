package TMS::API::Joins::InvVehicle;
use Moose;
extends 'TMS::API::Joins::Prefetch';

sub _build_prefetch {
    shift->prefetch(
        [
            'carrier',
            'crr_ifta_decals',
            'crr_state_permits',
            'vehicle'
        ]
    );
}
1;
