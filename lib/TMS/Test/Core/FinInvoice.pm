package TMS::Test::Core::FinInvoice;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::FinPaymentTerm;
use TMS::API::Core::BizBranch;
use TMS::API::Core::CntAddress;
use TMS::API::Core::EntPerson;
use TMS::API::Core::EntBusiness;
use TMS::API::Core::Entity;

my $attr = {
    'entity' => {
        'business' => {
            'BizName' => ' ',
            'BizURL'  => ' '
        },
        'person' => {
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
        'Notes'       => ' ',
        'DateCreated' => ' ',
        'IsActive'    => ' '
    },
    'payment_term' => {
        'DiscountAmount'  => ' ',
        'DueNext'         => ' ',
        'DueInDays'       => ' ',
        'Type'            => ' ',
        'DiscountPercent' => ' ',
        'Name'            => ' ',
        'DiscountInDays'  => ' '
    },
    'Notes'        => ' ',
    'Comments'     => ' ',
    'RefNumber'    => ' ',
    'DateCreated'  => ' ',
    'DateInvoiced' => ' ',
    'PONumber'     => ' ',
    'Status'       => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::FinInvoice';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
