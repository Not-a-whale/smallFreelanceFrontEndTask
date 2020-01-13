package TMS::Test::Core::FinInvoice;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::BizBranch;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::FinPaymentTerm;
use TMS::API::Core::EntPerson;
use TMS::API::Core::Entity;
use TMS::API::Core::CntAddress;
use TMS::API::Core::EntBusiness;

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
        'Notes'       => ' ',
        'IsActive'    => ' ',
        'DateCreated' => ' '
    },
    'payment_term' => {
        'Type'            => ' ',
        'DiscountPercent' => ' ',
        'DiscountInDays'  => ' ',
        'DueInDays'       => ' ',
        'Name'            => ' ',
        'DiscountAmount'  => ' ',
        'DueNext'         => ' '
    },
    'Comments'     => ' ',
    'Status'       => ' ',
    'Notes'        => ' ',
    'RefNumber'    => ' ',
    'DateCreated'  => ' ',
    'PONumber'     => ' ',
    'DateInvoiced' => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::FinInvoice';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
