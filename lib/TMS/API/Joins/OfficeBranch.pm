package TMS::API::Joins::OfficeBranch;
use Moose;
use TMS::API::Joins::Addresses;
use TMS::API::Joins::PhonesFaxes;
use TMS::API::Joins::BusinessNames;
extends 'TMS::API::Joins::Prefetch';

sub _build_prefetch {
    shift->prefetch(
        [
            TMS::API::Joins::BusinessNames->new->joins('biz'),
            TMS::API::Joins::Addresses->new->joins('brnch_address'),
            TMS::API::Joins::PhonesFaxes->new->joins('brnch_phone'),
            TMS::API::Joins::PhonesFaxes->new->joins('brnch_fax'),
        ]
    );
}
1;
