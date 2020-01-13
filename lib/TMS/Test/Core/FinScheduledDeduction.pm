package TMS::Test::Core::FinScheduledDeduction;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::FinAccountType;
use TMS::API::Core::EntPerson;
use TMS::API::Core::FinAccount;
use TMS::API::Core::Entity;
use TMS::API::Core::FinItemTemplate;
use TMS::API::Core::CntAddress;
use TMS::API::Core::FinTransactionType;
use TMS::API::Core::BizBranch;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::HrAssociate;
use TMS::API::Core::FinItemTemplatesType;
use TMS::API::Core::EntBusiness;

my $attr = {
    'created_by' => {
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
                    'GpsLat'  => ' ',
                    'City'    => ' ',
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
        'IsActive'    => ' ',
        'Notes'       => ' ',
        'DateCreated' => ' '
    },
    'item_template' => {
        'created_by' => {
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
        'credit_account' => {
            'account_type' => {
                'IncomeSheet'  => ' ',
                'Temp'         => ' ',
                'Valid'        => ' ',
                'Credit'       => ' ',
                'UserDefined'  => ' ',
                'Name'         => ' ',
                'Editable'     => ' ',
                'BalanceSheet' => ' ',
                'DisplayOrder' => ' ',
                'Debit'        => ' '
            },
            'UserDefined'  => ' ',
            'Name'         => ' ',
            'DateCreated'  => ' ',
            'Balance'      => ' ',
            'Valid'        => ' ',
            'Code'         => ' ',
            'ExternalName' => ' ',
            'Description'  => ' ',
            'Active'       => ' '
        },
        'debit_account' => {
            'account_type' => {
                'IncomeSheet'  => ' ',
                'Temp'         => ' ',
                'Valid'        => ' ',
                'Credit'       => ' ',
                'UserDefined'  => ' ',
                'Name'         => ' ',
                'Editable'     => ' ',
                'BalanceSheet' => ' ',
                'DisplayOrder' => ' ',
                'Debit'        => ' '
            },
            'UserDefined'  => ' ',
            'Name'         => ' ',
            'DateCreated'  => ' ',
            'Balance'      => ' ',
            'Valid'        => ' ',
            'Code'         => ' ',
            'ExternalName' => ' ',
            'Description'  => ' ',
            'Active'       => ' '
        },
        'deleted_by' => {
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
                        'GpsLat'  => ' ',
                        'City'    => ' ',
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
                        'GpsLat'  => ' ',
                        'City'    => ' ',
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
            'IsActive'    => ' ',
            'Notes'       => ' ',
            'DateCreated' => ' '
        },
        'template_type' => {
            'UserDefined'   => ' ',
            'Name'          => ' ',
            'DisplayToUser' => ' ',
            'Description'   => ' '
        },
        'transaction_type' => {'TransTypeName' => ' '},
        'updated_by'       => {
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
                        'GpsLat'  => ' ',
                        'City'    => ' ',
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
        'UserDefined' => ' ',
        'Name'        => ' ',
        'Deleted'     => ' ',
        'Price'       => ' ',
        'DateCreated' => ' ',
        'DateUpdated' => ' ',
        'Description' => ' ',
        'PriceType'   => ' ',
        'DateDeleted' => ' '
    },
    'Comments'         => ' ',
    'CumulativeAmount' => ' ',
    'PaymentAmount'    => ' ',
    'DateStart'        => ' ',
    'PeriodDay'        => ' ',
    'DateCreated'      => ' ',
    'Valid'            => ' ',
    'DateStop'         => ' ',
    'TotalAmount'      => ' ',
    'Period'           => ' ',
    'ScheduleType'     => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::FinScheduledDeduction';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
