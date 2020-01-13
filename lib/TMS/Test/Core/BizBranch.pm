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
};

with 'MooseX::Traits';
extends 'TMS::API::Core::BizBranch';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
