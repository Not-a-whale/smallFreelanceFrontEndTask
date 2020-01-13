package TMS::Test::Core::InsPolicy;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::GenFile;
use TMS::API::Core::BizBranch;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::HrAssociate;
use TMS::API::Core::EntPerson;
use TMS::API::Core::CntAddress;
use TMS::API::Core::EntBusiness;

my $attr = {
    'proof_of_insurance' => {
        'FileName'      => ' ',
        'SHASIG'        => ' ',
        'DocumentTitle' => ' ',
        'UploadDate'    => ' ',
        'Notes'         => ' ',
        'Keywords'      => ' ',
        'MIMEType'      => ' ',
        'ExpiredDate'   => ' ',
        'FileData'      => ' '
    },
    'provider_agent' => {
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
    'PaidBy'            => ' ',
    'DownpaymentAmount' => ' ',
    'TagName'           => ' ',
    'WhatIsInsured'     => ' ',
    'PolicyNumber'      => ' ',
    'ExpirationDate'    => ' ',
    'EffectiveDate'     => ' ',
    'InsuredAmount'     => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::InsPolicy';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
