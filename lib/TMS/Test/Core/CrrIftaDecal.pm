package TMS::Test::Core::CrrIftaDecal;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::EntCarrier;
use TMS::API::Core::CrrIfta;
use TMS::API::Core::EntBusiness;
use TMS::API::Core::InvVehicle;
use TMS::API::Core::GenFile;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::InvTiresize;
use TMS::API::Core::CntAddress;
use TMS::API::Core::HrAssociate;
use TMS::API::Core::BizBranch;
use TMS::API::Core::InvEquipment;
use TMS::API::Core::InvEquipmentType;
use TMS::API::Core::EntPerson;

my $attr = {
    'created_by' => {
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
    'decal_img' => {
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
    'ifta_acct' => {
        'biz' => {
            'BizURL'  => ' ',
            'BizName' => ' '
        },
        'proof_doc' => {
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
        'IFTALicense' => ' ',
        'McAccount'   => ' ',
        'Effective'   => ' ',
        'State'       => ' ',
        'Expiration'  => ' '
    },
    'vehicle' => {
        'carrier' => {
            'carrier' => {
                'BizURL'  => ' ',
                'BizName' => ' '
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
            'SCAC'                 => ' ',
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
        'Model'         => ' ',
        'Length'        => ' ',
        'Width'         => ' ',
        'Make'          => ' '
    },
    'ExpirationDate' => ' ',
    'EffectiveDate'  => ' ',
    'DecalNo'        => ' ',
    'DateIssued'     => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::CrrIftaDecal';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
