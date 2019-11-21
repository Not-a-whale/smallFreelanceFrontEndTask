package TMS::API::Types::Objects;

use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use Devel::Confess;
use Data::Dumper;
use Date::Manip;

use Moose::Util::TypeConstraints;

our $AUTO_GENERATE = 0;

# ............................................................................
subtype 'FinClassObj', as class_type('TMS::API::Core::FinClass');
coerce 'FinClassObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Name'    => ' ',
            'ClassId' => undef
        };
        return TMS::Test::Core::FinClass->new(%$TheDefault);
    }
    return TMS::API::Core::FinClass->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Name'    => ' ',
            'ClassId' => undef
        };
        return TMS::Test::Core::FinClass->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinInvoicePaymentObj', as class_type('TMS::API::Core::FinInvoicePayment');
coerce 'FinInvoicePaymentObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'TransactionId'    => ' ',
            'InvoiceId'        => ' ',
            'DatePayment'      => ' ',
            'InvoicePaymentId' => undef,
            'CreatedBy'        => ' ',
            'PayerId'          => ' ',
            'DateCreated'      => ' ',
            'Amount'           => ' ',
            'PaymentMethodId'  => ' ',
            'Valid'            => ' '
        };
        return TMS::Test::Core::FinInvoicePayment->new(%$TheDefault);
    }
    return TMS::API::Core::FinInvoicePayment->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'TransactionId'    => ' ',
            'InvoiceId'        => ' ',
            'DatePayment'      => ' ',
            'InvoicePaymentId' => undef,
            'CreatedBy'        => ' ',
            'PayerId'          => ' ',
            'DateCreated'      => ' ',
            'Amount'           => ' ',
            'PaymentMethodId'  => ' ',
            'Valid'            => ' '
        };
        return TMS::Test::Core::FinInvoicePayment->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'HrAssociateObj', as class_type('TMS::API::Core::HrAssociate');
coerce 'HrAssociateObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'AuthorityLevel' => ' ',
            'CurrentTitle'   => ' ',
            'BizEmail'       => ' ',
            'BizPhone'       => ' ',
            'Notes'          => ' ',
            'DateCreated'    => ' ',
            'AstId'          => undef,
            'BizFax'         => ' ',
            'DateRemoved'    => ' ',
            'NodeId'         => ' '
        };
        return TMS::Test::Core::HrAssociate->new(%$TheDefault);
    }
    return TMS::API::Core::HrAssociate->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'AuthorityLevel' => ' ',
            'CurrentTitle'   => ' ',
            'BizEmail'       => ' ',
            'BizPhone'       => ' ',
            'Notes'          => ' ',
            'DateCreated'    => ' ',
            'AstId'          => undef,
            'BizFax'         => ' ',
            'DateRemoved'    => ' ',
            'NodeId'         => ' '
        };
        return TMS::Test::Core::HrAssociate->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'TskAlrmObj', as class_type('TMS::API::Core::TskAlrm');
coerce 'TskAlrmObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'message'   => ' ',
            'tskid'     => ' ',
            'repeat'    => ' ',
            'periodic'  => ' ',
            'turnoff'   => ' ',
            'alrmid'    => undef,
            'atcrontab' => ' '
        };
        return TMS::Test::Core::TskAlrm->new(%$TheDefault);
    }
    return TMS::API::Core::TskAlrm->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'message'   => ' ',
            'tskid'     => ' ',
            'repeat'    => ' ',
            'periodic'  => ' ',
            'turnoff'   => ' ',
            'alrmid'    => undef,
            'atcrontab' => ' '
        };
        return TMS::Test::Core::TskAlrm->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'DspLoadsDestinationObj', as class_type('TMS::API::Core::DspLoadsDestination');
coerce 'DspLoadsDestinationObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'LoadId'           => ' ',
            'PU_PO'            => ' ',
            'Pallets'          => ' ',
            'AppointmentEnd'   => ' ',
            'AppointmentStart' => ' ',
            'Commodity'        => ' ',
            'Branch'           => ' ',
            'AppointmentType'  => ' ',
            'StopOrder'        => ' ',
            'StopType'         => ' ',
            'AppointmentNotes' => ' ',
            'Pieces'           => ' ',
            'Weight'           => ' ',
            'DestinationId'    => undef
        };
        return TMS::Test::Core::DspLoadsDestination->new(%$TheDefault);
    }
    return TMS::API::Core::DspLoadsDestination->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'LoadId'           => ' ',
            'PU_PO'            => ' ',
            'Pallets'          => ' ',
            'AppointmentEnd'   => ' ',
            'AppointmentStart' => ' ',
            'Commodity'        => ' ',
            'Branch'           => ' ',
            'AppointmentType'  => ' ',
            'StopOrder'        => ' ',
            'StopType'         => ' ',
            'AppointmentNotes' => ' ',
            'Pieces'           => ' ',
            'Weight'           => ' ',
            'DestinationId'    => undef
        };
        return TMS::Test::Core::DspLoadsDestination->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'TskActnObj', as class_type('TMS::API::Core::TskActn');
coerce 'TskActnObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'actid'  => undef,
            'note'   => ' ',
            'PrsnId' => ' ',
            'tskid'  => ' '
        };
        return TMS::Test::Core::TskActn->new(%$TheDefault);
    }
    return TMS::API::Core::TskActn->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'actid'  => undef,
            'note'   => ' ',
            'PrsnId' => ' ',
            'tskid'  => ' '
        };
        return TMS::Test::Core::TskActn->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinJournalEntryObj', as class_type('TMS::API::Core::FinJournalEntry');
coerce 'FinJournalEntryObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Classification' => ' ',
            'AccountId'      => ' ',
            'VendorAmount'   => ' ',
            'DateCreated'    => ' ',
            'JrlEntryId'     => undef,
            'Amount'         => ' ',
            'JobId'          => ' ',
            'CreatedBy'      => ' ',
            'EntityId'       => ' ',
            'TransactionId'  => ' ',
            'ReportAmount'   => ' ',
            'DebitCredit'    => ' '
        };
        return TMS::Test::Core::FinJournalEntry->new(%$TheDefault);
    }
    return TMS::API::Core::FinJournalEntry->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Classification' => ' ',
            'AccountId'      => ' ',
            'VendorAmount'   => ' ',
            'DateCreated'    => ' ',
            'JrlEntryId'     => undef,
            'Amount'         => ' ',
            'JobId'          => ' ',
            'CreatedBy'      => ' ',
            'EntityId'       => ' ',
            'TransactionId'  => ' ',
            'ReportAmount'   => ' ',
            'DebitCredit'    => ' '
        };
        return TMS::Test::Core::FinJournalEntry->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'CmmPackageObj', as class_type('TMS::API::Core::CmmPackage');
coerce 'CmmPackageObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {'Name' => undef};
        return TMS::Test::Core::CmmPackage->new(%$TheDefault);
    }
    return TMS::API::Core::CmmPackage->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {'Name' => undef};
        return TMS::Test::Core::CmmPackage->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'MsgAccessObj', as class_type('TMS::API::Core::MsgAccess');
coerce 'MsgAccessObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'macsid'         => undef,
            'PermissionName' => ' '
        };
        return TMS::Test::Core::MsgAccess->new(%$TheDefault);
    }
    return TMS::API::Core::MsgAccess->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'macsid'         => undef,
            'PermissionName' => ' '
        };
        return TMS::Test::Core::MsgAccess->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'BizBranchObj', as class_type('TMS::API::Core::BizBranch');
coerce 'BizBranchObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'BrnchFax'     => ' ',
            'BizId'        => ' ',
            'BrnchAddress' => ' ',
            'BrnchPhone'   => ' ',
            'BrnchId'      => undef,
            'BrnchEMail'   => ' ',
            'OfficeName'   => ' '
        };
        return TMS::Test::Core::BizBranch->new(%$TheDefault);
    }
    return TMS::API::Core::BizBranch->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'BrnchFax'     => ' ',
            'BizId'        => ' ',
            'BrnchAddress' => ' ',
            'BrnchPhone'   => ' ',
            'BrnchId'      => undef,
            'BrnchEMail'   => ' ',
            'OfficeName'   => ' '
        };
        return TMS::Test::Core::BizBranch->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'SftVehicleInspectionObj', as class_type('TMS::API::Core::SftVehicleInspection');
coerce 'SftVehicleInspectionObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Status'               => ' ',
            'DateInspection'       => ' ',
            'InspectionNumber'     => ' ',
            'InspectionId'         => undef,
            'InspectionScheduleId' => ' ',
            'Remarks'              => ' ',
            'Mileage'              => ' ',
            'LocationOfRecords'    => ' ',
            'InspectorId'          => ' ',
            'InspectorSignatureId' => ' '
        };
        return TMS::Test::Core::SftVehicleInspection->new(%$TheDefault);
    }
    return TMS::API::Core::SftVehicleInspection->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Status'               => ' ',
            'DateInspection'       => ' ',
            'InspectionNumber'     => ' ',
            'InspectionId'         => undef,
            'InspectionScheduleId' => ' ',
            'Remarks'              => ' ',
            'Mileage'              => ' ',
            'LocationOfRecords'    => ' ',
            'InspectorId'          => ' ',
            'InspectorSignatureId' => ' '
        };
        return TMS::Test::Core::SftVehicleInspection->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinInvoicesItemObj', as class_type('TMS::API::Core::FinInvoicesItem');
coerce 'FinInvoicesItemObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'InvoiceId'            => ' ',
            'ItemTemplateId'       => ' ',
            'Notes'                => ' ',
            'InvoiceItemId'        => undef,
            'DateCreated'          => ' ',
            'JobId'                => ' ',
            'Comments'             => ' ',
            'DebitJournalEntryId'  => ' ',
            'CreatedBy'            => ' ',
            'CreditJournalEntryId' => ' ',
            'Quantity'             => ' ',
            'Amount'               => ' '
        };
        return TMS::Test::Core::FinInvoicesItem->new(%$TheDefault);
    }
    return TMS::API::Core::FinInvoicesItem->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'InvoiceId'            => ' ',
            'ItemTemplateId'       => ' ',
            'Notes'                => ' ',
            'InvoiceItemId'        => undef,
            'DateCreated'          => ' ',
            'JobId'                => ' ',
            'Comments'             => ' ',
            'DebitJournalEntryId'  => ' ',
            'CreatedBy'            => ' ',
            'CreditJournalEntryId' => ' ',
            'Quantity'             => ' ',
            'Amount'               => ' '
        };
        return TMS::Test::Core::FinInvoicesItem->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'SftVehicleInspectItemObj', as class_type('TMS::API::Core::SftVehicleInspectItem');
coerce 'SftVehicleInspectItemObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'InspItmId'    => undef,
            'ItemAreaName' => ' ',
            'Notes'        => ' '
        };
        return TMS::Test::Core::SftVehicleInspectItem->new(%$TheDefault);
    }
    return TMS::API::Core::SftVehicleInspectItem->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'InspItmId'    => undef,
            'ItemAreaName' => ' ',
            'Notes'        => ' '
        };
        return TMS::Test::Core::SftVehicleInspectItem->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'InvEquipmentTypeObj', as class_type('TMS::API::Core::InvEquipmentType');
coerce 'InvEquipmentTypeObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'EquipmentTypeId' => undef,
            'Name'            => ' '
        };
        return TMS::Test::Core::InvEquipmentType->new(%$TheDefault);
    }
    return TMS::API::Core::InvEquipmentType->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'EquipmentTypeId' => undef,
            'Name'            => ' '
        };
        return TMS::Test::Core::InvEquipmentType->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'InvTiresizeObj', as class_type('TMS::API::Core::InvTiresize');
coerce 'InvTiresizeObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Type'   => ' ',
            'Name'   => ' ',
            'TireId' => undef
        };
        return TMS::Test::Core::InvTiresize->new(%$TheDefault);
    }
    return TMS::API::Core::InvTiresize->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Type'   => ' ',
            'Name'   => ' ',
            'TireId' => undef
        };
        return TMS::Test::Core::InvTiresize->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinBillingTagObj', as class_type('TMS::API::Core::FinBillingTag');
coerce 'FinBillingTagObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DateCreated'  => ' ',
            'CreatedBy'    => ' ',
            'BillingTagId' => undef,
            'UserDefined'  => ' ',
            'BillingTag'   => ' '
        };
        return TMS::Test::Core::FinBillingTag->new(%$TheDefault);
    }
    return TMS::API::Core::FinBillingTag->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DateCreated'  => ' ',
            'CreatedBy'    => ' ',
            'BillingTagId' => undef,
            'UserDefined'  => ' ',
            'BillingTag'   => ' '
        };
        return TMS::Test::Core::FinBillingTag->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'InvSupportVendorObj', as class_type('TMS::API::Core::InvSupportVendor');
coerce 'InvSupportVendorObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'PrimaryContact' => ' ',
            'Name'           => ' ',
            'VendorId'       => ' ',
            'Description'    => ' ',
            'SupportId'      => undef
        };
        return TMS::Test::Core::InvSupportVendor->new(%$TheDefault);
    }
    return TMS::API::Core::InvSupportVendor->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'PrimaryContact' => ' ',
            'Name'           => ' ',
            'VendorId'       => ' ',
            'Description'    => ' ',
            'SupportId'      => undef
        };
        return TMS::Test::Core::InvSupportVendor->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinPaymentMethodObj', as class_type('TMS::API::Core::FinPaymentMethod');
coerce 'FinPaymentMethodObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {'PaymentMethodId' => undef};
        return TMS::Test::Core::FinPaymentMethod->new(%$TheDefault);
    }
    return TMS::API::Core::FinPaymentMethod->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {'PaymentMethodId' => undef};
        return TMS::Test::Core::FinPaymentMethod->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinAccountTypeObj', as class_type('TMS::API::Core::FinAccountType');
coerce 'FinAccountTypeObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'AccountTypeId' => undef,
            'ParentId'      => ' ',
            'Temp'          => ' ',
            'Editable'      => ' ',
            'DisplayOrder'  => ' ',
            'Credit'        => ' ',
            'UserDefined'   => ' ',
            'Debit'         => ' ',
            'IncomeSheet'   => ' ',
            'Name'          => ' ',
            'Valid'         => ' ',
            'BalanceSheet'  => ' '
        };
        return TMS::Test::Core::FinAccountType->new(%$TheDefault);
    }
    return TMS::API::Core::FinAccountType->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'AccountTypeId' => undef,
            'ParentId'      => ' ',
            'Temp'          => ' ',
            'Editable'      => ' ',
            'DisplayOrder'  => ' ',
            'Credit'        => ' ',
            'UserDefined'   => ' ',
            'Debit'         => ' ',
            'IncomeSheet'   => ' ',
            'Name'          => ' ',
            'Valid'         => ' ',
            'BalanceSheet'  => ' '
        };
        return TMS::Test::Core::FinAccountType->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'DrvCdlEndorsementObj', as class_type('TMS::API::Core::DrvCdlEndorsement');
coerce 'DrvCdlEndorsementObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Endorsement'   => ' ',
            'ExpiredDate'   => ' ',
            'ValidFromDate' => ' ',
            'EndrsId'       => undef
        };
        return TMS::Test::Core::DrvCdlEndorsement->new(%$TheDefault);
    }
    return TMS::API::Core::DrvCdlEndorsement->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Endorsement'   => ' ',
            'ExpiredDate'   => ' ',
            'ValidFromDate' => ' ',
            'EndrsId'       => undef
        };
        return TMS::Test::Core::DrvCdlEndorsement->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'EntityObj', as class_type('TMS::API::Core::Entity');
coerce 'EntityObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'EntityId'    => undef,
            'PersonId'    => ' ',
            'Notes'       => ' ',
            'BusinessId'  => ' ',
            'IsActive'    => ' ',
            'DateCreated' => ' '
        };
        return TMS::Test::Core::Entity->new(%$TheDefault);
    }
    return TMS::API::Core::Entity->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'EntityId'    => undef,
            'PersonId'    => ' ',
            'Notes'       => ' ',
            'BusinessId'  => ' ',
            'IsActive'    => ' ',
            'DateCreated' => ' '
        };
        return TMS::Test::Core::Entity->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'InsPolicyObj', as class_type('TMS::API::Core::InsPolicy');
coerce 'InsPolicyObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DownpaymentAmount' => ' ',
            'PaidBy'            => ' ',
            'WhatIsInsured'     => ' ',
            'ExpirationDate'    => ' ',
            'ProviderAgent'     => ' ',
            'PolicyNumber'      => ' ',
            'ProofOfInsurance'  => ' ',
            'EffectiveDate'     => ' ',
            'InsId'             => undef,
            'TagName'           => ' ',
            'InsuredAmount'     => ' '
        };
        return TMS::Test::Core::InsPolicy->new(%$TheDefault);
    }
    return TMS::API::Core::InsPolicy->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DownpaymentAmount' => ' ',
            'PaidBy'            => ' ',
            'WhatIsInsured'     => ' ',
            'ExpirationDate'    => ' ',
            'ProviderAgent'     => ' ',
            'PolicyNumber'      => ' ',
            'ProofOfInsurance'  => ' ',
            'EffectiveDate'     => ' ',
            'InsId'             => undef,
            'TagName'           => ' ',
            'InsuredAmount'     => ' '
        };
        return TMS::Test::Core::InsPolicy->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'InvTrailerTypeObj', as class_type('TMS::API::Core::InvTrailerType');
coerce 'InvTrailerTypeObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {'Name' => undef};
        return TMS::Test::Core::InvTrailerType->new(%$TheDefault);
    }
    return TMS::API::Core::InvTrailerType->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {'Name' => undef};
        return TMS::Test::Core::InvTrailerType->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinPaymentTermObj', as class_type('TMS::API::Core::FinPaymentTerm');
coerce 'FinPaymentTermObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DiscountPercent' => ' ',
            'DueNext'         => ' ',
            'DiscountInDays'  => ' ',
            'DueInDays'       => ' ',
            'Name'            => ' ',
            'Type'            => ' ',
            'DiscountAmount'  => ' ',
            'PaymentTermId'   => undef
        };
        return TMS::Test::Core::FinPaymentTerm->new(%$TheDefault);
    }
    return TMS::API::Core::FinPaymentTerm->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DiscountPercent' => ' ',
            'DueNext'         => ' ',
            'DiscountInDays'  => ' ',
            'DueInDays'       => ' ',
            'Name'            => ' ',
            'Type'            => ' ',
            'DiscountAmount'  => ' ',
            'PaymentTermId'   => undef
        };
        return TMS::Test::Core::FinPaymentTerm->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'TskTaskObj', as class_type('TMS::API::Core::TskTask');
coerce 'TskTaskObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'tskid'     => undef,
            'estimated' => ' ',
            'completed' => ' ',
            'created'   => ' ',
            'PrsnId'    => ' ',
            'duedate'   => ' ',
            'priority'  => ' ',
            'startdate' => ' ',
            'prjid'     => ' ',
            'name'      => ' ',
            'severity'  => ' '
        };
        return TMS::Test::Core::TskTask->new(%$TheDefault);
    }
    return TMS::API::Core::TskTask->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'tskid'     => undef,
            'estimated' => ' ',
            'completed' => ' ',
            'created'   => ' ',
            'PrsnId'    => ' ',
            'duedate'   => ' ',
            'priority'  => ' ',
            'startdate' => ' ',
            'prjid'     => ' ',
            'name'      => ' ',
            'severity'  => ' '
        };
        return TMS::Test::Core::TskTask->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'InvVehicleObj', as class_type('TMS::API::Core::InvVehicle');
coerce 'InvVehicleObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Axels'         => ' ',
            'Length'        => ' ',
            'Height'        => ' ',
            'TireSize'      => ' ',
            'Fuel'          => ' ',
            'VIN'           => ' ',
            'Year'          => ' ',
            'Model'         => ' ',
            'VehicleId'     => undef,
            'Make'          => ' ',
            'Color'         => ' ',
            'Width'         => ' ',
            'CarrierId'     => ' ',
            'UnladenWeight' => ' '
        };
        return TMS::Test::Core::InvVehicle->new(%$TheDefault);
    }
    return TMS::API::Core::InvVehicle->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Axels'         => ' ',
            'Length'        => ' ',
            'Height'        => ' ',
            'TireSize'      => ' ',
            'Fuel'          => ' ',
            'VIN'           => ' ',
            'Year'          => ' ',
            'Model'         => ' ',
            'VehicleId'     => undef,
            'Make'          => ' ',
            'Color'         => ' ',
            'Width'         => ' ',
            'CarrierId'     => ' ',
            'UnladenWeight' => ' '
        };
        return TMS::Test::Core::InvVehicle->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'TmpRelationsNodeObj', as class_type('TMS::API::Core::TmpRelationsNode');
coerce 'TmpRelationsNodeObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Name'      => ' ',
            'ParentId'  => ' ',
            'RelNodeId' => undef
        };
        return TMS::Test::Core::TmpRelationsNode->new(%$TheDefault);
    }
    return TMS::API::Core::TmpRelationsNode->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Name'      => ' ',
            'ParentId'  => ' ',
            'RelNodeId' => undef
        };
        return TMS::Test::Core::TmpRelationsNode->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'InvUnitObj', as class_type('TMS::API::Core::InvUnit');
coerce 'InvUnitObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'UnitTag' => ' ',
            'UnitId'  => undef
        };
        return TMS::Test::Core::InvUnit->new(%$TheDefault);
    }
    return TMS::API::Core::InvUnit->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'UnitTag' => ' ',
            'UnitId'  => undef
        };
        return TMS::Test::Core::InvUnit->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'EntPersonObj', as class_type('TMS::API::Core::EntPerson');
coerce 'EntPersonObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'NickName'   => ' ',
            'MiddleName' => ' ',
            'BrnchId'    => ' ',
            'LastName'   => ' ',
            'Prefix'     => ' ',
            'FirstName'  => ' ',
            'PrsnId'     => undef,
            'Suffix'     => ' '
        };
        return TMS::Test::Core::EntPerson->new(%$TheDefault);
    }
    return TMS::API::Core::EntPerson->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'NickName'   => ' ',
            'MiddleName' => ' ',
            'BrnchId'    => ' ',
            'LastName'   => ' ',
            'Prefix'     => ' ',
            'FirstName'  => ' ',
            'PrsnId'     => undef,
            'Suffix'     => ' '
        };
        return TMS::Test::Core::EntPerson->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'SftVehicleInspectedItemObj', as class_type('TMS::API::Core::SftVehicleInspectedItem');
coerce 'SftVehicleInspectedItemObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Status'        => ' ',
            'InspectionId'  => ' ',
            'InspectedId'   => undef,
            'InspectedItem' => ' ',
            'InspectedDate' => ' '
        };
        return TMS::Test::Core::SftVehicleInspectedItem->new(%$TheDefault);
    }
    return TMS::API::Core::SftVehicleInspectedItem->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Status'        => ' ',
            'InspectionId'  => ' ',
            'InspectedId'   => undef,
            'InspectedItem' => ' ',
            'InspectedDate' => ' '
        };
        return TMS::Test::Core::SftVehicleInspectedItem->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'CntPhonesfaxObj', as class_type('TMS::API::Core::CntPhonesfax');
coerce 'CntPhonesfaxObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Features'  => ' ',
            'Number'    => ' ',
            'Extension' => ' ',
            'PhnFaxId'  => undef,
            'Mobility'  => ' ',
            'Notes'     => ' '
        };
        return TMS::Test::Core::CntPhonesfax->new(%$TheDefault);
    }
    return TMS::API::Core::CntPhonesfax->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Features'  => ' ',
            'Number'    => ' ',
            'Extension' => ' ',
            'PhnFaxId'  => undef,
            'Mobility'  => ' ',
            'Notes'     => ' '
        };
        return TMS::Test::Core::CntPhonesfax->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinTransactionTypeObj', as class_type('TMS::API::Core::FinTransactionType');
coerce 'FinTransactionTypeObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'TransTypeId'   => undef,
            'TransTypeName' => ' '
        };
        return TMS::Test::Core::FinTransactionType->new(%$TheDefault);
    }
    return TMS::API::Core::FinTransactionType->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'TransTypeId'   => undef,
            'TransTypeName' => ' '
        };
        return TMS::Test::Core::FinTransactionType->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinBillingInfoObj', as class_type('TMS::API::Core::FinBillingInfo');
coerce 'FinBillingInfoObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Address'         => ' ',
            'PayToTheOrderOf' => ' ',
            'DateIn'          => ' ',
            'Phone'           => ' ',
            'ContactName'     => ' ',
            'BillingTagId'    => ' ',
            'BillingId'       => undef,
            'DateOut'         => ' ',
            'EMail'           => ' ',
            'Notes'           => ' ',
            'EntityId'        => ' ',
            'Fax'             => ' '
        };
        return TMS::Test::Core::FinBillingInfo->new(%$TheDefault);
    }
    return TMS::API::Core::FinBillingInfo->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Address'         => ' ',
            'PayToTheOrderOf' => ' ',
            'DateIn'          => ' ',
            'Phone'           => ' ',
            'ContactName'     => ' ',
            'BillingTagId'    => ' ',
            'BillingId'       => undef,
            'DateOut'         => ' ',
            'EMail'           => ' ',
            'Notes'           => ' ',
            'EntityId'        => ' ',
            'Fax'             => ' '
        };
        return TMS::Test::Core::FinBillingInfo->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'EntCarrierObj', as class_type('TMS::API::Core::EntCarrier');
coerce 'EntCarrierObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'IFTA_State'           => ' ',
            'state_FL'             => ' ',
            'CrType'               => ' ',
            'state_OR'             => ' ',
            'state_NC'             => ' ',
            'state_KY'             => ' ',
            'CarrierId'            => undef,
            'McCertificatePhoto'   => ' ',
            'SCAC'                 => ' ',
            'state_SC'             => ' ',
            'RateConfEmailAddress' => ' ',
            'state_NM'             => ' ',
            'MC'                   => ' ',
            'state_NY'             => ' ',
            'IFTA_Acc'             => ' ',
            'DOT'                  => ' '
        };
        return TMS::Test::Core::EntCarrier->new(%$TheDefault);
    }
    return TMS::API::Core::EntCarrier->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'IFTA_State'           => ' ',
            'state_FL'             => ' ',
            'CrType'               => ' ',
            'state_OR'             => ' ',
            'state_NC'             => ' ',
            'state_KY'             => ' ',
            'CarrierId'            => undef,
            'McCertificatePhoto'   => ' ',
            'SCAC'                 => ' ',
            'state_SC'             => ' ',
            'RateConfEmailAddress' => ' ',
            'state_NM'             => ' ',
            'MC'                   => ' ',
            'state_NY'             => ' ',
            'IFTA_Acc'             => ' ',
            'DOT'                  => ' '
        };
        return TMS::Test::Core::EntCarrier->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'AppRoleObj', as class_type('TMS::API::Core::AppRole');
coerce 'AppRoleObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Editable'    => ' ',
            'UpdatedBy'   => ' ',
            'CreatedBy'   => ' ',
            'RoleName'    => ' ',
            'UserDefined' => ' ',
            'DateCreated' => ' ',
            'DateUpdated' => ' ',
            'Description' => ' ',
            'RoleId'      => undef
        };
        return TMS::Test::Core::AppRole->new(%$TheDefault);
    }
    return TMS::API::Core::AppRole->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Editable'    => ' ',
            'UpdatedBy'   => ' ',
            'CreatedBy'   => ' ',
            'RoleName'    => ' ',
            'UserDefined' => ' ',
            'DateCreated' => ' ',
            'DateUpdated' => ' ',
            'Description' => ' ',
            'RoleId'      => undef
        };
        return TMS::Test::Core::AppRole->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'DrvDriverObj', as class_type('TMS::API::Core::DrvDriver');
coerce 'DrvDriverObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'LastAnnualReview'    => ' ',
            'PullNotice'          => ' ',
            'LocalRoutes'         => ' ',
            'DriverId'            => undef,
            'InternationalRoutes' => ' '
        };
        return TMS::Test::Core::DrvDriver->new(%$TheDefault);
    }
    return TMS::API::Core::DrvDriver->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'LastAnnualReview'    => ' ',
            'PullNotice'          => ' ',
            'LocalRoutes'         => ' ',
            'DriverId'            => undef,
            'InternationalRoutes' => ' '
        };
        return TMS::Test::Core::DrvDriver->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'InvRoleObj', as class_type('TMS::API::Core::InvRole');
coerce 'InvRoleObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'RoleName'  => ' ',
            'Notes'     => ' ',
            'InvRoleId' => undef
        };
        return TMS::Test::Core::InvRole->new(%$TheDefault);
    }
    return TMS::API::Core::InvRole->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'RoleName'  => ' ',
            'Notes'     => ' ',
            'InvRoleId' => undef
        };
        return TMS::Test::Core::InvRole->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'SftElogStatObj', as class_type('TMS::API::Core::SftElogStat');
coerce 'SftElogStatObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'LocationProviderId' => ' ',
            'GpsReqId'           => undef,
            'Speed'              => ' ',
            'Fuel'               => ' ',
            'Latitude'           => ' ',
            'Longitude'          => ' ',
            'Acquired'           => ' ',
            'EquipmentId'        => ' ',
            'Posted'             => ' ',
            'Odometer'           => ' ',
            'Bearings'           => ' ',
            'EngineHours'        => ' ',
            'VehicleState'       => ' '
        };
        return TMS::Test::Core::SftElogStat->new(%$TheDefault);
    }
    return TMS::API::Core::SftElogStat->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'LocationProviderId' => ' ',
            'GpsReqId'           => undef,
            'Speed'              => ' ',
            'Fuel'               => ' ',
            'Latitude'           => ' ',
            'Longitude'          => ' ',
            'Acquired'           => ' ',
            'EquipmentId'        => ' ',
            'Posted'             => ' ',
            'Odometer'           => ' ',
            'Bearings'           => ' ',
            'EngineHours'        => ' ',
            'VehicleState'       => ' '
        };
        return TMS::Test::Core::SftElogStat->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'AppPermissionObj', as class_type('TMS::API::Core::AppPermission');
coerce 'AppPermissionObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'AccessName'   => ' ',
            'PermissionId' => undef,
            'Feature'      => ' '
        };
        return TMS::Test::Core::AppPermission->new(%$TheDefault);
    }
    return TMS::API::Core::AppPermission->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'AccessName'   => ' ',
            'PermissionId' => undef,
            'Feature'      => ' '
        };
        return TMS::Test::Core::AppPermission->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinItemTemplatesTypeObj', as class_type('TMS::API::Core::FinItemTemplatesType');
coerce 'FinItemTemplatesTypeObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'UserDefined'    => ' ',
            'TemplateTypeId' => undef,
            'DisplayToUser'  => ' ',
            'Description'    => ' ',
            'Name'           => ' '
        };
        return TMS::Test::Core::FinItemTemplatesType->new(%$TheDefault);
    }
    return TMS::API::Core::FinItemTemplatesType->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'UserDefined'    => ' ',
            'TemplateTypeId' => undef,
            'DisplayToUser'  => ' ',
            'Description'    => ' ',
            'Name'           => ' '
        };
        return TMS::Test::Core::FinItemTemplatesType->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinTransactionObj', as class_type('TMS::API::Core::FinTransaction');
coerce 'FinTransactionObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'JobId'           => ' ',
            'DateCreated'     => ' ',
            'TransactionType' => ' ',
            'RefNumber'       => ' ',
            'DateTransaction' => ' ',
            'Memo'            => ' ',
            'TransactionId'   => undef,
            'Class'           => ' ',
            'Status'          => ' ',
            'CreatedBy'       => ' '
        };
        return TMS::Test::Core::FinTransaction->new(%$TheDefault);
    }
    return TMS::API::Core::FinTransaction->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'JobId'           => ' ',
            'DateCreated'     => ' ',
            'TransactionType' => ' ',
            'RefNumber'       => ' ',
            'DateTransaction' => ' ',
            'Memo'            => ' ',
            'TransactionId'   => undef,
            'Class'           => ' ',
            'Status'          => ' ',
            'CreatedBy'       => ' '
        };
        return TMS::Test::Core::FinTransaction->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'GenFileObj', as class_type('TMS::API::Core::GenFile');
coerce 'GenFileObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'SHASIG'        => ' ',
            'FileName'      => ' ',
            'ExpiredDate'   => ' ',
            'UploadDate'    => ' ',
            'DocumentTitle' => ' ',
            'Notes'         => ' ',
            'FileData'      => ' ',
            'FileId'        => undef,
            'MIMEType'      => ' ',
            'Keywords'      => ' '
        };
        return TMS::Test::Core::GenFile->new(%$TheDefault);
    }
    return TMS::API::Core::GenFile->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'SHASIG'        => ' ',
            'FileName'      => ' ',
            'ExpiredDate'   => ' ',
            'UploadDate'    => ' ',
            'DocumentTitle' => ' ',
            'Notes'         => ' ',
            'FileData'      => ' ',
            'FileId'        => undef,
            'MIMEType'      => ' ',
            'Keywords'      => ' '
        };
        return TMS::Test::Core::GenFile->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'AppMenuItemObj', as class_type('TMS::API::Core::AppMenuItem');
coerce 'AppMenuItemObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'SortIndex'  => ' ',
            'MenuItemId' => undef,
            'Icon'       => ' ',
            'Target'     => ' ',
            'Label'      => ' ',
            'Title'      => ' ',
            'Route'      => ' ',
            'Help'       => ' ',
            'Enabled'    => ' ',
            'ParentId'   => ' '
        };
        return TMS::Test::Core::AppMenuItem->new(%$TheDefault);
    }
    return TMS::API::Core::AppMenuItem->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'SortIndex'  => ' ',
            'MenuItemId' => undef,
            'Icon'       => ' ',
            'Target'     => ' ',
            'Label'      => ' ',
            'Title'      => ' ',
            'Route'      => ' ',
            'Help'       => ' ',
            'Enabled'    => ' ',
            'ParentId'   => ' '
        };
        return TMS::Test::Core::AppMenuItem->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'DrvDesttypeObj', as class_type('TMS::API::Core::DrvDesttype');
coerce 'DrvDesttypeObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Notes'         => ' ',
            'DesiredDestId' => undef,
            'DestName'      => ' '
        };
        return TMS::Test::Core::DrvDesttype->new(%$TheDefault);
    }
    return TMS::API::Core::DrvDesttype->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Notes'         => ' ',
            'DesiredDestId' => undef,
            'DestName'      => ' '
        };
        return TMS::Test::Core::DrvDesttype->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'AppFeatureObj', as class_type('TMS::API::Core::AppFeature');
coerce 'AppFeatureObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'AppFeatureId' => undef,
            'Name'         => ' ',
            'Notes'        => ' '
        };
        return TMS::Test::Core::AppFeature->new(%$TheDefault);
    }
    return TMS::API::Core::AppFeature->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'AppFeatureId' => undef,
            'Name'         => ' ',
            'Notes'        => ' '
        };
        return TMS::Test::Core::AppFeature->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'DspLoadObj', as class_type('TMS::API::Core::DspLoad');
coerce 'DspLoadObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'LoadType'       => ' ',
            'ProNumber'      => ' ',
            'DateBooked'     => ' ',
            'TempMode'       => ' ',
            'CreatedBy'      => ' ',
            'Status'         => ' ',
            'LoadId'         => undef,
            'BrokerId'       => ' ',
            'ReeferTempHigh' => ' ',
            'TeamRequired'   => ' ',
            'GoogleRoute'    => ' ',
            'TruckType'      => ' ',
            'LoadNumber'     => ' ',
            'ShipperId'      => ' ',
            'DateCreated'    => ' ',
            'BookedBy'       => ' ',
            'Precooling'     => ' ',
            'Job'            => ' ',
            'LoadRate'       => ' ',
            'DispatchNote'   => ' ',
            'ReeferTempLow'  => ' '
        };
        return TMS::Test::Core::DspLoad->new(%$TheDefault);
    }
    return TMS::API::Core::DspLoad->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'LoadType'       => ' ',
            'ProNumber'      => ' ',
            'DateBooked'     => ' ',
            'TempMode'       => ' ',
            'CreatedBy'      => ' ',
            'Status'         => ' ',
            'LoadId'         => undef,
            'BrokerId'       => ' ',
            'ReeferTempHigh' => ' ',
            'TeamRequired'   => ' ',
            'GoogleRoute'    => ' ',
            'TruckType'      => ' ',
            'LoadNumber'     => ' ',
            'ShipperId'      => ' ',
            'DateCreated'    => ' ',
            'BookedBy'       => ' ',
            'Precooling'     => ' ',
            'Job'            => ' ',
            'LoadRate'       => ' ',
            'DispatchNote'   => ' ',
            'ReeferTempLow'  => ' '
        };
        return TMS::Test::Core::DspLoad->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'AppAccountObj', as class_type('TMS::API::Core::AppAccount');
coerce 'AppAccountObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Locked'       => ' ',
            'Salt'         => ' ',
            'Username'     => ' ',
            'DateCreated'  => ' ',
            'AppAccountId' => undef,
            'PasswordHash' => ' ',
            'UserId'       => ' '
        };
        return TMS::Test::Core::AppAccount->new(%$TheDefault);
    }
    return TMS::API::Core::AppAccount->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Locked'       => ' ',
            'Salt'         => ' ',
            'Username'     => ' ',
            'DateCreated'  => ' ',
            'AppAccountId' => undef,
            'PasswordHash' => ' ',
            'UserId'       => ' '
        };
        return TMS::Test::Core::AppAccount->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinItemTemplateObj', as class_type('TMS::API::Core::FinItemTemplate');
coerce 'FinItemTemplateObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Deleted'         => ' ',
            'DateCreated'     => ' ',
            'Description'     => ' ',
            'DateUpdated'     => ' ',
            'DateDeleted'     => ' ',
            'CreditAccountId' => ' ',
            'ItemTemplateId'  => undef,
            'UpdatedBy'       => ' ',
            'EntityId'        => ' ',
            'DeletedBy'       => ' ',
            'UserDefined'     => ' ',
            'TemplateTypeId'  => ' ',
            'TransactionType' => ' ',
            'Name'            => ' ',
            'PriceType'       => ' ',
            'DebitAccountId'  => ' ',
            'ParentId'        => ' ',
            'Price'           => ' ',
            'CreatedBy'       => ' '
        };
        return TMS::Test::Core::FinItemTemplate->new(%$TheDefault);
    }
    return TMS::API::Core::FinItemTemplate->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Deleted'         => ' ',
            'DateCreated'     => ' ',
            'Description'     => ' ',
            'DateUpdated'     => ' ',
            'DateDeleted'     => ' ',
            'CreditAccountId' => ' ',
            'ItemTemplateId'  => undef,
            'UpdatedBy'       => ' ',
            'EntityId'        => ' ',
            'DeletedBy'       => ' ',
            'UserDefined'     => ' ',
            'TemplateTypeId'  => ' ',
            'TransactionType' => ' ',
            'Name'            => ' ',
            'PriceType'       => ' ',
            'DebitAccountId'  => ' ',
            'ParentId'        => ' ',
            'Price'           => ' ',
            'CreatedBy'       => ' '
        };
        return TMS::Test::Core::FinItemTemplate->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinBillingBankObj', as class_type('TMS::API::Core::FinBillingBank');
coerce 'FinBillingBankObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Notes'         => ' ',
            'Institution'   => ' ',
            'AccountNumber' => ' ',
            'Active'        => ' ',
            'RoutingNumber' => ' ',
            'AccountType'   => ' ',
            'Purpose'       => ' ',
            'BankId'        => undef,
            'BillingId'     => ' '
        };
        return TMS::Test::Core::FinBillingBank->new(%$TheDefault);
    }
    return TMS::API::Core::FinBillingBank->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Notes'         => ' ',
            'Institution'   => ' ',
            'AccountNumber' => ' ',
            'Active'        => ' ',
            'RoutingNumber' => ' ',
            'AccountType'   => ' ',
            'Purpose'       => ' ',
            'BankId'        => undef,
            'BillingId'     => ' '
        };
        return TMS::Test::Core::FinBillingBank->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'SftInspectionScheduleObj', as class_type('TMS::API::Core::SftInspectionSchedule');
coerce 'SftInspectionScheduleObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'InspectionScheduleId' => undef,
            'InspectionType'       => ' ',
            'VehicleId'            => ' '
        };
        return TMS::Test::Core::SftInspectionSchedule->new(%$TheDefault);
    }
    return TMS::API::Core::SftInspectionSchedule->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'InspectionScheduleId' => undef,
            'InspectionType'       => ' ',
            'VehicleId'            => ' '
        };
        return TMS::Test::Core::SftInspectionSchedule->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinAccountObj', as class_type('TMS::API::Core::FinAccount');
coerce 'FinAccountObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Code'          => ' ',
            'UserDefined'   => ' ',
            'Active'        => ' ',
            'ExternalName'  => ' ',
            'ParentId'      => ' ',
            'AccountTypeId' => ' ',
            'Balance'       => ' ',
            'AccountId'     => undef,
            'Valid'         => ' ',
            'Name'          => ' ',
            'Description'   => ' ',
            'DateCreated'   => ' '
        };
        return TMS::Test::Core::FinAccount->new(%$TheDefault);
    }
    return TMS::API::Core::FinAccount->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Code'          => ' ',
            'UserDefined'   => ' ',
            'Active'        => ' ',
            'ExternalName'  => ' ',
            'ParentId'      => ' ',
            'AccountTypeId' => ' ',
            'Balance'       => ' ',
            'AccountId'     => undef,
            'Valid'         => ' ',
            'Name'          => ' ',
            'Description'   => ' ',
            'DateCreated'   => ' '
        };
        return TMS::Test::Core::FinAccount->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'DspTripObj', as class_type('TMS::API::Core::DspTrip');
coerce 'DspTripObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'IsValid'        => ' ',
            'TripNumber'     => ' ',
            'Notes'          => ' ',
            'GoogleRoute'    => ' ',
            'DateDispatched' => ' ',
            'DateCreated'    => ' ',
            'DateCompleted'  => ' ',
            'CreatedBy'      => ' ',
            'DateStarted'    => ' ',
            'TripId'         => undef,
            'TripStatus'     => ' ',
            'DateBooked'     => ' '
        };
        return TMS::Test::Core::DspTrip->new(%$TheDefault);
    }
    return TMS::API::Core::DspTrip->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'IsValid'        => ' ',
            'TripNumber'     => ' ',
            'Notes'          => ' ',
            'GoogleRoute'    => ' ',
            'DateDispatched' => ' ',
            'DateCreated'    => ' ',
            'DateCompleted'  => ' ',
            'CreatedBy'      => ' ',
            'DateStarted'    => ' ',
            'TripId'         => undef,
            'TripStatus'     => ' ',
            'DateBooked'     => ' '
        };
        return TMS::Test::Core::DspTrip->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'SftLogbookObj', as class_type('TMS::API::Core::SftLogbook');
coerce 'SftLogbookObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DateStarted' => ' ',
            'Notes'       => ' ',
            'Trip'        => ' ',
            'LogbookId'   => undef
        };
        return TMS::Test::Core::SftLogbook->new(%$TheDefault);
    }
    return TMS::API::Core::SftLogbook->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DateStarted' => ' ',
            'Notes'       => ' ',
            'Trip'        => ' ',
            'LogbookId'   => undef
        };
        return TMS::Test::Core::SftLogbook->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'EntBusinessObj', as class_type('TMS::API::Core::EntBusiness');
coerce 'EntBusinessObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'BizURL'   => ' ',
            'BizName'  => ' ',
            'BizId'    => undef,
            'RootNode' => ' '
        };
        return TMS::Test::Core::EntBusiness->new(%$TheDefault);
    }
    return TMS::API::Core::EntBusiness->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'BizURL'   => ' ',
            'BizName'  => ' ',
            'BizId'    => undef,
            'RootNode' => ' '
        };
        return TMS::Test::Core::EntBusiness->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'HrGovidcardObj', as class_type('TMS::API::Core::HrGovidcard');
coerce 'HrGovidcardObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'AstId'           => ' ',
            'CardSate'        => ' ',
            'CardType'        => ' ',
            'CardNumber'      => ' ',
            'CardDateValid'   => ' ',
            'CardDateExpired' => ' ',
            'CardId'          => undef,
            'Photo'           => ' ',
            'AddedBy'         => ' '
        };
        return TMS::Test::Core::HrGovidcard->new(%$TheDefault);
    }
    return TMS::API::Core::HrGovidcard->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'AstId'           => ' ',
            'CardSate'        => ' ',
            'CardType'        => ' ',
            'CardNumber'      => ' ',
            'CardDateValid'   => ' ',
            'CardDateExpired' => ' ',
            'CardId'          => undef,
            'Photo'           => ' ',
            'AddedBy'         => ' '
        };
        return TMS::Test::Core::HrGovidcard->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'CntAddressObj', as class_type('TMS::API::Core::CntAddress');
coerce 'CntAddressObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Zip'     => ' ',
            'Notes'   => ' ',
            'State'   => ' ',
            'City'    => ' ',
            'Street1' => ' ',
            'Street2' => ' ',
            'GpsLng'  => ' ',
            'AddrId'  => undef,
            'Country' => ' ',
            'GpsLat'  => ' ',
            'Street3' => ' '
        };
        return TMS::Test::Core::CntAddress->new(%$TheDefault);
    }
    return TMS::API::Core::CntAddress->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Zip'     => ' ',
            'Notes'   => ' ',
            'State'   => ' ',
            'City'    => ' ',
            'Street1' => ' ',
            'Street2' => ' ',
            'GpsLng'  => ' ',
            'AddrId'  => undef,
            'Country' => ' ',
            'GpsLat'  => ' ',
            'Street3' => ' '
        };
        return TMS::Test::Core::CntAddress->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinJobObj', as class_type('TMS::API::Core::FinJob');
coerce 'FinJobObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'JobAddedBy' => ' ',
            'JobCreated' => ' ',
            'JobId'      => undef,
            'Title'      => ' '
        };
        return TMS::Test::Core::FinJob->new(%$TheDefault);
    }
    return TMS::API::Core::FinJob->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'JobAddedBy' => ' ',
            'JobCreated' => ' ',
            'JobId'      => undef,
            'Title'      => ' '
        };
        return TMS::Test::Core::FinJob->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'InvEquipmentObj', as class_type('TMS::API::Core::InvEquipment');
coerce 'InvEquipmentObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'PriceSold'      => ' ',
            'DateSold'       => ' ',
            'OwnerId'        => ' ',
            'EquipmentId'    => undef,
            'GeneralName'    => ' ',
            'PricePurchased' => ' ',
            'SerialNo'       => ' ',
            'EquipmentType'  => ' ',
            'DatePurchased'  => ' ',
            'VendorId'       => ' '
        };
        return TMS::Test::Core::InvEquipment->new(%$TheDefault);
    }
    return TMS::API::Core::InvEquipment->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'PriceSold'      => ' ',
            'DateSold'       => ' ',
            'OwnerId'        => ' ',
            'EquipmentId'    => undef,
            'GeneralName'    => ' ',
            'PricePurchased' => ' ',
            'SerialNo'       => ' ',
            'EquipmentType'  => ' ',
            'DatePurchased'  => ' ',
            'VendorId'       => ' '
        };
        return TMS::Test::Core::InvEquipment->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinInvoiceObj', as class_type('TMS::API::Core::FinInvoice');
coerce 'FinInvoiceObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DateInvoiced'   => ' ',
            'InvoiceId'      => undef,
            'Notes'          => ' ',
            'EntityId'       => ' ',
            'PaymentTermsId' => ' ',
            'Comments'       => ' ',
            'DateCreated'    => ' ',
            'RefNumber'      => ' ',
            'FactoredParent' => ' ',
            'Status'         => ' ',
            'PONumber'       => ' '
        };
        return TMS::Test::Core::FinInvoice->new(%$TheDefault);
    }
    return TMS::API::Core::FinInvoice->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DateInvoiced'   => ' ',
            'InvoiceId'      => undef,
            'Notes'          => ' ',
            'EntityId'       => ' ',
            'PaymentTermsId' => ' ',
            'Comments'       => ' ',
            'DateCreated'    => ' ',
            'RefNumber'      => ' ',
            'FactoredParent' => ' ',
            'Status'         => ' ',
            'PONumber'       => ' '
        };
        return TMS::Test::Core::FinInvoice->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'BizCompanyNodeObj', as class_type('TMS::API::Core::BizCompanyNode');
coerce 'BizCompanyNodeObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Type'     => ' ',
            'UnitName' => ' ',
            'ParentId' => ' ',
            'NodeId'   => undef
        };
        return TMS::Test::Core::BizCompanyNode->new(%$TheDefault);
    }
    return TMS::API::Core::BizCompanyNode->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Type'     => ' ',
            'UnitName' => ' ',
            'ParentId' => ' ',
            'NodeId'   => undef
        };
        return TMS::Test::Core::BizCompanyNode->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinChequeObj', as class_type('TMS::API::Core::FinCheque');
coerce 'FinChequeObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'TransactionId'      => ' ',
            'DateVoided'         => ' ',
            'Amount'             => ' ',
            'BankAccountNumber'  => ' ',
            'Payer'              => ' ',
            'PayeeName'          => ' ',
            'PayerPhone'         => ' ',
            'Memo'               => ' ',
            'PayerCityAddress'   => ' ',
            'VoidedBy'           => ' ',
            'PayeeStreetAddress' => ' ',
            'DateCreated'        => ' ',
            'Bank'               => ' ',
            'ChequeNumber'       => ' ',
            'BankStreetAddress'  => ' ',
            'BankName'           => ' ',
            'CreatedBy'          => ' ',
            'PayerName'          => ' ',
            'BankPhone'          => ' ',
            'Payee'              => ' ',
            'ChequeId'           => undef,
            'DateAuthorized'     => ' ',
            'BankCityAddress'    => ' ',
            'PayeePhone'         => ' ',
            'BankRoutingNumber'  => ' ',
            'AuthorizedBy'       => ' ',
            'PayeeCityAddress'   => ' ',
            'PayerStreetAddress' => ' '
        };
        return TMS::Test::Core::FinCheque->new(%$TheDefault);
    }
    return TMS::API::Core::FinCheque->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'TransactionId'      => ' ',
            'DateVoided'         => ' ',
            'Amount'             => ' ',
            'BankAccountNumber'  => ' ',
            'Payer'              => ' ',
            'PayeeName'          => ' ',
            'PayerPhone'         => ' ',
            'Memo'               => ' ',
            'PayerCityAddress'   => ' ',
            'VoidedBy'           => ' ',
            'PayeeStreetAddress' => ' ',
            'DateCreated'        => ' ',
            'Bank'               => ' ',
            'ChequeNumber'       => ' ',
            'BankStreetAddress'  => ' ',
            'BankName'           => ' ',
            'CreatedBy'          => ' ',
            'PayerName'          => ' ',
            'BankPhone'          => ' ',
            'Payee'              => ' ',
            'ChequeId'           => undef,
            'DateAuthorized'     => ' ',
            'BankCityAddress'    => ' ',
            'PayeePhone'         => ' ',
            'BankRoutingNumber'  => ' ',
            'AuthorizedBy'       => ' ',
            'PayeeCityAddress'   => ' ',
            'PayerStreetAddress' => ' '
        };
        return TMS::Test::Core::FinCheque->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'EntCustomerObj', as class_type('TMS::API::Core::EntCustomer');
coerce 'EntCustomerObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'CreditLimit'      => ' ',
            'MC'               => ' ',
            'DontUse'          => ' ',
            'DOT'              => ' ',
            'WhyDontUse'       => ' ',
            'CstmrId'          => undef,
            'RequireOriginals' => ' ',
            'Bond'             => ' ',
            'SCAC'             => ' ',
            'DUNS'             => ' ',
            'Terms'            => ' ',
            'Factoring'        => ' '
        };
        return TMS::Test::Core::EntCustomer->new(%$TheDefault);
    }
    return TMS::API::Core::EntCustomer->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'CreditLimit'      => ' ',
            'MC'               => ' ',
            'DontUse'          => ' ',
            'DOT'              => ' ',
            'WhyDontUse'       => ' ',
            'CstmrId'          => undef,
            'RequireOriginals' => ' ',
            'Bond'             => ' ',
            'SCAC'             => ' ',
            'DUNS'             => ' ',
            'Terms'            => ' ',
            'Factoring'        => ' '
        };
        return TMS::Test::Core::EntCustomer->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'EntShipperObj', as class_type('TMS::API::Core::EntShipper');
coerce 'EntShipperObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'ShipperId' => undef,
            'Notes'     => ' '
        };
        return TMS::Test::Core::EntShipper->new(%$TheDefault);
    }
    return TMS::API::Core::EntShipper->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'ShipperId' => undef,
            'Notes'     => ' '
        };
        return TMS::Test::Core::EntShipper->new(%$TheDefault);
    }
    return $_;
};

1;

