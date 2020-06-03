package TMS::API::Feature::Business::Driver::Detail;
use Moose;

use TMS::API::Core::BizBranch;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::DrvDriver;
use TMS::API::Core::EntPerson;
use TMS::API::Core::Entity;
use TMS::API::Core::HrAssociate;

extends 'TMS::API::Feature::Features';

has coreapi => (
    is       => 'ro',
    required => 1,
    isa      => 'Str',
    init_arg => undef,
    default  => 'TMS::API::Core::DrvDriver'
);
has prefetch => (
    is         => 'rw',
    required   => 0,
    isa        => 'Undef|HashRef|ArrayRef',
    lazy_build => 1
);

sub _build_prefetch {
    shift->prefetch(
        [   {   'driver' => [
                    { 'ast' => [ 'brnch', 'entity' ] }, 'biz_fax',
                    'biz_phone'
                ]
            }
        ]
    );
}

1;
