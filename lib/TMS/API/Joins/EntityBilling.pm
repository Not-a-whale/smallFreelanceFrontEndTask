package TMS::API::Joins::EntityBilling;

use Moose;
use TMS::API::Joins::FinBillingInfos;
extends 'TMS::API::Joins::Prefetch';

sub _build_prefetch {
    shift->prefetch(
        [
            'fin_tax_id',
            TMS::API::Joins::FinBillingInfos->new->joins('fin_billing_infos')
        ]
    );
}
1;

