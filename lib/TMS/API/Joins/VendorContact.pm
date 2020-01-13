package TMS::API::Joins::VendorContact;
use Moose;
use TMS::API::Joins::VendorPerson;
use TMS::API::Joins::PhonesFaxes;
use TMS::API::Joins::BizCompanyNodes;
extends 'TMS::API::Joins::Prefetch';
sub _build_prefetch {
    shift->prefetch(
        [
            TMS::API::Joins::VendorPerson->new->joins('ast_vendor'),
            TMS::API::Joins::PhonesFaxes->new->joins('biz_phone_vendor'),
            TMS::API::Joins::PhonesFaxes->new->joins('biz_fax_vendor'),
        ]
    );
};

1;

