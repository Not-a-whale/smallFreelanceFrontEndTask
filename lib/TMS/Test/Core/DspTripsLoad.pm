package TMS::Test::Core::DspTripsLoad;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::InvTrailerType;
use TMS::API::Core::DspTrip;
use TMS::API::Core::DspLoad;
use TMS::API::Core::EntPerson;
use TMS::API::Core::EntShipper;
use TMS::API::Core::FinJob;
use TMS::API::Core::EntCustomer;
use TMS::API::Core::CntAddress;
use TMS::API::Core::BizBranch;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::HrAssociate;
use TMS::API::Core::EntBusiness;

my $attr = {
    'load' => {
        'booked_by' => {
            'ast' => {
                'brnch' => {
                    'biz' => {
                        'BizName' => ' ',
                        'BizURL'  => ' '
                    },
                    'brnch_address' => {
                        'Street3' => ' ',
                        'State'   => ' ',
                        'Street2' => ' ',
                        'Notes'   => ' ',
                        'GpsLng'  => ' ',
                        'City'    => ' ',
                        'GpsLat'  => ' ',
                        'Street1' => ' ',
                        'Country' => ' ',
                        'Zip'     => ' '
                    },
                    'brnch_fax' => {
                        'Extension' => ' ',
                        'Features'  => ' ',
                        'Notes'     => ' ',
                        'Mobility'  => ' ',
                        'Number'    => ' '
                    },
                    'brnch_phone' => {
                        'Extension' => ' ',
                        'Features'  => ' ',
                        'Notes'     => ' ',
                        'Mobility'  => ' ',
                        'Number'    => ' '
                    },
                    'OfficeName' => ' ',
                    'BrnchEMail' => ' '
                },
                'MiddleName' => ' ',
                'NickName'   => ' ',
                'FirstName'  => ' ',
                'Prefix'     => ' ',
                'LastName'   => ' ',
                'Suffix'     => ' '
            },
            'biz_fax' => {
                'Extension' => ' ',
                'Features'  => ' ',
                'Notes'     => ' ',
                'Mobility'  => ' ',
                'Number'    => ' '
            },
            'biz_phone' => {
                'Extension' => ' ',
                'Features'  => ' ',
                'Notes'     => ' ',
                'Mobility'  => ' ',
                'Number'    => ' '
            },
            'AuthorityLevel' => ' ',
            'Notes'          => ' ',
            'PrimaryContact' => ' ',
            'CurrentTitle'   => ' ',
            'DateCreated'    => ' ',
            'DateRemoved'    => ' ',
            'NodeId'         => ' ',
            'BizEmail'       => ' '
        },
        'broker' => {
            'cstmr' => {
                'BizName' => ' ',
                'BizURL'  => ' '
            },
            'Bond'             => ' ',
            'Factoring'        => ' ',
            'DontUse'          => ' ',
            'WhyDontUse'       => ' ',
            'MC'               => ' ',
            'DOT'              => ' ',
            'SCAC'             => ' ',
            'Terms'            => ' ',
            'DUNS'             => ' ',
            'CreditLimit'      => ' ',
            'RequireOriginals' => ' '
        },
        'created_by' => {
            'ast' => {
                'brnch' => {
                    'biz' => {
                        'BizName' => ' ',
                        'BizURL'  => ' '
                    },
                    'brnch_address' => {
                        'Street3' => ' ',
                        'State'   => ' ',
                        'Street2' => ' ',
                        'Notes'   => ' ',
                        'GpsLng'  => ' ',
                        'GpsLat'  => ' ',
                        'City'    => ' ',
                        'Street1' => ' ',
                        'Country' => ' ',
                        'Zip'     => ' '
                    },
                    'brnch_fax' => {
                        'Extension' => ' ',
                        'Features'  => ' ',
                        'Notes'     => ' ',
                        'Mobility'  => ' ',
                        'Number'    => ' '
                    },
                    'brnch_phone' => {
                        'Extension' => ' ',
                        'Features'  => ' ',
                        'Notes'     => ' ',
                        'Mobility'  => ' ',
                        'Number'    => ' '
                    },
                    'OfficeName' => ' ',
                    'BrnchEMail' => ' '
                },
                'MiddleName' => ' ',
                'NickName'   => ' ',
                'FirstName'  => ' ',
                'Prefix'     => ' ',
                'LastName'   => ' ',
                'Suffix'     => ' '
            },
            'biz_fax' => {
                'Extension' => ' ',
                'Features'  => ' ',
                'Notes'     => ' ',
                'Mobility'  => ' ',
                'Number'    => ' '
            },
            'biz_phone' => {
                'Extension' => ' ',
                'Features'  => ' ',
                'Notes'     => ' ',
                'Mobility'  => ' ',
                'Number'    => ' '
            },
            'AuthorityLevel' => ' ',
            'Notes'          => ' ',
            'PrimaryContact' => ' ',
            'CurrentTitle'   => ' ',
            'DateCreated'    => ' ',
            'DateRemoved'    => ' ',
            'NodeId'         => ' ',
            'BizEmail'       => ' '
        },
        'job' => {
            'Title'      => ' ',
            'JobCreated' => ' ',
            'JobAddedBy' => ' '
        },
        'shipper' => {
            'shipper' => {
                'BizName' => ' ',
                'BizURL'  => ' '
            },
            'Notes' => ' '
        },
        'truck_type'     => {},
        'DateBooked'     => ' ',
        'LoadRate'       => ' ',
        'ProNumber'      => ' ',
        'ReeferTempHigh' => ' ',
        'TempMode'       => ' ',
        'Status'         => ' ',
        'Precooling'     => ' ',
        'DispatchNote'   => ' ',
        'DateCreated'    => ' ',
        'ReeferTempLow'  => ' ',
        'TeamRequired'   => ' ',
        'GoogleRoute'    => ' ',
        'LoadNumber'     => ' ',
        'LoadType'       => ' '
    },
    'load_dispatcher' => {
        'ast' => {
            'brnch' => {
                'biz' => {
                    'BizName' => ' ',
                    'BizURL'  => ' '
                },
                'brnch_address' => {
                    'Street3' => ' ',
                    'State'   => ' ',
                    'Street2' => ' ',
                    'Notes'   => ' ',
                    'GpsLng'  => ' ',
                    'GpsLat'  => ' ',
                    'City'    => ' ',
                    'Street1' => ' ',
                    'Country' => ' ',
                    'Zip'     => ' '
                },
                'brnch_fax' => {
                    'Extension' => ' ',
                    'Features'  => ' ',
                    'Notes'     => ' ',
                    'Mobility'  => ' ',
                    'Number'    => ' '
                },
                'brnch_phone' => {
                    'Extension' => ' ',
                    'Features'  => ' ',
                    'Notes'     => ' ',
                    'Mobility'  => ' ',
                    'Number'    => ' '
                },
                'OfficeName' => ' ',
                'BrnchEMail' => ' '
            },
            'NickName'   => ' ',
            'Prefix'     => ' ',
            'LastName'   => ' ',
            'MiddleName' => ' ',
            'FirstName'  => ' ',
            'Suffix'     => ' '
        },
        'biz_fax' => {
            'Extension' => ' ',
            'Notes'     => ' ',
            'Mobility'  => ' ',
            'Number'    => ' ',
            'Features'  => ' '
        },
        'biz_phone' => {
            'Extension' => ' ',
            'Notes'     => ' ',
            'Mobility'  => ' ',
            'Number'    => ' ',
            'Features'  => ' '
        },
        'AuthorityLevel' => ' ',
        'Notes'          => ' ',
        'PrimaryContact' => ' ',
        'CurrentTitle'   => ' ',
        'DateCreated'    => ' ',
        'DateRemoved'    => ' ',
        'NodeId'         => ' ',
        'BizEmail'       => ' '
    },
    'trip' => {
        'created_by' => {
            'ast' => {
                'brnch' => {
                    'biz' => {
                        'BizName' => ' ',
                        'BizURL'  => ' '
                    },
                    'brnch_address' => {
                        'Street3' => ' ',
                        'State'   => ' ',
                        'Street2' => ' ',
                        'Notes'   => ' ',
                        'GpsLng'  => ' ',
                        'GpsLat'  => ' ',
                        'City'    => ' ',
                        'Street1' => ' ',
                        'Country' => ' ',
                        'Zip'     => ' '
                    },
                    'brnch_fax' => {
                        'Extension' => ' ',
                        'Features'  => ' ',
                        'Notes'     => ' ',
                        'Mobility'  => ' ',
                        'Number'    => ' '
                    },
                    'brnch_phone' => {
                        'Extension' => ' ',
                        'Features'  => ' ',
                        'Notes'     => ' ',
                        'Mobility'  => ' ',
                        'Number'    => ' '
                    },
                    'OfficeName' => ' ',
                    'BrnchEMail' => ' '
                },
                'MiddleName' => ' ',
                'NickName'   => ' ',
                'FirstName'  => ' ',
                'Prefix'     => ' ',
                'LastName'   => ' ',
                'Suffix'     => ' '
            },
            'biz_fax' => {
                'Extension' => ' ',
                'Features'  => ' ',
                'Notes'     => ' ',
                'Mobility'  => ' ',
                'Number'    => ' '
            },
            'biz_phone' => {
                'Extension' => ' ',
                'Features'  => ' ',
                'Notes'     => ' ',
                'Mobility'  => ' ',
                'Number'    => ' '
            },
            'AuthorityLevel' => ' ',
            'Notes'          => ' ',
            'PrimaryContact' => ' ',
            'CurrentTitle'   => ' ',
            'DateCreated'    => ' ',
            'DateRemoved'    => ' ',
            'NodeId'         => ' ',
            'BizEmail'       => ' '
        },
        'DateBooked'     => ' ',
        'IsValid'        => ' ',
        'DateStarted'    => ' ',
        'Notes'          => ' ',
        'DateDispatched' => ' ',
        'DateCreated'    => ' ',
        'TripStatus'     => ' ',
        'GoogleRoute'    => ' ',
        'DateCompleted'  => ' ',
        'TripNumber'     => ' '
    },
    'DateDispatched' => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::DspTripsLoad';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
