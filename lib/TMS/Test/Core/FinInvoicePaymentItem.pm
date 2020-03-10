package TMS::Test::Core::FinInvoicePaymentItem;

use Moose;
use TMS::Test::BuildAttributes;
use TMS::API::Core::FinJournalEntry;
use TMS::API::Core::FinClass;
use TMS::API::Core::FinAccountType;
use TMS::API::Core::Entity;
use TMS::API::Core::FinItemTemplatesType;
use TMS::API::Core::FinItemTemplate;
use TMS::API::Core::FinPaymentMethod;
use TMS::API::Core::FinJob;
use TMS::API::Core::FinPaymentTerm;
use TMS::API::Core::FinAccount;
use TMS::API::Core::FinInvoice;
use TMS::API::Core::EntBusiness;
use TMS::API::Core::CntPhonesfax;
use TMS::API::Core::CntAddress;
use TMS::API::Core::HrAssociate;
use TMS::API::Core::FinTransaction;
use TMS::API::Core::BizBranch;
use TMS::API::Core::FinInvoicesItem;
use TMS::API::Core::EntPerson;
use TMS::API::Core::FinInvoicePayment;
use TMS::API::Core::FinTransactionType;

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
        'credit_journal_entry' => {
            'account' => {
                'account_type' => {
                    'UserDefined'  => ' ',
                    'DisplayOrder' => ' ',
                    'Credit'       => ' ',
                    'IncomeSheet'  => ' ',
                    'BalanceSheet' => ' ',
                    'Temp'         => ' ',
                    'Debit'        => ' ',
                    'Valid'        => ' ',
                    'Editable'     => ' ',
                    'Name'         => ' '
                },
                'ExternalName' => ' ',
                'UserDefined'  => ' ',
                'Description'  => ' ',
                'Balance'      => ' ',
                'DateCreated'  => ' ',
                'Valid'        => ' ',
                'Code'         => ' ',
                'Name'         => ' ',
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
            'job' => {
                'JobAddedBy' => ' ',
                'JobCreated' => ' ',
                'Title'      => ' '
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
                'DateTransaction'  => ' ',
                'Status'           => ' '
            },
            'VendorAmount'   => ' ',
            'DateCreated'    => ' ',
            'Classification' => ' ',
            'DebitCredit'    => ' ',
            'Amount'         => ' ',
            'ReportAmount'   => ' '
        },
        'debit_journal_entry' => {
            'account' => {
                'account_type' => {
                    'UserDefined'  => ' ',
                    'DisplayOrder' => ' ',
                    'Credit'       => ' ',
                    'IncomeSheet'  => ' ',
                    'BalanceSheet' => ' ',
                    'Temp'         => ' ',
                    'Debit'        => ' ',
                    'Valid'        => ' ',
                    'Editable'     => ' ',
                    'Name'         => ' '
                },
                'ExternalName' => ' ',
                'UserDefined'  => ' ',
                'Description'  => ' ',
                'Balance'      => ' ',
                'DateCreated'  => ' ',
                'Valid'        => ' ',
                'Code'         => ' ',
                'Name'         => ' ',
                'Active'       => ' '
            },
            'created_by' => {
                'ast' => {
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
            'job' => {
                'JobAddedBy' => ' ',
                'JobCreated' => ' ',
                'Title'      => ' '
            },
            'transaction' => {
                'class'      => {'Name' => ' '},
                'created_by' => {
                    'ast' => {
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
                'DateTransaction'  => ' ',
                'Status'           => ' '
            },
            'VendorAmount'   => ' ',
            'DateCreated'    => ' ',
            'Classification' => ' ',
            'DebitCredit'    => ' ',
            'Amount'         => ' ',
            'ReportAmount'   => ' '
        },
        'invoice' => {
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
            'payment_term' => {
                'DueNext'         => ' ',
                'Type'            => ' ',
                'DiscountInDays'  => ' ',
                'DiscountAmount'  => ' ',
                'DueInDays'       => ' ',
                'DiscountPercent' => ' ',
                'Name'            => ' '
            },
            'Notes'        => ' ',
            'RefNumber'    => ' ',
            'DateCreated'  => ' ',
            'PONumber'     => ' ',
            'DateInvoiced' => ' ',
            'Comments'     => ' ',
            'Status'       => ' '
        },
        'item_template' => {
            'created_by' => {
                'ast' => {
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
            'credit_account' => {
                'account_type' => {
                    'UserDefined'  => ' ',
                    'DisplayOrder' => ' ',
                    'Credit'       => ' ',
                    'IncomeSheet'  => ' ',
                    'BalanceSheet' => ' ',
                    'Temp'         => ' ',
                    'Debit'        => ' ',
                    'Valid'        => ' ',
                    'Editable'     => ' ',
                    'Name'         => ' '
                },
                'ExternalName' => ' ',
                'UserDefined'  => ' ',
                'Description'  => ' ',
                'Balance'      => ' ',
                'DateCreated'  => ' ',
                'Valid'        => ' ',
                'Code'         => ' ',
                'Name'         => ' ',
                'Active'       => ' '
            },
            'debit_account' => {
                'account_type' => {
                    'UserDefined'  => ' ',
                    'DisplayOrder' => ' ',
                    'Credit'       => ' ',
                    'IncomeSheet'  => ' ',
                    'BalanceSheet' => ' ',
                    'Temp'         => ' ',
                    'Debit'        => ' ',
                    'Valid'        => ' ',
                    'Editable'     => ' ',
                    'Name'         => ' '
                },
                'ExternalName' => ' ',
                'UserDefined'  => ' ',
                'Description'  => ' ',
                'Balance'      => ' ',
                'DateCreated'  => ' ',
                'Valid'        => ' ',
                'Code'         => ' ',
                'Name'         => ' ',
                'Active'       => ' '
            },
            'deleted_by' => {
                'ast' => {
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
            'template_type' => {
                'UserDefined'   => ' ',
                'Description'   => ' ',
                'DisplayToUser' => ' ',
                'Name'          => ' '
            },
            'transaction_type' => {'TransTypeName' => ' '},
            'updated_by'       => {
                'ast' => {
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
            'DateUpdated' => ' ',
            'UserDefined' => ' ',
            'Description' => ' ',
            'DateDeleted' => ' ',
            'DateCreated' => ' ',
            'PriceType'   => ' ',
            'Deleted'     => ' ',
            'Price'       => ' ',
            'Name'        => ' '
        },
        'job' => {
            'JobAddedBy' => ' ',
            'JobCreated' => ' ',
            'Title'      => ' '
        },
        'Notes'       => ' ',
        'DateCreated' => ' ',
        'Quantity'    => ' ',
        'Comments'    => ' ',
        'Amount'      => ' '
    },
    'invoice_payment' => {
        'created_by' => {
            'ast' => {
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
        'invoice' => {
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
            'payment_term' => {
                'DueNext'         => ' ',
                'Type'            => ' ',
                'DiscountInDays'  => ' ',
                'DiscountAmount'  => ' ',
                'DueInDays'       => ' ',
                'DiscountPercent' => ' ',
                'Name'            => ' '
            },
            'Notes'        => ' ',
            'RefNumber'    => ' ',
            'DateCreated'  => ' ',
            'PONumber'     => ' ',
            'DateInvoiced' => ' ',
            'Comments'     => ' ',
            'Status'       => ' '
        },
        'payer' => {
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
        'payment_method' => {},
        'transaction'    => {
            'class'      => {'Name' => ' '},
            'created_by' => {
                'ast' => {
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
            'DateTransaction'  => ' ',
            'Status'           => ' '
        },
        'DateCreated' => ' ',
        'Valid'       => ' ',
        'Amount'      => ' ',
        'DatePayment' => ' '
    }
};

with 'MooseX::Traits';
extends 'TMS::API::Core::FinInvoicePaymentItem';
override 'BUILDARGS' => sub { SetAttributes($attr, @_) };

1;
