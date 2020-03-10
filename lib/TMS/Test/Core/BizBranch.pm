package TMS::Test::Core::BizBranch;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::CntAddress;
use TMS::API::Core::EntBusiness;

my $attr = {
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
};

with 'MooseX::Traits';
extends 'TMS::API::Core::BizBranch';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
