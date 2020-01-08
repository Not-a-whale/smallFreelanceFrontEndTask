package TMS::API::Joins::InsurancePolicies;
use Moose;
use TMS::API::Joins::Associates;
extends 'TMS::API::Joins::Prefetch';
sub _build_prefetch {
    shift->prefetch(
        [
            'proof_of_insurance',
            TMS::API::Joins::Associates->new->joins('provider_agent'),
        ]
    );
};
1;
