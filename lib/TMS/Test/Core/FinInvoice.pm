package TMS::Test::Core::FinInvoice;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::EntBusiness;
use TMS::API::Core::FinPaymentTerm;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::EntPerson;
use TMS::API::Core::Entity;
use TMS::API::Core::CntAddress;
use TMS::API::Core::BizBranch;

my $attr = {
    'entity' => {
        'business' => {
            'BizURL'  => ' ',
            'BizName' => ' '
        },
        'person' => {
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
        'Notes'       => ' ',
        'DateCreated' => ' ',
        'IsActive'    => ' '
    },
    'payment_term' => {
        'DueNext'         => ' ',
        'DueInDays'       => ' ',
        'DiscountAmount'  => ' ',
        'DiscountPercent' => ' ',
        'DiscountInDays'  => ' ',
        'Name'            => ' ',
        'Type'            => ' '
    },
    'Comments'     => ' ',
    'DateInvoiced' => ' ',
    'PONumber'     => ' ',
    'Notes'        => ' ',
    'RefNumber'    => ' ',
    'Status'       => ' ',
    'DateCreated'  => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::FinInvoice';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
