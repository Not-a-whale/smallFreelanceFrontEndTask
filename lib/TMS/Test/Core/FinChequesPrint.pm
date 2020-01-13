package TMS::Test::Core::FinChequesPrint;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::EntPerson;
use TMS::API::Core::FinJob;
use TMS::API::Core::Entity;
use TMS::API::Core::FinClass;
use TMS::API::Core::CntAddress;
use TMS::API::Core::FinTransaction;
use TMS::API::Core::BizBranch;
use TMS::API::Core::FinTransactionType;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::HrAssociate;
use TMS::API::Core::FinCheque;
use TMS::API::Core::EntBusiness;

my $attr = {
    'cheque' => {
        'authorized_by' => {
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
        'bank' => {
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
        'payee' => {
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
        'payer' => {
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
        'transaction' => {
            'class'      => {'Name' => ' '},
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
            'job' => {
                'Title'      => ' ',
                'JobCreated' => ' ',
                'JobAddedBy' => ' '
            },
            'transaction_type' => {'TransTypeName' => ' '},
            'Status'           => ' ',
            'RefNumber'        => ' ',
            'DateCreated'      => ' ',
            'Memo'             => ' ',
            'DateTransaction'  => ' '
        },
        'voided_by' => {
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
                'NickName'   => ' ',
                'Prefix'     => ' ',
                'LastName'   => ' ',
                'MiddleName' => ' ',
                'FirstName'  => ' ',
                'Suffix'     => ' '
            },
            'biz_fax' => {
                'Extension' => ' ',
                'Notes'     => ' ',
                'Mobility'  => ' ',
                'Number'    => ' ',
                'Features'  => ' '
            },
            'biz_phone' => {
                'Extension' => ' ',
                'Notes'     => ' ',
                'Mobility'  => ' ',
                'Number'    => ' ',
                'Features'  => ' '
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
        'BankRoutingNumber'  => ' ',
        'BankPhone'          => ' ',
        'BankCityAddress'    => ' ',
        'PayerCityAddress'   => ' ',
        'PayerPhone'         => ' ',
        'DateCreated'        => ' ',
        'BankAccountNumber'  => ' ',
        'PayeeStreetAddress' => ' ',
        'PayeeName'          => ' ',
        'PayerName'          => ' ',
        'PayerStreetAddress' => ' ',
        'Amount'             => ' ',
        'BankName'           => ' ',
        'DateAuthorized'     => ' ',
        'DateVoided'         => ' ',
        'PayeePhone'         => ' ',
        'BankStreetAddress'  => ' ',
        'PayeeCityAddress'   => ' ',
        'Memo'               => ' ',
        'ChequeNumber'       => ' '
    },
    'printed_by' => {
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
            'NickName'   => ' ',
            'Prefix'     => ' ',
            'LastName'   => ' ',
            'MiddleName' => ' ',
            'FirstName'  => ' ',
            'Suffix'     => ' '
        },
        'biz_fax' => {
            'Extension' => ' ',
            'Notes'     => ' ',
            'Mobility'  => ' ',
            'Number'    => ' ',
            'Features'  => ' '
        },
        'biz_phone' => {
            'Extension' => ' ',
            'Notes'     => ' ',
            'Mobility'  => ' ',
            'Number'    => ' ',
            'Features'  => ' '
        },
        'PrimaryContact' => ' ',
        'DateCreated'    => ' ',
        'DateRemoved'    => ' ',
        'AuthorityLevel' => ' ',
        'Notes'          => ' ',
        'CurrentTitle'   => ' ',
        'NodeId'         => ' ',
        'BizEmail'       => ' '
    },
    'DatePrinted' => ' '
};

with 'MooseX::Traits';
extends 'TMS::API::Core::FinChequesPrint';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
