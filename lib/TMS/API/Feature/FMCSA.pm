package TMS::API::Feature::FMCSA;
use Moose;

use TMS::API::Core::BizBranch;
use TMS::API::Core::CntAddress;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::CrrStatistic;
use TMS::API::Core::EntBusiness;
use TMS::API::Core::EntCarrier;

extends 'TMS::API::Feature::Features';

has coreapi => (
    is       => 'ro',
    required => 1,
    isa      => 'Str',
    init_arg => undef,
    default  => 'TMS::API::Core::EntCarrier'
);
has prefetch => (
    is         => 'rw',
    required   => 0,
    isa        => 'Undef|HashRef|ArrayRef',
    lazy_build => 1
);

sub _build_prefetch {
    shift->prefetch(
        [   {   'carrier' => [
                    {   'biz_branches' =>
                            [ 'brnch_address', 'brnch_fax', 'brnch_phone' ]
                    }
                ]
            },
            'crr_statistics'
        ]
    );
}

1;
