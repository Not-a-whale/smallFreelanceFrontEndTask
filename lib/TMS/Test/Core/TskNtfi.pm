package TMS::Test::Core::TskNtfi;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::TskTask;
use TMS::API::Core::TskAlrm;
use TMS::API::Core::CntAddress;
use TMS::API::Core::BizBranch;
use TMS::API::Core::EntBusiness;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::EntPerson;

my $attr = {
    'alrmid' => {
        'tskid' => {
            'prsn' => {
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
            'completed' => ' ',
            'severity'  => ' ',
            'name'      => ' ',
            'estimated' => ' ',
            'priority'  => ' ',
            'created'   => ' ',
            'duedate'   => ' ',
            'startdate' => ' '
        },
        'atcrontab' => ' ',
        'message'   => ' ',
        'turnoff'   => ' ',
        'periodic'  => ' ',
        'repeat'    => ' '
    },
    'prsn' => {
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
        'FirstName'  => ' ',
        'Prefix'     => ' ',
        'Suffix'     => ' '
    }
};

with 'MooseX::Traits';
extends 'TMS::API::Core::TskNtfi';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
