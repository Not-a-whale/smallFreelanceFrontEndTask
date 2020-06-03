package TMS::API::Feature::Branch::Info;
use Moose;

use TMS::API::Core::BizBranch;
use TMS::API::Core::CntAddress;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::EntBusiness;
use TMS::API::Core::EntPerson;
use TMS::API::Core::Entity;
use TMS::API::Core::HrAssociate;

extends 'TMS::API::Feature::Features';

has coreapi => (
    is       => 'ro',
    required => 1,
    isa      => 'Str',
    init_arg => undef,
    default  => 'TMS::API::Core::BizBranch'
);
has prefetch => (
    is         => 'rw',
    required   => 0,
    isa        => 'Undef|HashRef|ArrayRef',
    lazy_build => 1
);

sub _build_prefetch {
    shift->prefetch(
        [   'biz',
            'brnch_address',
            'brnch_fax',
            'brnch_phone',
            {   'primary_contact' => [
                    'entity', { 'hr_associate' => [ 'biz_fax', 'biz_phone' ] }
                ]
            }
        ]
    );
}

1;
