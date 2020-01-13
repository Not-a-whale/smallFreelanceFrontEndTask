package TMS::Test::Core::SftVehicleInspectProof;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::InvEquipmentType;
use TMS::API::Core::HrAssociate;
use TMS::API::Core::InvVehicle;
use TMS::API::Core::SftVehicleInspection;
use TMS::API::Core::SftVehicleInspectItem;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::SftVehicleInspectedItem;
use TMS::API::Core::SftInspectionSchedule;
use TMS::API::Core::InvEquipment;
use TMS::API::Core::InvTiresize;
use TMS::API::Core::EntCarrier;
use TMS::API::Core::CntAddress;
use TMS::API::Core::BizBranch;
use TMS::API::Core::EntBusiness;
use TMS::API::Core::BizCompanyNode;
use TMS::API::Core::EntPerson;
use TMS::API::Core::GenFile;

my $attr = {
    'file_ref' => {
        'FileName'      => ' ',
        'ExpiredDate'   => ' ',
        'DocumentTitle' => ' ',
        'SHASIG'        => ' ',
        'Notes'         => ' ',
        'UploadDate'    => ' ',
        'Keywords'      => ' ',
        'FileData'      => ' ',
        'MIMEType'      => ' '
    },
    'inspected_item' => {
        'inspected_item' => {
            'ItemAreaName' => ' ',
            'Notes'        => ' '
        },
        'inspection' => {
            'inspection_schedule' => {
                'vehicle' => {
                    'carrier' => {
                        'carrier' => {
                            'BizURL'  => ' ',
                            'BizName' => ' '
                        },
                        'mc_certificate_photo' => {
                            'FileName'      => ' ',
                            'ExpiredDate'   => ' ',
                            'DocumentTitle' => ' ',
                            'SHASIG'        => ' ',
                            'Notes'         => ' ',
                            'UploadDate'    => ' ',
                            'Keywords'      => ' ',
                            'FileData'      => ' ',
                            'MIMEType'      => ' '
                        },
                        'CrType'               => ' ',
                        'DOT'                  => ' ',
                        'RateConfEmailAddress' => ' ',
                        'SCAC'                 => ' ',
                        'MC'                   => ' '
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
                                        'BizURL'  => ' ',
                                        'BizName' => ' '
                                    },
                                    'brnch_address' => {
                                        'State'   => ' ',
                                        'Street2' => ' ',
                                        'Notes'   => ' ',
                                        'Zip'     => ' ',
                                        'Street3' => ' ',
                                        'Street1' => ' ',
                                        'GpsLng'  => ' ',
                                        'Country' => ' ',
                                        'GpsLat'  => ' ',
                                        'City'    => ' '
                                    },
                                    'brnch_fax' => {
                                        'Mobility'  => ' ',
                                        'Notes'     => ' ',
                                        'Extension' => ' ',
                                        'Features'  => ' ',
                                        'Number'    => ' '
                                    },
                                    'brnch_phone' => {
                                        'Mobility'  => ' ',
                                        'Notes'     => ' ',
                                        'Extension' => ' ',
                                        'Features'  => ' ',
                                        'Number'    => ' '
                                    },
                                    'OfficeName' => ' ',
                                    'BrnchEMail' => ' '
                                },
                                'LastName'   => ' ',
                                'MiddleName' => ' ',
                                'NickName'   => ' ',
                                'FirstName'  => ' ',
                                'Prefix'     => ' ',
                                'Suffix'     => ' '
                            },
                            'biz_fax' => {
                                'Mobility'  => ' ',
                                'Notes'     => ' ',
                                'Extension' => ' ',
                                'Features'  => ' ',
                                'Number'    => ' '
                            },
                            'biz_phone' => {
                                'Mobility'  => ' ',
                                'Notes'     => ' ',
                                'Extension' => ' ',
                                'Features'  => ' ',
                                'Number'    => ' '
                            },
                            'node' => {
                                'UnitName' => ' ',
                                'Type'     => ' '
                            },
                            'CurrentTitle'   => ' ',
                            'BizEmail'       => ' ',
                            'Notes'          => ' ',
                            'AuthorityLevel' => ' ',
                            'PrimaryContact' => ' ',
                            'DateRemoved'    => ' ',
                            'DateCreated'    => ' '
                        },
                        'vendor' => {
                            'biz' => {
                                'BizName' => ' ',
                                'BizURL'  => ' '
                            },
                            'brnch_address' => {
                                'State'   => ' ',
                                'Street2' => ' ',
                                'Notes'   => ' ',
                                'Zip'     => ' ',
                                'Street3' => ' ',
                                'Street1' => ' ',
                                'GpsLng'  => ' ',
                                'Country' => ' ',
                                'GpsLat'  => ' ',
                                'City'    => ' '
                            },
                            'brnch_fax' => {
                                'Mobility'  => ' ',
                                'Notes'     => ' ',
                                'Extension' => ' ',
                                'Features'  => ' ',
                                'Number'    => ' '
                            },
                            'brnch_phone' => {
                                'Mobility'  => ' ',
                                'Notes'     => ' ',
                                'Extension' => ' ',
                                'Features'  => ' ',
                                'Number'    => ' '
                            },
                            'OfficeName' => ' ',
                            'BrnchEMail' => ' '
                        },
                        'PriceSold'      => ' ',
                        'DateSold'       => ' ',
                        'SerialNo'       => ' ',
                        'PricePurchased' => ' ',
                        'DatePurchased'  => ' ',
                        'GeneralName'    => ' '
                    },
                    'Year'          => ' ',
                    'UnladenWeight' => ' ',
                    'Height'        => ' ',
                    'Length'        => ' ',
                    'Width'         => ' ',
                    'Model'         => ' ',
                    'Make'          => ' ',
                    'Fuel'          => ' ',
                    'Color'         => ' ',
                    'Axels'         => ' ',
                    'VIN'           => ' '
                },
                'InspectionType' => ' '
            },
            'inspector' => {
                'ast' => {
                    'brnch' => {
                        'biz' => {
                            'BizName' => ' ',
                            'BizURL'  => ' '
                        },
                        'brnch_address' => {
                            'State'   => ' ',
                            'Street2' => ' ',
                            'Notes'   => ' ',
                            'Zip'     => ' ',
                            'Street3' => ' ',
                            'Street1' => ' ',
                            'GpsLng'  => ' ',
                            'Country' => ' ',
                            'GpsLat'  => ' ',
                            'City'    => ' '
                        },
                        'brnch_fax' => {
                            'Mobility'  => ' ',
                            'Notes'     => ' ',
                            'Extension' => ' ',
                            'Features'  => ' ',
                            'Number'    => ' '
                        },
                        'brnch_phone' => {
                            'Mobility'  => ' ',
                            'Notes'     => ' ',
                            'Extension' => ' ',
                            'Features'  => ' ',
                            'Number'    => ' '
                        },
                        'OfficeName' => ' ',
                        'BrnchEMail' => ' '
                    },
                    'LastName'   => ' ',
                    'MiddleName' => ' ',
                    'NickName'   => ' ',
                    'Prefix'     => ' ',
                    'FirstName'  => ' ',
                    'Suffix'     => ' '
                },
                'biz_fax' => {
                    'Mobility'  => ' ',
                    'Notes'     => ' ',
                    'Extension' => ' ',
                    'Features'  => ' ',
                    'Number'    => ' '
                },
                'biz_phone' => {
                    'Mobility'  => ' ',
                    'Notes'     => ' ',
                    'Extension' => ' ',
                    'Features'  => ' ',
                    'Number'    => ' '
                },
                'node' => {
                    'UnitName' => ' ',
                    'Type'     => ' '
                },
                'CurrentTitle'   => ' ',
                'BizEmail'       => ' ',
                'Notes'          => ' ',
                'AuthorityLevel' => ' ',
                'PrimaryContact' => ' ',
                'DateRemoved'    => ' ',
                'DateCreated'    => ' '
            },
            'inspector_signature' => {
                'Notes'         => ' ',
                'UploadDate'    => ' ',
                'Keywords'      => ' ',
                'FileData'      => ' ',
                'MIMEType'      => ' ',
                'FileName'      => ' ',
                'ExpiredDate'   => ' ',
                'DocumentTitle' => ' ',
                'SHASIG'        => ' '
            },
            'location_of_records' => {
                'State'   => ' ',
                'Street2' => ' ',
                'Notes'   => ' ',
                'Zip'     => ' ',
                'Street3' => ' ',
                'Street1' => ' ',
                'GpsLng'  => ' ',
                'Country' => ' ',
                'GpsLat'  => ' ',
                'City'    => ' '
            },
            'Mileage'          => ' ',
            'Remarks'          => ' ',
            'DateInspection'   => ' ',
            'InspectionNumber' => ' ',
            'Status'           => ' '
        },
        'Status'        => ' ',
        'InspectedDate' => ' '
    },
    'Notes' => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::SftVehicleInspectProof';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
