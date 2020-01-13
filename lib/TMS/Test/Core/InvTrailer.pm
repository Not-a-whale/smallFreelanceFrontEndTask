package TMS::Test::Core::InvTrailer;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::InvTiresize;
use TMS::API::Core::GenFile;
use TMS::API::Core::InvTrailerType;
use TMS::API::Core::EntPerson;
use TMS::API::Core::CntAddress;
use TMS::API::Core::InvEquipmentType;
use TMS::API::Core::BizBranch;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::HrAssociate;
use TMS::API::Core::EntCarrier;
use TMS::API::Core::InvEquipment;
use TMS::API::Core::EntBusiness;
use TMS::API::Core::InvVehicle;

my $attr = {
    'trailer' => {
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
    'type'          => {},
    'LoadLength'    => ' ',
    'LoadVolume'    => ' ',
    'LoadHeight'    => ' ',
    'LoadWidth'     => ' ',
    'HasPalletJack' => ' ',
    'HasLiftGate'   => ' ',
    'HazMat'        => ' ',
    'LoadCapactiy'  => ' ',
    'HasRamps'      => ' ',
    'DoorHeight'    => ' ',
    'DoorWidth'     => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::InvTrailer';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
