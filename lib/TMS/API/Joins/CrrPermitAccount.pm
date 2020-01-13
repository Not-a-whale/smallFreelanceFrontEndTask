package TMS::API::Joins::CrrPermitAccount;
use Moose;
extends 'TMS::API::Joins::Prefetch';
sub _build_prefetch {
    shift->prefetch(
        [
            'carrier',
            'crr_permit_account_docs',
            'crr_state_permits'
        ]
    );
};

1;
