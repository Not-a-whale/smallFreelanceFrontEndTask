package TMS::Test::Core::EntPerson;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::BizBranch;
use TMS::API::Core::CntAddress;
use TMS::API::Core::EntBusiness;

my $attr = {
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
};

with 'MooseX::Traits';
extends 'TMS::API::Core::EntPerson';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
