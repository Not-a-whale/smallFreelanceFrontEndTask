package TMS::API::Feature::Load::Detail;
use Moose;

use TMS::API::Core::BizBranch;
use TMS::API::Core::CntAddress;
use TMS::API::Core::DspLoad;
use TMS::API::Core::DspLoadsDestination;
use TMS::API::Core::DspLoadsDoc;
use TMS::API::Core::DspLoadsRequiredEquipment;
use TMS::API::Core::EntBusiness;
use TMS::API::Core::EntPerson;
use TMS::API::Core::FinJob;
use TMS::API::Core::GenFile;
use TMS::API::Core::HrAssociate;
use TMS::API::Core::InvEquipmentType;

extends 'TMS::API::Feature::Features';

has coreapi => (
    is       => 'ro',
    required => 1,
    isa      => 'Str',
    init_arg => undef,
    default  => 'TMS::API::Core::DspLoad'
);
has prefetch => (
    is         => 'rw',
    required   => 0,
    isa        => 'Undef|HashRef|ArrayRef',
    lazy_build => 1
);

sub _build_prefetch {
    shift->prefetch(
        [   'customer',
            { 'customer_agent' => ['ast'] },
            'job', 'vendor',
            { 'vendor_agent' => ['ast'] },
            {   'dsp_loads_destinations' =>
                    [ { 'location' => [ 'biz', 'brnch_address' ] } ]
            },
            { 'dsp_loads_docs'                => ['file'] },
            { 'dsp_loads_required_equipments' => ['equipment_type'] }
        ]
    );
}

1;
