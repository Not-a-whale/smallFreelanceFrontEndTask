package TMS::Test::Core::SftVehicleInspection;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::EntCarrier;
use TMS::API::Core::EntBusiness;
use TMS::API::Core::InvVehicle;
use TMS::API::Core::GenFile;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::InvTiresize;
use TMS::API::Core::CntAddress;
use TMS::API::Core::SftInspectionSchedule;
use TMS::API::Core::HrAssociate;
use TMS::API::Core::InvEquipment;
use TMS::API::Core::BizBranch;
use TMS::API::Core::InvEquipmentType;
use TMS::API::Core::EntPerson;

my $attr = {
    'inspection_schedule' => {
        'vehicle' => {
            'carrier' => {
                'carrier' => {
                    'BizName' => ' ',
                    'BizURL'  => ' '
                },
                'mc_certificate_photo' => {
                    'FileName'      => ' ',
                    'Notes'         => ' ',
                    'FileData'      => ' ',
                    'SHASIG'        => ' ',
                    'UploadDate'    => ' ',
                    'Keywords'      => ' ',
                    'ExpiredDate'   => ' ',
                    'MIMEType'      => ' ',
                    'DocumentTitle' => ' '
                },
                'DOT'                  => ' ',
                'RateConfEmailAddress' => ' ',
                'MC'                   => ' ',
                'CrType'               => ' ',
                'SCAC'                 => ' '
            },
            'tire_size' => {
                'Type' => ' ',
                'Name' => ' '
            },
            'vehicle' => {
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
                'SerialNo'       => ' ',
                'PricePurchased' => ' ',
                'DatePurchased'  => ' ',
                'DateSold'       => ' '
            },
            'UnladenWeight' => ' ',
            'Fuel'          => ' ',
            'Axels'         => ' ',
            'Color'         => ' ',
            'Height'        => ' ',
            'VIN'           => ' ',
            'Year'          => ' ',
            'Length'        => ' ',
            'Model'         => ' ',
            'Width'         => ' ',
            'Make'          => ' '
        },
        'InspectionType' => ' '
    },
    'inspector' => {
        'ast' => {
            'brnch' => {
                'biz' => {
                    'BizURL'  => ' ',
                    'BizName' => ' '
                },
                'brnch_address' => {
                    'Notes'   => ' ',
                    'GpsLng'  => ' ',
                    'City'    => ' ',
                    'Street3' => ' ',
                    'Zip'     => ' ',
                    'GpsLat'  => ' ',
                    'Street2' => ' ',
                    'Street1' => ' ',
                    'State'   => ' ',
                    'Country' => ' '
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
    'inspector_signature' => {
        'FileName'      => ' ',
        'Notes'         => ' ',
        'Keywords'      => ' ',
        'ExpiredDate'   => ' ',
        'MIMEType'      => ' ',
        'DocumentTitle' => ' ',
        'FileData'      => ' ',
        'SHASIG'        => ' ',
        'UploadDate'    => ' '
    },
    'location_of_records' => {
        'Notes'   => ' ',
        'GpsLng'  => ' ',
        'City'    => ' ',
        'Street3' => ' ',
        'Zip'     => ' ',
        'GpsLat'  => ' ',
        'Street2' => ' ',
        'Street1' => ' ',
        'State'   => ' ',
        'Country' => ' '
    },
    'DateInspection'   => ' ',
    'Remarks'          => ' ',
    'Status'           => ' ',
    'InspectionNumber' => ' ',
    'Mileage'          => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::SftVehicleInspection';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
