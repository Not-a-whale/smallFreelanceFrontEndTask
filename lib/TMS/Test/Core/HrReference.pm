package TMS::Test::Core::HrReference;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::HrAssociate;
use TMS::API::Core::CntAddress;
use TMS::API::Core::BizBranch;
use TMS::API::Core::EntBusiness;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::EntPerson;
use TMS::API::Core::BizCompanyNode;

my $attr = {
    'received_by' => {
        'ast' => {
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
        'biz_fax' => {
            'Mobility'  => ' ',
            'Notes'     => ' ',
            'Extension' => ' ',
            'Features'  => ' ',
            'Number'    => ' '
        },
        'biz_phone' => {
            'Mobility'  => ' ',
            'Notes'     => ' ',
            'Extension' => ' ',
            'Features'  => ' ',
            'Number'    => ' '
        },
        'node' => {
            'UnitName' => ' ',
            'Type'     => ' '
        },
        'CurrentTitle'   => ' ',
        'BizEmail'       => ' ',
        'Notes'          => ' ',
        'AuthorityLevel' => ' ',
        'PrimaryContact' => ' ',
        'DateRemoved'    => ' ',
        'DateCreated'    => ' '
    },
    'reference_for' => {
        'ast' => {
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
        },
        'biz_fax' => {
            'Mobility'  => ' ',
            'Notes'     => ' ',
            'Extension' => ' ',
            'Features'  => ' ',
            'Number'    => ' '
        },
        'biz_phone' => {
            'Mobility'  => ' ',
            'Notes'     => ' ',
            'Extension' => ' ',
            'Features'  => ' ',
            'Number'    => ' '
        },
        'node' => {
            'UnitName' => ' ',
            'Type'     => ' '
        },
        'CurrentTitle'   => ' ',
        'BizEmail'       => ' ',
        'Notes'          => ' ',
        'AuthorityLevel' => ' ',
        'PrimaryContact' => ' ',
        'DateRemoved'    => ' ',
        'DateCreated'    => ' '
    },
    'referensor_phone' => {
        'Mobility'  => ' ',
        'Notes'     => ' ',
        'Extension' => ' ',
        'Features'  => ' ',
        'Number'    => ' '
    },
    'ReferenceNotes' => ' ',
    'ReceivedDate'   => ' ',
    'ReferensorName' => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::HrReference';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;