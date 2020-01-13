package TMS::Test::Core::TskTask;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::BizBranch;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::CntAddress;
use TMS::API::Core::EntBusiness;
use TMS::API::Core::EntPerson;

my $attr = {
    'prsn' => {
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
    'completed' => ' ',
    'priority'  => ' ',
    'created'   => ' ',
    'estimated' => ' ',
    'duedate'   => ' ',
    'startdate' => ' ',
    'name'      => ' ',
    'severity'  => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::TskTask';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
