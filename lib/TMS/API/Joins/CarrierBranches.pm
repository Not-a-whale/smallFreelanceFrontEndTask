package TMS::API::Joins::CarrierBranches;

use Moose;
extends 'TMS::API::Joins::Prefetch';

sub _build_prefetch {
    [
        {
            'biz' => [
                {
                    'entity' => [
                        {
                            'ins_to_entities' => [ 'ins' ]
                        }
                    ]
                },
                'has_carrier'
            ]
        }
    ]
}
1;
