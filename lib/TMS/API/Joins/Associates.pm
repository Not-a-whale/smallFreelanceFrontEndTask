package TMS::API::Joins::Associates;
use Moose;
use TMS::API::Joins::Person;
use TMS::API::Joins::PhonesFaxes;
use TMS::API::Joins::BizCompanyNodes;
extends 'TMS::API::Joins::Prefetch';
sub _build_prefetch {
    shift->prefetch(
        [
            TMS::API::Joins::Person->new->joins('ast'),
            TMS::API::Joins::BizCompanyNodes->new->joins('node'),
            TMS::API::Joins::PhonesFaxes->new->joins('biz_phone'),
            TMS::API::Joins::PhonesFaxes->new->joins('biz_fax'),
        ]
    );
};
1;
