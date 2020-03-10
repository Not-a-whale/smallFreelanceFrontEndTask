package TMS::Test::Core::FinTaxId;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::GenFile;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::BizBranch;
use TMS::API::Core::CntAddress;
use TMS::API::Core::EntPerson;
use TMS::API::Core::EntBusiness;
use TMS::API::Core::Entity;

my $attr = {
    'entity' => {
        'business' => {
            'BizName' => ' ',
            'BizURL'  => ' '
        },
        'person' => {
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
        'Notes'       => ' ',
        'DateCreated' => ' ',
        'IsActive'    => ' '
    },
    'photo' => {
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
    'Notes'    => ' ',
    'Tax_ID'   => ' ',
    'Need1099' => ' ',
    'ID_Type'  => ' ',
    'Entered'  => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::FinTaxId';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
