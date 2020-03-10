package TMS::Test::Core::SftLogEntry;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::SftElogStat;
use TMS::API::Core::EntBusiness;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::DrvDriver;
use TMS::API::Core::CntAddress;
use TMS::API::Core::HrAssociate;
use TMS::API::Core::DspTrip;
use TMS::API::Core::BizBranch;
use TMS::API::Core::InvEquipment;
use TMS::API::Core::EntPerson;
use TMS::API::Core::InvEquipmentType;
use TMS::API::Core::SftLogbook;

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
                        'GpsLat'  => ' ',
                        'Notes'   => ' ',
                        'Street2' => ' ',
                        'GpsLng'  => ' ',
                        'City'    => ' ',
                        'Street1' => ' ',
                        'State'   => ' ',
                        'Country' => ' ',
                        'Street3' => ' ',
                        'Zip'     => ' '
                    },
                    'brnch_fax' => {
                        'Notes'     => ' ',
                        'Extension' => ' ',
                        'Number'    => ' ',
                        'Features'  => ' ',
                        'Mobility'  => ' '
                    },
                    'brnch_phone' => {
                        'Notes'     => ' ',
                        'Extension' => ' ',
                        'Number'    => ' ',
                        'Features'  => ' ',
                        'Mobility'  => ' '
                    },
                    'OfficeName' => ' ',
                    'BrnchEMail' => ' '
                },
                'MiddleName' => ' ',
                'Prefix'     => ' ',
                'NickName'   => ' ',
                'LastName'   => ' ',
                'FirstName'  => ' ',
                'Suffix'     => ' '
            },
            'biz_fax' => {
                'Notes'     => ' ',
                'Extension' => ' ',
                'Number'    => ' ',
                'Features'  => ' ',
                'Mobility'  => ' '
            },
            'biz_phone' => {
                'Notes'     => ' ',
                'Extension' => ' ',
                'Number'    => ' ',
                'Features'  => ' ',
                'Mobility'  => ' '
            },
            'Notes'          => ' ',
            'BizEmail'       => ' ',
            'DateCreated'    => ' ',
            'DateRemoved'    => ' ',
            'CurrentTitle'   => ' ',
            'AuthorityLevel' => ' ',
            'PrimaryContact' => ' '
        },
        'LastAnnualReview'    => ' ',
        'InternationalRoutes' => ' ',
        'LocalRoutes'         => ' ',
        'PullNotice'          => ' '
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
                            'GpsLat'  => ' ',
                            'Notes'   => ' ',
                            'Street2' => ' ',
                            'GpsLng'  => ' ',
                            'City'    => ' ',
                            'Street1' => ' ',
                            'State'   => ' ',
                            'Country' => ' ',
                            'Street3' => ' ',
                            'Zip'     => ' '
                        },
                        'brnch_fax' => {
                            'Notes'     => ' ',
                            'Extension' => ' ',
                            'Number'    => ' ',
                            'Features'  => ' ',
                            'Mobility'  => ' '
                        },
                        'brnch_phone' => {
                            'Notes'     => ' ',
                            'Extension' => ' ',
                            'Number'    => ' ',
                            'Features'  => ' ',
                            'Mobility'  => ' '
                        },
                        'OfficeName' => ' ',
                        'BrnchEMail' => ' '
                    },
                    'MiddleName' => ' ',
                    'Prefix'     => ' ',
                    'NickName'   => ' ',
                    'LastName'   => ' ',
                    'FirstName'  => ' ',
                    'Suffix'     => ' '
                },
                'biz_fax' => {
                    'Notes'     => ' ',
                    'Extension' => ' ',
                    'Number'    => ' ',
                    'Features'  => ' ',
                    'Mobility'  => ' '
                },
                'biz_phone' => {
                    'Notes'     => ' ',
                    'Extension' => ' ',
                    'Number'    => ' ',
                    'Features'  => ' ',
                    'Mobility'  => ' '
                },
                'Notes'          => ' ',
                'BizEmail'       => ' ',
                'DateCreated'    => ' ',
                'DateRemoved'    => ' ',
                'AuthorityLevel' => ' ',
                'CurrentTitle'   => ' ',
                'PrimaryContact' => ' '
            },
            'vendor' => {
                'biz' => {
                    'BizURL'  => ' ',
                    'BizName' => ' '
                },
                'brnch_address' => {
                    'GpsLat'  => ' ',
                    'Notes'   => ' ',
                    'Street2' => ' ',
                    'GpsLng'  => ' ',
                    'City'    => ' ',
                    'Street1' => ' ',
                    'State'   => ' ',
                    'Country' => ' ',
                    'Street3' => ' ',
                    'Zip'     => ' '
                },
                'brnch_fax' => {
                    'Notes'     => ' ',
                    'Extension' => ' ',
                    'Number'    => ' ',
                    'Features'  => ' ',
                    'Mobility'  => ' '
                },
                'brnch_phone' => {
                    'Notes'     => ' ',
                    'Extension' => ' ',
                    'Number'    => ' ',
                    'Features'  => ' ',
                    'Mobility'  => ' '
                },
                'OfficeName' => ' ',
                'BrnchEMail' => ' '
            },
            'GeneralName'    => ' ',
            'PriceSold'      => ' ',
            'DatePurchased'  => ' ',
            'DateSold'       => ' ',
            'SerialNo'       => ' ',
            'PricePurchased' => ' '
        },
        'LocationProviderId' => ' ',
        'Fuel'               => ' ',
        'Bearings'           => ' ',
        'Longitude'          => ' ',
        'Latitude'           => ' ',
        'Speed'              => ' ',
        'Acquired'           => ' ',
        'Odometer'           => ' ',
        'Posted'             => ' ',
        'EngineHours'        => ' ',
        'VehicleState'       => ' '
    },
    'logbook' => {
        'trip' => {
            'created_by' => {
                'ast' => {
                    'brnch' => {
                        'biz' => {
                            'BizURL'  => ' ',
                            'BizName' => ' '
                        },
                        'brnch_address' => {
                            'GpsLat'  => ' ',
                            'Notes'   => ' ',
                            'Street2' => ' ',
                            'GpsLng'  => ' ',
                            'City'    => ' ',
                            'Street1' => ' ',
                            'State'   => ' ',
                            'Country' => ' ',
                            'Street3' => ' ',
                            'Zip'     => ' '
                        },
                        'brnch_fax' => {
                            'Notes'     => ' ',
                            'Extension' => ' ',
                            'Number'    => ' ',
                            'Features'  => ' ',
                            'Mobility'  => ' '
                        },
                        'brnch_phone' => {
                            'Notes'     => ' ',
                            'Extension' => ' ',
                            'Number'    => ' ',
                            'Features'  => ' ',
                            'Mobility'  => ' '
                        },
                        'OfficeName' => ' ',
                        'BrnchEMail' => ' '
                    },
                    'MiddleName' => ' ',
                    'Prefix'     => ' ',
                    'NickName'   => ' ',
                    'LastName'   => ' ',
                    'FirstName'  => ' ',
                    'Suffix'     => ' '
                },
                'biz_fax' => {
                    'Notes'     => ' ',
                    'Extension' => ' ',
                    'Number'    => ' ',
                    'Features'  => ' ',
                    'Mobility'  => ' '
                },
                'biz_phone' => {
                    'Notes'     => ' ',
                    'Extension' => ' ',
                    'Number'    => ' ',
                    'Features'  => ' ',
                    'Mobility'  => ' '
                },
                'Notes'          => ' ',
                'BizEmail'       => ' ',
                'DateCreated'    => ' ',
                'DateRemoved'    => ' ',
                'CurrentTitle'   => ' ',
                'AuthorityLevel' => ' ',
                'PrimaryContact' => ' '
            },
            'Notes'          => ' ',
            'GoogleRoute'    => ' ',
            'TripStatus'     => ' ',
            'DateCompleted'  => ' ',
            'DateCreated'    => ' ',
            'IsValid'        => ' ',
            'DateStarted'    => ' ',
            'DateDispatched' => ' ',
            'TripNumber'     => ' ',
            'DateBooked'     => ' '
        },
        'Notes'       => ' ',
        'DateStarted' => ' '
    },
    'Activity'  => ' ',
    'StartTime' => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::SftLogEntry';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
