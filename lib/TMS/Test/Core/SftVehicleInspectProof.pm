package TMS::Test::Core::SftVehicleInspectProof;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::InvTiresize;
use TMS::API::Core::GenFile;
use TMS::API::Core::SftInspectionSchedule;
use TMS::API::Core::SftVehicleInspectedItem;
use TMS::API::Core::EntPerson;
use TMS::API::Core::CntAddress;
use TMS::API::Core::InvEquipmentType;
use TMS::API::Core::BizBranch;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::HrAssociate;
use TMS::API::Core::EntCarrier;
use TMS::API::Core::SftVehicleInspectItem;
use TMS::API::Core::InvEquipment;
use TMS::API::Core::SftVehicleInspection;
use TMS::API::Core::EntBusiness;
use TMS::API::Core::InvVehicle;

my $attr = {
    'file_ref' => {
        'FileName'      => ' ',
        'SHASIG'        => ' ',
        'DocumentTitle' => ' ',
        'UploadDate'    => ' ',
        'Notes'         => ' ',
        'Keywords'      => ' ',
        'MIMEType'      => ' ',
        'ExpiredDate'   => ' ',
        'FileData'      => ' '
    },
    'inspected_item' => {
        'inspected_item' => {
            'Notes'        => ' ',
            'ItemAreaName' => ' '
        },
        'inspection' => {
            'inspection_schedule' => {
                'vehicle' => {
                    'carrier' => {
                        'carrier' => {
                            'BizName' => ' ',
                            'BizURL'  => ' '
                        },
                        'mc_certificate_photo' => {
                            'FileName'      => ' ',
                            'SHASIG'        => ' ',
                            'DocumentTitle' => ' ',
                            'UploadDate'    => ' ',
                            'Notes'         => ' ',
                            'Keywords'      => ' ',
                            'MIMEType'      => ' ',
                            'ExpiredDate'   => ' ',
                            'FileData'      => ' '
                        },
                        'CrType'               => ' ',
                        'MC'                   => ' ',
                        'DOT'                  => ' ',
                        'RateConfEmailAddress' => ' ',
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
                        'DateSold'       => ' ',
                        'PricePurchased' => ' ',
                        'SerialNo'       => ' ',
                        'DatePurchased'  => ' ',
                        'GeneralName'    => ' ',
                        'PriceSold'      => ' '
                    },
                    'Model'         => ' ',
                    'Width'         => ' ',
                    'Color'         => ' ',
                    'Year'          => ' ',
                    'Axels'         => ' ',
                    'Fuel'          => ' ',
                    'Make'          => ' ',
                    'Height'        => ' ',
                    'VIN'           => ' ',
                    'UnladenWeight' => ' ',
                    'Length'        => ' '
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
                            'Street3' => ' ',
                            'Notes'   => ' ',
                            'GpsLng'  => ' ',
                            'Street1' => ' ',
                            'State'   => ' ',
                            'Street2' => ' ',
                            'GpsLat'  => ' ',
                            'City'    => ' ',
                            'Country' => ' ',
                            'Zip'     => ' '
                        },
                        'brnch_fax' => {
                            'Extension' => ' ',
                            'Notes'     => ' ',
                            'Mobility'  => ' ',
                            'Number'    => ' ',
                            'Features'  => ' '
                        },
                        'brnch_phone' => {
                            'Extension' => ' ',
                            'Notes'     => ' ',
                            'Mobility'  => ' ',
                            'Number'    => ' ',
                            'Features'  => ' '
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
            'inspector_signature' => {
                'SHASIG'        => ' ',
                'UploadDate'    => ' ',
                'Notes'         => ' ',
                'FileName'      => ' ',
                'DocumentTitle' => ' ',
                'Keywords'      => ' ',
                'MIMEType'      => ' ',
                'FileData'      => ' ',
                'ExpiredDate'   => ' '
            },
            'location_of_records' => {
                'Street3' => ' ',
                'Notes'   => ' ',
                'GpsLng'  => ' ',
                'Street1' => ' ',
                'State'   => ' ',
                'Street2' => ' ',
                'GpsLat'  => ' ',
                'City'    => ' ',
                'Country' => ' ',
                'Zip'     => ' '
            },
            'Mileage'          => ' ',
            'Status'           => ' ',
            'InspectionNumber' => ' ',
            'DateInspection'   => ' ',
            'Remarks'          => ' '
        },
        'InspectedDate' => ' ',
        'Status'        => ' '
    },
    'Notes' => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::SftVehicleInspectProof';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
