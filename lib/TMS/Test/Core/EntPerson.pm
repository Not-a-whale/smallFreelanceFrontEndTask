package TMS::Test::Core::EntPerson;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::BizBranch;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::CntAddress;
use TMS::API::Core::EntBusiness;

my $attr = {
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
};

with 'MooseX::Traits';
extends 'TMS::API::Core::EntPerson';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
