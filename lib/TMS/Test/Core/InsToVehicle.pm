package TMS::Test::Core::InsToVehicle;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::InvEquipmentType;
use TMS::API::Core::HrAssociate;
use TMS::API::Core::InvVehicle;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::InsPolicy;
use TMS::API::Core::InvEquipment;
use TMS::API::Core::InvTiresize;
use TMS::API::Core::EntCarrier;
use TMS::API::Core::BizBranch;
use TMS::API::Core::CntAddress;
use TMS::API::Core::EntBusiness;
use TMS::API::Core::BizCompanyNode;
use TMS::API::Core::EntPerson;
use TMS::API::Core::GenFile;

my $attr = {
    'added_by' => {
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
    'in' => {
        'proof_of_insurance' => {
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
        'provider_agent' => {
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
        'EffectiveDate'     => ' ',
        'WhatIsInsured'     => ' ',
        'PaidBy'            => ' ',
        'ExpirationDate'    => ' ',
        'TagName'           => ' ',
        'PolicyNumber'      => ' ',
        'InsuredAmount'     => ' ',
        'DownpaymentAmount' => ' '
    },
    'removed_by' => {
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
    'vehicle' => {
        'carrier' => {
            'carrier' => {
                'BizName' => ' ',
                'BizURL'  => ' '
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
            'SCAC'                 => ' ',
            'RateConfEmailAddress' => ' ',
            'DOT'                  => ' ',
            'MC'                   => ' ',
            'CrType'               => ' '
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
            'DateSold'       => ' ',
            'PricePurchased' => ' ',
            'DatePurchased'  => ' ',
            'GeneralName'    => ' ',
            'PriceSold'      => ' ',
            'SerialNo'       => ' '
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
    'ActionNote'     => ' ',
    'ActionEmail'    => ' ',
    'DateRemoved'    => ' ',
    'DateAdded'      => ' ',
    'ActionReminder' => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::InsToVehicle';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
