package TMS::Test::Core::FinInvoicePaymentItem;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::FinPaymentMethod;
use TMS::API::Core::FinInvoicePayment;
use TMS::API::Core::FinAccountType;
use TMS::API::Core::FinPaymentTerm;
use TMS::API::Core::EntPerson;
use TMS::API::Core::FinJob;
use TMS::API::Core::FinAccount;
use TMS::API::Core::FinJournalEntry;
use TMS::API::Core::Entity;
use TMS::API::Core::FinItemTemplate;
use TMS::API::Core::FinClass;
use TMS::API::Core::CntAddress;
use TMS::API::Core::FinInvoicesItem;
use TMS::API::Core::FinInvoice;
use TMS::API::Core::FinTransaction;
use TMS::API::Core::FinTransactionType;
use TMS::API::Core::BizBranch;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::HrAssociate;
use TMS::API::Core::FinItemTemplatesType;
use TMS::API::Core::EntBusiness;

my $attr = {
    'invoice_item' => {
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
        'credit_journal_entry' => {
            'account' => {
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
                'Balance'      => ' ',
                'Valid'        => ' ',
                'Code'         => ' ',
                'UserDefined'  => ' ',
                'Name'         => ' ',
                'ExternalName' => ' ',
                'Description'  => ' ',
                'Active'       => ' ',
                'DateCreated'  => ' '
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
            'job' => {
                'Title'      => ' ',
                'JobCreated' => ' ',
                'JobAddedBy' => ' '
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
            'ReportAmount'   => ' ',
            'VendorAmount'   => ' ',
            'Amount'         => ' ',
            'DebitCredit'    => ' ',
            'DateCreated'    => ' ',
            'Classification' => ' '
        },
        'debit_journal_entry' => {
            'account' => {
                'account_type' => {
                    'IncomeSheet'  => ' ',
                    'UserDefined'  => ' ',
                    'Name'         => ' ',
                    'Debit'        => ' ',
                    'Temp'         => ' ',
                    'Valid'        => ' ',
                    'Credit'       => ' ',
                    'Editable'     => ' ',
                    'BalanceSheet' => ' ',
                    'DisplayOrder' => ' '
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
                    'NickName'   => ' ',
                    'Prefix'     => ' ',
                    'LastName'   => ' ',
                    'MiddleName' => ' ',
                    'FirstName'  => ' ',
                    'Suffix'     => ' '
                },
                'IsActive'    => ' ',
                'Notes'       => ' ',
                'DateCreated' => ' '
            },
            'job' => {
                'Title'      => ' ',
                'JobCreated' => ' ',
                'JobAddedBy' => ' '
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
            'ReportAmount'   => ' ',
            'VendorAmount'   => ' ',
            'Amount'         => ' ',
            'DebitCredit'    => ' ',
            'DateCreated'    => ' ',
            'Classification' => ' '
        },
        'invoice' => {
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
                    'NickName'   => ' ',
                    'Prefix'     => ' ',
                    'LastName'   => ' ',
                    'MiddleName' => ' ',
                    'FirstName'  => ' ',
                    'Suffix'     => ' '
                },
                'IsActive'    => ' ',
                'Notes'       => ' ',
                'DateCreated' => ' '
            },
            'payment_term' => {
                'DiscountPercent' => ' ',
                'Name'            => ' ',
                'DueNext'         => ' ',
                'Type'            => ' ',
                'DiscountInDays'  => ' ',
                'DueInDays'       => ' ',
                'DiscountAmount'  => ' '
            },
            'Comments'     => ' ',
            'Status'       => ' ',
            'Notes'        => ' ',
            'RefNumber'    => ' ',
            'DateCreated'  => ' ',
            'PONumber'     => ' ',
            'DateInvoiced' => ' '
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
            'credit_account' => {
                'account_type' => {
                    'IncomeSheet'  => ' ',
                    'UserDefined'  => ' ',
                    'Name'         => ' ',
                    'Debit'        => ' ',
                    'Temp'         => ' ',
                    'Valid'        => ' ',
                    'Credit'       => ' ',
                    'Editable'     => ' ',
                    'BalanceSheet' => ' ',
                    'DisplayOrder' => ' '
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
                    'UserDefined'  => ' ',
                    'Name'         => ' ',
                    'Debit'        => ' ',
                    'Temp'         => ' ',
                    'Valid'        => ' ',
                    'Credit'       => ' ',
                    'Editable'     => ' ',
                    'BalanceSheet' => ' ',
                    'DisplayOrder' => ' '
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
                    'NickName'   => ' ',
                    'Prefix'     => ' ',
                    'LastName'   => ' ',
                    'MiddleName' => ' ',
                    'FirstName'  => ' ',
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
        'job' => {
            'Title'      => ' ',
            'JobCreated' => ' ',
            'JobAddedBy' => ' '
        },
        'Comments'    => ' ',
        'Notes'       => ' ',
        'Amount'      => ' ',
        'DateCreated' => ' ',
        'Quantity'    => ' '
    },
    'invoice_payment' => {
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
        'invoice' => {
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
                    'NickName'   => ' ',
                    'Prefix'     => ' ',
                    'LastName'   => ' ',
                    'MiddleName' => ' ',
                    'FirstName'  => ' ',
                    'Suffix'     => ' '
                },
                'IsActive'    => ' ',
                'Notes'       => ' ',
                'DateCreated' => ' '
            },
            'payment_term' => {
                'DiscountPercent' => ' ',
                'Name'            => ' ',
                'DueNext'         => ' ',
                'Type'            => ' ',
                'DiscountInDays'  => ' ',
                'DueInDays'       => ' ',
                'DiscountAmount'  => ' '
            },
            'Comments'     => ' ',
            'Status'       => ' ',
            'Notes'        => ' ',
            'RefNumber'    => ' ',
            'DateCreated'  => ' ',
            'PONumber'     => ' ',
            'DateInvoiced' => ' '
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
                'NickName'   => ' ',
                'Prefix'     => ' ',
                'LastName'   => ' ',
                'MiddleName' => ' ',
                'FirstName'  => ' ',
                'Suffix'     => ' '
            },
            'IsActive'    => ' ',
            'Notes'       => ' ',
            'DateCreated' => ' '
        },
        'payment_method' => {},
        'transaction'    => {
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
        'DatePayment' => ' ',
        'Amount'      => ' ',
        'DateCreated' => ' ',
        'Valid'       => ' '
    }
};

with 'MooseX::Traits';
extends 'TMS::API::Core::FinInvoicePaymentItem';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
