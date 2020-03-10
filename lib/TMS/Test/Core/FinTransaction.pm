package TMS::Test::Core::FinTransaction;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::FinClass;
use TMS::API::Core::CntAddress;
use TMS::API::Core::HrAssociate;
use TMS::API::Core::FinJob;
use TMS::API::Core::BizBranch;
use TMS::API::Core::EntPerson;
use TMS::API::Core::EntBusiness;
use TMS::API::Core::FinTransactionType;

my $attr = {
    'class'      => {'Name' => ' '},
    'created_by' => {
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
    'job' => {
        'JobAddedBy' => ' ',
        'JobCreated' => ' ',
        'Title'      => ' '
    },
    'transaction_type' => {'TransTypeName' => ' '},
    'Memo'             => ' ',
    'RefNumber'        => ' ',
    'DateCreated'      => ' ',
    'Status'           => ' ',
    'DateTransaction'  => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::FinTransaction';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
