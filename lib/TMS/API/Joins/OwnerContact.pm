package TMS::API::Joins::OwnerContact;
use Moose;
use TMS::API::Joins::OwnerPerson;
use TMS::API::Joins::PhonesFaxes;
use TMS::API::Joins::BizCompanyNodes;
extends 'TMS::API::Joins::Prefetch';
sub _build_prefetch {
    shift->prefetch(
        [
            TMS::API::Joins::OwnerPerson->new->joins('ast_owner'),
            TMS::API::Joins::PhonesFaxes->new->joins('biz_phone_owner'),
            TMS::API::Joins::PhonesFaxes->new->joins('biz_fax_owner'),
        ]
    );
};

1;
