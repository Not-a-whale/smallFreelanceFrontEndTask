package TMS::Test::Core::SftLogEntry;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::DspTrip;
use TMS::API::Core::EntPerson;
use TMS::API::Core::InvEquipmentType;
use TMS::API::Core::CntAddress;
use TMS::API::Core::SftElogStat;
use TMS::API::Core::BizBranch;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::HrAssociate;
use TMS::API::Core::DrvDriver;
use TMS::API::Core::InvEquipment;
use TMS::API::Core::SftLogbook;
use TMS::API::Core::EntBusiness;

my $attr = {
    'driver' => {
        'driver' => {
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
        'InternationalRoutes' => ' ',
        'PullNotice'          => ' ',
        'LocalRoutes'         => ' ',
        'LastAnnualReview'    => ' '
    },
    'location' => {
        'equipment' => {
            'equipment_type' => {'Name' => ' '},
            'owner'          => {
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
            'vendor' => {
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
            'GeneralName'    => ' ',
            'DateSold'       => ' ',
            'PricePurchased' => ' ',
            'SerialNo'       => ' ',
            'DatePurchased'  => ' ',
            'PriceSold'      => ' '
        },
        'LocationProviderId' => ' ',
        'VehicleState'       => ' ',
        'EngineHours'        => ' ',
        'Speed'              => ' ',
        'Fuel'               => ' ',
        'Longitude'          => ' ',
        'Posted'             => ' ',
        'Latitude'           => ' ',
        'Odometer'           => ' ',
        'Acquired'           => ' ',
        'Bearings'           => ' '
    },
    'logbook' => {
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
        'DateStarted' => ' ',
        'Notes'       => ' '
    },
    'StartTime' => ' ',
    'Activity'  => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::SftLogEntry';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
