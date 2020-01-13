package TMS::Test::Core::MsgNote;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::MsgAccess;
use TMS::API::Core::BizBranch;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::CntAddress;
use TMS::API::Core::HrAssociate;
use TMS::API::Core::EntBusiness;
use TMS::API::Core::EntPerson;

my $attr = {
    'author' => {
        'ast' => {
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
        'biz_fax' => {
            'Extension' => ' ',
            'Features'  => ' ',
            'Notes'     => ' ',
            'Mobility'  => ' ',
            'Number'    => ' '
        },
        'biz_phone' => {
            'Extension' => ' ',
            'Features'  => ' ',
            'Notes'     => ' ',
            'Mobility'  => ' ',
            'Number'    => ' '
        },
        'AuthorityLevel' => ' ',
        'Notes'          => ' ',
        'PrimaryContact' => ' ',
        'CurrentTitle'   => ' ',
        'DateCreated'    => ' ',
        'DateRemoved'    => ' ',
        'NodeId'         => ' ',
        'BizEmail'       => ' '
    },
    'macsid'      => {'PermissionName' => ' '},
    'sourcetable' => ' ',
    'sourceid'    => ' ',
    'subject'     => ' ',
    'keywords'    => ' ',
    'body'        => ' ',
    'posted'      => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::MsgNote';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
