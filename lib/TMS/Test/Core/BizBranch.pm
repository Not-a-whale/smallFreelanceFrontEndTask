package TMS::Test::Core::BizBranch;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::EntBusiness;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::CntAddress;

my $attr = {
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
};

with 'MooseX::Traits';
extends 'TMS::API::Core::BizBranch';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
