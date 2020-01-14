package TMS::Test::Core::FinBillingBank;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::HrAssociate;
use TMS::API::Core::FinBillingInfo;
use TMS::API::Core::BizBranch;
use TMS::API::Core::CntAddress;
use TMS::API::Core::EntBusiness;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::Entity;
use TMS::API::Core::BizCompanyNode;
use TMS::API::Core::EntPerson;
use TMS::API::Core::FinBillingTag;
use TMS::API::Core::GenFile;

my $attr = {
    'billing' => {
        'address' => {
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
        'billing_tag' => {
            'created_by' => {
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
            'BillingTag'  => ' ',
            'UserDefined' => ' ',
            'DateCreated' => ' '
        },
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
                'Prefix'     => ' ',
                'FirstName'  => ' ',
                'Suffix'     => ' '
            },
            'Notes'       => ' ',
            'IsActive'    => ' ',
            'DateCreated' => ' '
        },
        'fax' => {
            'Mobility'  => ' ',
            'Notes'     => ' ',
            'Extension' => ' ',
            'Features'  => ' ',
            'Number'    => ' '
        },
        'phone' => {
            'Mobility'  => ' ',
            'Notes'     => ' ',
            'Extension' => ' ',
            'Features'  => ' ',
            'Number'    => ' '
        },
        'DateIn'          => ' ',
        'Notes'           => ' ',
        'PayToTheOrderOf' => ' ',
        'DateOut'         => ' ',
        'ContactName'     => ' ',
        'CreditLimit'     => ' ',
        'EMail'           => ' ',
        'CreditHold'      => ' '
    },
    'institution' => {
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
    'void_check' => {
        'Notes'         => ' ',
        'UploadDate'    => ' ',
        'Keywords'      => ' ',
        'FileData'      => ' ',
        'MIMEType'      => ' ',
        'FileName'      => ' ',
        'ExpiredDate'   => ' ',
        'DocumentTitle' => ' ',
        'SHASIG'        => ' '
    },
    'Active'          => ' ',
    'Notes'           => ' ',
    'RoutingNumber'   => ' ',
    'AccountNumber'   => ' ',
    'AccountType'     => ' ',
    'Purpose'         => ' ',
    'AccountNickname' => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::FinBillingBank';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;