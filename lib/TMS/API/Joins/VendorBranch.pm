package TMS::API::Joins::VendorBranch;
use Moose;
use TMS::API::Joins::Addresses;
use TMS::API::Joins::PhonesFaxes;
use TMS::API::Joins::BusinessNames;
extends 'TMS::API::Joins::Prefetch';

sub _build_prefetch {
    shift->prefetch(
        [
            TMS::API::Joins::BusinessNames->new->joins('vendor_biz'),
            TMS::API::Joins::Addresses->new->joins('vendor_address'),
            TMS::API::Joins::PhonesFaxes->new->joins('vendor_phone'),
            TMS::API::Joins::PhonesFaxes->new->joins('vendor_fax'),
        ]
    );
}
1;
