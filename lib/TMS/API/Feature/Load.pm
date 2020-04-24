package TMS::API::Feature::Load;
use Moose;

use TMS::API::Core::BizBranch;
use TMS::API::Core::CntAddress;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::DspLoad;
use TMS::API::Core::DspLoadsDestination;
use TMS::API::Core::DspLoadsDestinationsDoc;
use TMS::API::Core::DspLoadsDoc;
use TMS::API::Core::DspLoadsRequiredEquipment;
use TMS::API::Core::EntBusiness;
use TMS::API::Core::EntCustomer;
use TMS::API::Core::EntPerson;
use TMS::API::Core::EntShipper;
use TMS::API::Core::FinJob;
use TMS::API::Core::GenFile;
use TMS::API::Core::HrAssociate;
use TMS::API::Core::InvEquipmentType;
use TMS::API::Core::InvTrailerType;

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
        [   {   'booked_by' => [
                    {   'ast' => [
                            {   'brnch' => [
                                    'biz',       'brnch_address',
                                    'brnch_fax', 'brnch_phone'
                                ]
                            }
                        ]
                    }
                ]
            },
            { 'broker' => ['cstmr'] },
            'job',
            { 'shipper' => ['shipper'] },
            'truck_type',
            {   'dsp_loads_destinations' => [
                    {   'branch' => [
                            'biz',       'brnch_address',
                            'brnch_fax', 'brnch_phone'
                        ]
                    },
                    { 'dsp_loads_destinations_docs' => ['file'] }
                ]
            },
            { 'dsp_loads_docs'                => ['file'] },
            { 'dsp_loads_required_equipments' => ['equipment_type'] }
        ]
    );
}

1;
