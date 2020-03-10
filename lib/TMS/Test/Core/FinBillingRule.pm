package TMS::Test::Core::FinBillingRule;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::GenFile;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::FinBillingBank;
use TMS::API::Core::Entity;
use TMS::API::Core::CntAddress;
use TMS::API::Core::FinBillingInfo;
use TMS::API::Core::HrAssociate;
use TMS::API::Core::FinBillingTag;
use TMS::API::Core::BizBranch;
use TMS::API::Core::EntBusiness;
use TMS::API::Core::EntPerson;

my $attr = {
    'bank_account' => {
        'billing' => {
            'address' => {
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
            'billing_tag' => {
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
                'UserDefined' => ' ',
                'BillingTag'  => ' ',
                'DateCreated' => ' '
            },
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
            'fax' => {
                'Notes'     => ' ',
                'Extension' => ' ',
                'Number'    => ' ',
                'Features'  => ' ',
                'Mobility'  => ' '
            },
            'phone' => {
                'Notes'     => ' ',
                'Extension' => ' ',
                'Number'    => ' ',
                'Features'  => ' ',
                'Mobility'  => ' '
            },
            'Notes'           => ' ',
            'EMail'           => ' ',
            'ContactName'     => ' ',
            'DateOut'         => ' ',
            'PayToTheOrderOf' => ' ',
            'DateIn'          => ' ',
            'CreditLimit'     => ' ',
            'CreditHold'      => ' '
        },
        'institution' => {
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
        'void_check' => {
            'FileName'      => ' ',
            'Notes'         => ' ',
            'Keywords'      => ' ',
            'ExpiredDate'   => ' ',
            'MIMEType'      => ' ',
            'DocumentTitle' => ' ',
            'FileData'      => ' ',
            'SHASIG'        => ' ',
            'UploadDate'    => ' '
        },
        'Notes'           => ' ',
        'Purpose'         => ' ',
        'AccountNumber'   => ' ',
        'RoutingNumber'   => ' ',
        'AccountNickname' => ' ',
        'AccountType'     => ' ',
        'Active'          => ' '
    },
    'Notes'  => ' ',
    'Rule'   => ' ',
    'Amount' => ' ',
    'Active' => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::FinBillingRule';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
