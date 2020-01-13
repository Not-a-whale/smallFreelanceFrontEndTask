package TMS::API::Joins::OwnerBranch;
use Moose;
use TMS::API::Joins::Addresses;
use TMS::API::Joins::PhonesFaxes;
use TMS::API::Joins::BusinessNames;
extends 'TMS::API::Joins::Prefetch';

sub _build_prefetch {
    shift->prefetch(
        [
            TMS::API::Joins::BusinessNames->new->joins('owner_biz'),
            TMS::API::Joins::Addresses->new->joins('owner_address'),
            TMS::API::Joins::PhonesFaxes->new->joins('owner_phone'),
            TMS::API::Joins::PhonesFaxes->new->joins('owner_fax'),
        ]
    );
}
1;
