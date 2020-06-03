package TMS::API::Feature::Business::Contact;
use Moose;

use TMS::API::Core::BizBranch;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::DrvDriver;
use TMS::API::Core::EntBusiness;
use TMS::API::Core::EntPerson;
use TMS::API::Core::HrAssociate;
use TMS::API::Core::HrHireRecord;

extends 'TMS::API::Feature::Features';

has coreapi => (
    is       => 'ro',
    required => 1,
    isa      => 'Str',
    init_arg => undef,
    default  => 'TMS::API::Core::HrAssociate'
);
has prefetch => (
    is         => 'rw',
    required   => 0,
    isa        => 'Undef|HashRef|ArrayRef',
    lazy_build => 1
);

sub _build_prefetch {
    shift->prefetch(
        [   { 'ast' => [ { 'brnch' => ['biz'] } ] }, 'biz_fax',
            'biz_phone', 'drv_driver',
            'hr_hire_records'
        ]
    );
}

1;
