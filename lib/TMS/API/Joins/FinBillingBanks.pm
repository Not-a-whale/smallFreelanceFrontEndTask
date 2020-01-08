package TMS::API::Joins::FinBillingBanks;
use Moose;
use TMS::API::Joins::VendorBranch;
extends 'TMS::API::Joins::Prefetch';

sub _build_prefetch {
    shift->prefetch(
        [
            TMS::API::Joins::VendorBranch->new->joins('institution'),
            'void_check',
            'fin_billing_rules'
        ]
    );
}
1;
