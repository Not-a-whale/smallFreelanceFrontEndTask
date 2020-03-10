package TMS::Test::Core::TskNtfi;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::TskAlrm;
use TMS::API::Core::CntAddress;
use TMS::API::Core::TskTask;
use TMS::API::Core::BizBranch;
use TMS::API::Core::EntPerson;
use TMS::API::Core::EntBusiness;

my $attr = {
    'alrmid' => {
        'tskid' => {
            'prsn' => {
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
            'startdate' => ' ',
            'severity'  => ' ',
            'name'      => ' ',
            'duedate'   => ' ',
            'completed' => ' ',
            'priority'  => ' ',
            'estimated' => ' ',
            'created'   => ' '
        },
        'message'   => ' ',
        'repeat'    => ' ',
        'atcrontab' => ' ',
        'turnoff'   => ' ',
        'periodic'  => ' '
    },
    'prsn' => {
        'brnch' => {
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
        'MiddleName' => ' ',
        'Prefix'     => ' ',
        'NickName'   => ' ',
        'LastName'   => ' ',
        'FirstName'  => ' ',
        'Suffix'     => ' '
    }
};

with 'MooseX::Traits';
extends 'TMS::API::Core::TskNtfi';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
