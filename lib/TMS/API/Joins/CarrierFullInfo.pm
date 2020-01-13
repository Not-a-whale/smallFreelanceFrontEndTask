package TMS::API::Joins::CarrierFullInfo;
use Moose;
use TMS::API::Joins::FinBillingSimple;
use TMS::API::Joins::BusinessBranchesPrimary;
extends 'TMS::API::Joins::Prefetch';

sub _build_prefetch {
    [
        'crr_permit_accounts',
        { 'carrier' => [
                'crr_iftas',
                {
                    'entity' => [
                        {
                            'ins_to_entities' => [ 'ins' ]
                        },
                        TMS::API::Joins::FinBillingSimple->new->joins('fin_billing_infos')
                    ]
                },
                TMS::API::Joins::BusinessBranchesPrimary->new->joins('biz_branches')
            ]
        }
    ]
}
1;
