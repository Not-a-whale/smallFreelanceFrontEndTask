package TMS::Test::Core::AppAccountLogin;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::AppAccount;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::CntAddress;
use TMS::API::Core::HrAssociate;
use TMS::API::Core::BizBranch;
use TMS::API::Core::EntPerson;
use TMS::API::Core::EntBusiness;

my $attr = {
    'app_account' => {
        'user' => {
            'ast' => {
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
            'biz_fax' => {
                'Notes'     => ' ',
                'Extension' => ' ',
                'Number'    => ' ',
                'Features'  => ' ',
                'Mobility'  => ' '
            },
            'biz_phone' => {
                'Notes'     => ' ',
                'Extension' => ' ',
                'Number'    => ' ',
                'Features'  => ' ',
                'Mobility'  => ' '
            },
            'Notes'          => ' ',
            'BizEmail'       => ' ',
            'DateCreated'    => ' ',
            'DateRemoved'    => ' ',
            'CurrentTitle'   => ' ',
            'AuthorityLevel' => ' ',
            'PrimaryContact' => ' '
        },
        'PasswordHash' => ' ',
        'DateCreated'  => ' ',
        'Locked'       => ' ',
        'Salt'         => ' ',
        'Username'     => ' '
    },
    'Type'      => ' ',
    'IPAddress' => ' ',
    'DateLogin' => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::AppAccountLogin';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
