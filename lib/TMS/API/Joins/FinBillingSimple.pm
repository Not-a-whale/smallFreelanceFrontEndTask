package TMS::API::Joins::FinBillingSimple;
use Moose;
use TMS::API::Joins::Addresses;
use TMS::API::Joins::PhonesFaxes;
use TMS::API::Joins::FinBillingTags;

extends 'TMS::API::Joins::Prefetch';
sub _build_prefetch {
    shift->prefetch(
        [
            TMS::API::Joins::FinBillingTags->new->joins('billing_tag'),
            TMS::API::Joins::Addresses->new->joins('address'),
            TMS::API::Joins::PhonesFaxes->new->joins('phone'),
            TMS::API::Joins::PhonesFaxes->new->joins('fax',),
        ]
    );
}

1;
