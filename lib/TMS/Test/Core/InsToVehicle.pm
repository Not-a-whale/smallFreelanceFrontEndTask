package TMS::Test::Core::InsToVehicle;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::InvTiresize;
use TMS::API::Core::GenFile;
use TMS::API::Core::EntPerson;
use TMS::API::Core::InvEquipmentType;
use TMS::API::Core::CntAddress;
use TMS::API::Core::BizBranch;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::HrAssociate;
use TMS::API::Core::EntCarrier;
use TMS::API::Core::InvEquipment;
use TMS::API::Core::InsPolicy;
use TMS::API::Core::EntBusiness;
use TMS::API::Core::InvVehicle;

my $attr = {
    'added_by' => {
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
    'in' => {
        'proof_of_insurance' => {
            'FileName'      => ' ',
            'SHASIG'        => ' ',
            'DocumentTitle' => ' ',
            'UploadDate'    => ' ',
            'Notes'         => ' ',
            'Keywords'      => ' ',
            'MIMEType'      => ' ',
            'FileData'      => ' ',
            'ExpiredDate'   => ' '
        },
        'provider_agent' => {
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
        'TagName'           => ' ',
        'WhatIsInsured'     => ' ',
        'PaidBy'            => ' ',
        'DownpaymentAmount' => ' ',
        'PolicyNumber'      => ' ',
        'ExpirationDate'    => ' ',
        'EffectiveDate'     => ' ',
        'InsuredAmount'     => ' '
    },
    'removed_by' => {
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
                'FileData'      => ' ',
                'ExpiredDate'   => ' '
            },
            'CrType'               => ' ',
            'MC'                   => ' ',
            'DOT'                  => ' ',
            'RateConfEmailAddress' => ' ',
            'SCAC'                 => ' '
        },
        'tire_size' => {
            'Name' => ' ',
            'Type' => ' '
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
            'GeneralName'    => ' ',
            'DateSold'       => ' ',
            'PricePurchased' => ' ',
            'SerialNo'       => ' ',
            'DatePurchased'  => ' ',
            'PriceSold'      => ' '
        },
        'Model'         => ' ',
        'Width'         => ' ',
        'Color'         => ' ',
        'Year'          => ' ',
        'Axels'         => ' ',
        'Make'          => ' ',
        'Fuel'          => ' ',
        'VIN'           => ' ',
        'Height'        => ' ',
        'UnladenWeight' => ' ',
        'Length'        => ' '
    },
    'DateRemoved'    => ' ',
    'ActionEmail'    => ' ',
    'DateAdded'      => ' ',
    'ActionReminder' => ' ',
    'ActionNote'     => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::InsToVehicle';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
