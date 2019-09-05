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
subtype 'DrvDriverObj', as class_type('TMS::API::Core::DrvDriver');
coerce 'DrvDriverObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'PullNotice'          => ' ',
            'LastAnnualReview'    => ' ',
            'LocalRoutes'         => ' ',
            'InternationalRoutes' => ' ',
            'DriverId'            => ' '
        };
        return TMS::API::Core::DrvDriver->new(%$TheDefault);
    }
    return TMS::API::Core::DrvDriver->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'PullNotice'          => ' ',
            'LastAnnualReview'    => ' ',
            'LocalRoutes'         => ' ',
            'InternationalRoutes' => ' ',
            'DriverId'            => ' '
        };
        return TMS::API::Core::DrvDriver->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinInvoiceObj', as class_type('TMS::API::Core::FinInvoice');
coerce 'FinInvoiceObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'InvoiceId'      => undef,
            'PaymentTermsId' => ' ',
            'Comments'       => ' ',
            'Status'         => ' ',
            'DateCreated'    => ' ',
            'Notes'          => ' ',
            'EntityId'       => ' ',
            'FactoredParent' => ' ',
            'PONumber'       => ' ',
            'RefNumber'      => ' ',
            'DateInvoiced'   => ' '
        };
        return TMS::API::Core::FinInvoice->new(%$TheDefault);
    }
    return TMS::API::Core::FinInvoice->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'InvoiceId'      => undef,
            'PaymentTermsId' => ' ',
            'Comments'       => ' ',
            'Status'         => ' ',
            'DateCreated'    => ' ',
            'Notes'          => ' ',
            'EntityId'       => ' ',
            'FactoredParent' => ' ',
            'PONumber'       => ' ',
            'RefNumber'      => ' ',
            'DateInvoiced'   => ' '
        };
        return TMS::API::Core::FinInvoice->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'AppRoleObj', as class_type('TMS::API::Core::AppRole');
coerce 'AppRoleObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Description' => ' ',
            'RoleId'      => undef,
            'UserDefined' => ' ',
            'UpdatedBy'   => ' ',
            'Editable'    => ' ',
            'DateUpdated' => ' ',
            'CreatedBy'   => ' ',
            'DateCreated' => ' ',
            'RoleName'    => ' '
        };
        return TMS::API::Core::AppRole->new(%$TheDefault);
    }
    return TMS::API::Core::AppRole->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Description' => ' ',
            'RoleId'      => undef,
            'UserDefined' => ' ',
            'UpdatedBy'   => ' ',
            'Editable'    => ' ',
            'DateUpdated' => ' ',
            'CreatedBy'   => ' ',
            'DateCreated' => ' ',
            'RoleName'    => ' '
        };
        return TMS::API::Core::AppRole->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinPaymentTermObj', as class_type('TMS::API::Core::FinPaymentTerm');
coerce 'FinPaymentTermObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DiscountAmount'  => ' ',
            'Name'            => ' ',
            'DueNext'         => ' ',
            'PaymentTermId'   => undef,
            'DiscountInDays'  => ' ',
            'DiscountPercent' => ' ',
            'Type'            => ' ',
            'DueInDays'       => ' '
        };
        return TMS::API::Core::FinPaymentTerm->new(%$TheDefault);
    }
    return TMS::API::Core::FinPaymentTerm->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DiscountAmount'  => ' ',
            'Name'            => ' ',
            'DueNext'         => ' ',
            'PaymentTermId'   => undef,
            'DiscountInDays'  => ' ',
            'DiscountPercent' => ' ',
            'Type'            => ' ',
            'DueInDays'       => ' '
        };
        return TMS::API::Core::FinPaymentTerm->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'CntPhonesfaxObj', as class_type('TMS::API::Core::CntPhonesfax');
coerce 'CntPhonesfaxObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Mobility'  => ' ',
            'Number'    => ' ',
            'Extension' => ' ',
            'Notes'     => ' ',
            'PhnFaxId'  => undef,
            'Features'  => ' '
        };
        return TMS::API::Core::CntPhonesfax->new(%$TheDefault);
    }
    return TMS::API::Core::CntPhonesfax->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Mobility'  => ' ',
            'Number'    => ' ',
            'Extension' => ' ',
            'Notes'     => ' ',
            'PhnFaxId'  => undef,
            'Features'  => ' '
        };
        return TMS::API::Core::CntPhonesfax->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinAccountTypeObj', as class_type('TMS::API::Core::FinAccountType');
coerce 'FinAccountTypeObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'BalanceSheet'  => ' ',
            'Credit'        => ' ',
            'DisplayOrder'  => ' ',
            'Name'          => ' ',
            'Debit'         => ' ',
            'IncomeSheet'   => ' ',
            'UserDefined'   => ' ',
            'Valid'         => ' ',
            'ParentId'      => ' ',
            'AccountTypeId' => undef,
            'Editable'      => ' ',
            'Temp'          => ' '
        };
        return TMS::API::Core::FinAccountType->new(%$TheDefault);
    }
    return TMS::API::Core::FinAccountType->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'BalanceSheet'  => ' ',
            'Credit'        => ' ',
            'DisplayOrder'  => ' ',
            'Name'          => ' ',
            'Debit'         => ' ',
            'IncomeSheet'   => ' ',
            'UserDefined'   => ' ',
            'Valid'         => ' ',
            'ParentId'      => ' ',
            'AccountTypeId' => undef,
            'Editable'      => ' ',
            'Temp'          => ' '
        };
        return TMS::API::Core::FinAccountType->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'InvVehicleObj', as class_type('TMS::API::Core::InvVehicle');
coerce 'InvVehicleObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Make'          => ' ',
            'Fuel'          => ' ',
            'TireSize'      => ' ',
            'Color'         => ' ',
            'Width'         => ' ',
            'Year'          => ' ',
            'UnladenWeight' => ' ',
            'Height'        => ' ',
            'Axels'         => ' ',
            'StateTag'      => ' ',
            'CarrierId'     => ' ',
            'Length'        => ' ',
            'Model'         => ' ',
            'VehicleId'     => undef,
            'VIN'           => ' '
        };
        return TMS::API::Core::InvVehicle->new(%$TheDefault);
    }
    return TMS::API::Core::InvVehicle->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Make'          => ' ',
            'Fuel'          => ' ',
            'TireSize'      => ' ',
            'Color'         => ' ',
            'Width'         => ' ',
            'Year'          => ' ',
            'UnladenWeight' => ' ',
            'Height'        => ' ',
            'Axels'         => ' ',
            'StateTag'      => ' ',
            'CarrierId'     => ' ',
            'Length'        => ' ',
            'Model'         => ' ',
            'VehicleId'     => undef,
            'VIN'           => ' '
        };
        return TMS::API::Core::InvVehicle->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'InvEquipmentObj', as class_type('TMS::API::Core::InvEquipment');
coerce 'InvEquipmentObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'SerialNo'       => ' ',
            'PricePurchased' => ' ',
            'PriceSold'      => ' ',
            'GeneralName'    => ' ',
            'VendorId'       => ' ',
            'DateSold'       => ' ',
            'EquipmentId'    => undef,
            'DatePurchased'  => ' ',
            'OwnerId'        => ' '
        };
        return TMS::API::Core::InvEquipment->new(%$TheDefault);
    }
    return TMS::API::Core::InvEquipment->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'SerialNo'       => ' ',
            'PricePurchased' => ' ',
            'PriceSold'      => ' ',
            'GeneralName'    => ' ',
            'VendorId'       => ' ',
            'DateSold'       => ' ',
            'EquipmentId'    => undef,
            'DatePurchased'  => ' ',
            'OwnerId'        => ' '
        };
        return TMS::API::Core::InvEquipment->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinBillingTagObj', as class_type('TMS::API::Core::FinBillingTag');
coerce 'FinBillingTagObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'CreatedBy'    => ' ',
            'DateCreated'  => ' ',
            'BillingTagId' => undef,
            'UserDefined'  => ' ',
            'BillingTag'   => ' '
        };
        return TMS::API::Core::FinBillingTag->new(%$TheDefault);
    }
    return TMS::API::Core::FinBillingTag->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'CreatedBy'    => ' ',
            'DateCreated'  => ' ',
            'BillingTagId' => undef,
            'UserDefined'  => ' ',
            'BillingTag'   => ' '
        };
        return TMS::API::Core::FinBillingTag->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinJournalEntryObj', as class_type('TMS::API::Core::FinJournalEntry');
coerce 'FinJournalEntryObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'VendorAmount'   => ' ',
            'AccountId'      => ' ',
            'Classification' => ' ',
            'TransactionId'  => ' ',
            'DateCreated'    => ' ',
            'CreatedBy'      => ' ',
            'JrlEntryId'     => undef,
            'Amount'         => ' ',
            'DebitCredit'    => ' ',
            'JobId'          => ' ',
            'EntityId'       => ' ',
            'ReportAmount'   => ' '
        };
        return TMS::API::Core::FinJournalEntry->new(%$TheDefault);
    }
    return TMS::API::Core::FinJournalEntry->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'VendorAmount'   => ' ',
            'AccountId'      => ' ',
            'Classification' => ' ',
            'TransactionId'  => ' ',
            'DateCreated'    => ' ',
            'CreatedBy'      => ' ',
            'JrlEntryId'     => undef,
            'Amount'         => ' ',
            'DebitCredit'    => ' ',
            'JobId'          => ' ',
            'EntityId'       => ' ',
            'ReportAmount'   => ' '
        };
        return TMS::API::Core::FinJournalEntry->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'CmmPackageObj', as class_type('TMS::API::Core::CmmPackage');
coerce 'CmmPackageObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {'Name' => undef};
        return TMS::API::Core::CmmPackage->new(%$TheDefault);
    }
    return TMS::API::Core::CmmPackage->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {'Name' => undef};
        return TMS::API::Core::CmmPackage->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinInvoicePaymentObj', as class_type('TMS::API::Core::FinInvoicePayment');
coerce 'FinInvoicePaymentObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DatePayment'      => ' ',
            'Amount'           => ' ',
            'InvoicePaymentId' => undef,
            'InvoiceId'        => ' ',
            'PaymentMethodId'  => ' ',
            'Valid'            => ' ',
            'TransactionId'    => ' ',
            'DateCreated'      => ' ',
            'CreatedBy'        => ' ',
            'PayerId'          => ' '
        };
        return TMS::API::Core::FinInvoicePayment->new(%$TheDefault);
    }
    return TMS::API::Core::FinInvoicePayment->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DatePayment'      => ' ',
            'Amount'           => ' ',
            'InvoicePaymentId' => undef,
            'InvoiceId'        => ' ',
            'PaymentMethodId'  => ' ',
            'Valid'            => ' ',
            'TransactionId'    => ' ',
            'DateCreated'      => ' ',
            'CreatedBy'        => ' ',
            'PayerId'          => ' '
        };
        return TMS::API::Core::FinInvoicePayment->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'AppAccountObj', as class_type('TMS::API::Core::AppAccount');
coerce 'AppAccountObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DateCreated'  => ' ',
            'UserId'       => ' ',
            'Username'     => ' ',
            'PasswordHash' => ' ',
            'Salt'         => ' ',
            'Locked'       => ' ',
            'AppAccountId' => undef
        };
        return TMS::API::Core::AppAccount->new(%$TheDefault);
    }
    return TMS::API::Core::AppAccount->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DateCreated'  => ' ',
            'UserId'       => ' ',
            'Username'     => ' ',
            'PasswordHash' => ' ',
            'Salt'         => ' ',
            'Locked'       => ' ',
            'AppAccountId' => undef
        };
        return TMS::API::Core::AppAccount->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinItemTemplatesTypeObj', as class_type('TMS::API::Core::FinItemTemplatesType');
coerce 'FinItemTemplatesTypeObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'UserDefined'    => ' ',
            'DisplayToUser'  => ' ',
            'Description'    => ' ',
            'TemplateTypeId' => undef,
            'Name'           => ' '
        };
        return TMS::API::Core::FinItemTemplatesType->new(%$TheDefault);
    }
    return TMS::API::Core::FinItemTemplatesType->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'UserDefined'    => ' ',
            'DisplayToUser'  => ' ',
            'Description'    => ' ',
            'TemplateTypeId' => undef,
            'Name'           => ' '
        };
        return TMS::API::Core::FinItemTemplatesType->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'TskActnObj', as class_type('TMS::API::Core::TskActn');
coerce 'TskActnObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'note'   => ' ',
            'tskid'  => ' ',
            'actid'  => undef,
            'PrsnId' => ' '
        };
        return TMS::API::Core::TskActn->new(%$TheDefault);
    }
    return TMS::API::Core::TskActn->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'note'   => ' ',
            'tskid'  => ' ',
            'actid'  => undef,
            'PrsnId' => ' '
        };
        return TMS::API::Core::TskActn->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'BizCompanyNodeObj', as class_type('TMS::API::Core::BizCompanyNode');
coerce 'BizCompanyNodeObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'ParentId' => ' ',
            'Type'     => ' ',
            'UnitName' => ' ',
            'NodeId'   => undef
        };
        return TMS::API::Core::BizCompanyNode->new(%$TheDefault);
    }
    return TMS::API::Core::BizCompanyNode->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'ParentId' => ' ',
            'Type'     => ' ',
            'UnitName' => ' ',
            'NodeId'   => undef
        };
        return TMS::API::Core::BizCompanyNode->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'HrGovidcardObj', as class_type('TMS::API::Core::HrGovidcard');
coerce 'HrGovidcardObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Photo'           => ' ',
            'CardType'        => ' ',
            'CardSate'        => ' ',
            'CardNumber'      => ' ',
            'AstId'           => ' ',
            'CardDateExpired' => ' ',
            'AddedBy'         => ' ',
            'CardDateValid'   => ' ',
            'CardId'          => undef
        };
        return TMS::API::Core::HrGovidcard->new(%$TheDefault);
    }
    return TMS::API::Core::HrGovidcard->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Photo'           => ' ',
            'CardType'        => ' ',
            'CardSate'        => ' ',
            'CardNumber'      => ' ',
            'AstId'           => ' ',
            'CardDateExpired' => ' ',
            'AddedBy'         => ' ',
            'CardDateValid'   => ' ',
            'CardId'          => undef
        };
        return TMS::API::Core::HrGovidcard->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'BizBranchObj', as class_type('TMS::API::Core::BizBranch');
coerce 'BizBranchObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'OfficeName'   => ' ',
            'BizId'        => ' ',
            'BrnchEMail'   => ' ',
            'BrnchFax'     => ' ',
            'BrnchAddress' => ' ',
            'BrnchId'      => undef,
            'BrnchPhone'   => ' '
        };
        return TMS::API::Core::BizBranch->new(%$TheDefault);
    }
    return TMS::API::Core::BizBranch->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'OfficeName'   => ' ',
            'BizId'        => ' ',
            'BrnchEMail'   => ' ',
            'BrnchFax'     => ' ',
            'BrnchAddress' => ' ',
            'BrnchId'      => undef,
            'BrnchPhone'   => ' '
        };
        return TMS::API::Core::BizBranch->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'AppMenuItemObj', as class_type('TMS::API::Core::AppMenuItem');
coerce 'AppMenuItemObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Enabled'    => ' ',
            'MenuItemId' => undef,
            'Help'       => ' ',
            'Label'      => ' ',
            'Title'      => ' ',
            'Icon'       => ' ',
            'Route'      => ' ',
            'SortIndex'  => ' ',
            'ParentId'   => ' '
        };
        return TMS::API::Core::AppMenuItem->new(%$TheDefault);
    }
    return TMS::API::Core::AppMenuItem->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Enabled'    => ' ',
            'MenuItemId' => undef,
            'Help'       => ' ',
            'Label'      => ' ',
            'Title'      => ' ',
            'Icon'       => ' ',
            'Route'      => ' ',
            'SortIndex'  => ' ',
            'ParentId'   => ' '
        };
        return TMS::API::Core::AppMenuItem->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'EntCarrierObj', as class_type('TMS::API::Core::EntCarrier');
coerce 'EntCarrierObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'IFTA_Acc'           => ' ',
            'state_KY'           => ' ',
            'CrType'             => ' ',
            'DOT'                => ' ',
            'CarrierId'          => undef,
            'state_NC'           => ' ',
            'state_NY'           => ' ',
            'SCAC'               => ' ',
            'state_NM'           => ' ',
            'MC'                 => ' ',
            'state_FL'           => ' ',
            'IFTA_State'         => ' ',
            'McCertificatePhoto' => ' ',
            'state_SC'           => ' ',
            'state_OR'           => ' '
        };
        return TMS::API::Core::EntCarrier->new(%$TheDefault);
    }
    return TMS::API::Core::EntCarrier->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'IFTA_Acc'           => ' ',
            'state_KY'           => ' ',
            'CrType'             => ' ',
            'DOT'                => ' ',
            'CarrierId'          => undef,
            'state_NC'           => ' ',
            'state_NY'           => ' ',
            'SCAC'               => ' ',
            'state_NM'           => ' ',
            'MC'                 => ' ',
            'state_FL'           => ' ',
            'IFTA_State'         => ' ',
            'McCertificatePhoto' => ' ',
            'state_SC'           => ' ',
            'state_OR'           => ' '
        };
        return TMS::API::Core::EntCarrier->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'InvRoleObj', as class_type('TMS::API::Core::InvRole');
coerce 'InvRoleObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'RoleName'  => ' ',
            'InvRoleId' => undef,
            'Notes'     => ' '
        };
        return TMS::API::Core::InvRole->new(%$TheDefault);
    }
    return TMS::API::Core::InvRole->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'RoleName'  => ' ',
            'InvRoleId' => undef,
            'Notes'     => ' '
        };
        return TMS::API::Core::InvRole->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'EntityObj', as class_type('TMS::API::Core::Entity');
coerce 'EntityObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DateCreated' => ' ',
            'IsActive'    => ' ',
            'EntityId'    => undef,
            'PersonId'    => ' ',
            'Notes'       => ' ',
            'BusinessId'  => ' '
        };
        return TMS::API::Core::Entity->new(%$TheDefault);
    }
    return TMS::API::Core::Entity->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DateCreated' => ' ',
            'IsActive'    => ' ',
            'EntityId'    => undef,
            'PersonId'    => ' ',
            'Notes'       => ' ',
            'BusinessId'  => ' '
        };
        return TMS::API::Core::Entity->new(%$TheDefault);
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
        return TMS::API::Core::FinJob->new(%$TheDefault);
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
        return TMS::API::Core::FinJob->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'InvSupportVendorObj', as class_type('TMS::API::Core::InvSupportVendor');
coerce 'InvSupportVendorObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Name'           => ' ',
            'SupportId'      => undef,
            'VendorId'       => ' ',
            'Description'    => ' ',
            'PrimaryContact' => ' '
        };
        return TMS::API::Core::InvSupportVendor->new(%$TheDefault);
    }
    return TMS::API::Core::InvSupportVendor->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Name'           => ' ',
            'SupportId'      => undef,
            'VendorId'       => ' ',
            'Description'    => ' ',
            'PrimaryContact' => ' '
        };
        return TMS::API::Core::InvSupportVendor->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'GenFileObj', as class_type('TMS::API::Core::GenFile');
coerce 'GenFileObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'UploadDate'    => ' ',
            'FileData'      => ' ',
            'ExpiredDate'   => ' ',
            'DocumentTitle' => ' ',
            'Notes'         => ' ',
            'MIMEType'      => ' ',
            'Keywords'      => ' ',
            'SHASIG'        => ' ',
            'FileId'        => undef,
            'FileName'      => ' '
        };
        return TMS::API::Core::GenFile->new(%$TheDefault);
    }
    return TMS::API::Core::GenFile->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'UploadDate'    => ' ',
            'FileData'      => ' ',
            'ExpiredDate'   => ' ',
            'DocumentTitle' => ' ',
            'Notes'         => ' ',
            'MIMEType'      => ' ',
            'Keywords'      => ' ',
            'SHASIG'        => ' ',
            'FileId'        => undef,
            'FileName'      => ' '
        };
        return TMS::API::Core::GenFile->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'SftVehicleInspectedItemObj', as class_type('TMS::API::Core::SftVehicleInspectedItem');
coerce 'SftVehicleInspectedItemObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'InspectedId'   => undef,
            'InspectedDate' => ' ',
            'Status'        => ' ',
            'InspectedItem' => ' ',
            'InspectionId'  => ' '
        };
        return TMS::API::Core::SftVehicleInspectedItem->new(%$TheDefault);
    }
    return TMS::API::Core::SftVehicleInspectedItem->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'InspectedId'   => undef,
            'InspectedDate' => ' ',
            'Status'        => ' ',
            'InspectedItem' => ' ',
            'InspectionId'  => ' '
        };
        return TMS::API::Core::SftVehicleInspectedItem->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'InsPolicyObj', as class_type('TMS::API::Core::InsPolicy');
coerce 'InsPolicyObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'PolicyNumber'      => ' ',
            'WhatIsInsured'     => ' ',
            'ProviderAgent'     => ' ',
            'ExpirationDate'    => ' ',
            'InsId'             => undef,
            'TagName'           => ' ',
            'PaidBy'            => ' ',
            'ProofOfInsurance'  => ' ',
            'EffectiveDate'     => ' ',
            'DownpaymentAmount' => ' ',
            'InsuredAmount'     => ' '
        };
        return TMS::API::Core::InsPolicy->new(%$TheDefault);
    }
    return TMS::API::Core::InsPolicy->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'PolicyNumber'      => ' ',
            'WhatIsInsured'     => ' ',
            'ProviderAgent'     => ' ',
            'ExpirationDate'    => ' ',
            'InsId'             => undef,
            'TagName'           => ' ',
            'PaidBy'            => ' ',
            'ProofOfInsurance'  => ' ',
            'EffectiveDate'     => ' ',
            'DownpaymentAmount' => ' ',
            'InsuredAmount'     => ' '
        };
        return TMS::API::Core::InsPolicy->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinItemTemplateObj', as class_type('TMS::API::Core::FinItemTemplate');
coerce 'FinItemTemplateObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DateDeleted'     => ' ',
            'CreditAccountId' => ' ',
            'TemplateTypeId'  => ' ',
            'TransactionType' => ' ',
            'Description'     => ' ',
            'CreatedBy'       => ' ',
            'DateCreated'     => ' ',
            'DebitAccountId'  => ' ',
            'DeletedBy'       => ' ',
            'Price'           => ' ',
            'Name'            => ' ',
            'EntityId'        => ' ',
            'UserDefined'     => ' ',
            'UpdatedBy'       => ' ',
            'ParentId'        => ' ',
            'PriceType'       => ' ',
            'DateUpdated'     => ' ',
            'Deleted'         => ' ',
            'ItemTemplateId'  => undef
        };
        return TMS::API::Core::FinItemTemplate->new(%$TheDefault);
    }
    return TMS::API::Core::FinItemTemplate->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DateDeleted'     => ' ',
            'CreditAccountId' => ' ',
            'TemplateTypeId'  => ' ',
            'TransactionType' => ' ',
            'Description'     => ' ',
            'CreatedBy'       => ' ',
            'DateCreated'     => ' ',
            'DebitAccountId'  => ' ',
            'DeletedBy'       => ' ',
            'Price'           => ' ',
            'Name'            => ' ',
            'EntityId'        => ' ',
            'UserDefined'     => ' ',
            'UpdatedBy'       => ' ',
            'ParentId'        => ' ',
            'PriceType'       => ' ',
            'DateUpdated'     => ' ',
            'Deleted'         => ' ',
            'ItemTemplateId'  => undef
        };
        return TMS::API::Core::FinItemTemplate->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinTransactionObj', as class_type('TMS::API::Core::FinTransaction');
coerce 'FinTransactionObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'RefNumber'       => ' ',
            'TransactionType' => ' ',
            'JobId'           => ' ',
            'Memo'            => ' ',
            'DateTransaction' => ' ',
            'Class'           => ' ',
            'TransactionId'   => undef,
            'DateCreated'     => ' ',
            'CreatedBy'       => ' ',
            'Status'          => ' '
        };
        return TMS::API::Core::FinTransaction->new(%$TheDefault);
    }
    return TMS::API::Core::FinTransaction->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'RefNumber'       => ' ',
            'TransactionType' => ' ',
            'JobId'           => ' ',
            'Memo'            => ' ',
            'DateTransaction' => ' ',
            'Class'           => ' ',
            'TransactionId'   => undef,
            'DateCreated'     => ' ',
            'CreatedBy'       => ' ',
            'Status'          => ' '
        };
        return TMS::API::Core::FinTransaction->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinClassObj', as class_type('TMS::API::Core::FinClass');
coerce 'FinClassObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'ClassId' => undef,
            'Name'    => ' '
        };
        return TMS::API::Core::FinClass->new(%$TheDefault);
    }
    return TMS::API::Core::FinClass->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'ClassId' => undef,
            'Name'    => ' '
        };
        return TMS::API::Core::FinClass->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'SftInspectionScheduleObj', as class_type('TMS::API::Core::SftInspectionSchedule');
coerce 'SftInspectionScheduleObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'VehicleId'            => ' ',
            'InspectionType'       => ' ',
            'InspectionScheduleId' => undef
        };
        return TMS::API::Core::SftInspectionSchedule->new(%$TheDefault);
    }
    return TMS::API::Core::SftInspectionSchedule->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'VehicleId'            => ' ',
            'InspectionType'       => ' ',
            'InspectionScheduleId' => undef
        };
        return TMS::API::Core::SftInspectionSchedule->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'SftElogStatObj', as class_type('TMS::API::Core::SftElogStat');
coerce 'SftElogStatObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Posted'             => ' ',
            'VehicleState'       => ' ',
            'Latitude'           => ' ',
            'Longitude'          => ' ',
            'Speed'              => ' ',
            'Fuel'               => ' ',
            'EquipmentId'        => ' ',
            'Acquired'           => ' ',
            'EngineHours'        => ' ',
            'GpsReqId'           => undef,
            'LocationProviderId' => ' ',
            'Bearings'           => ' ',
            'Odometer'           => ' '
        };
        return TMS::API::Core::SftElogStat->new(%$TheDefault);
    }
    return TMS::API::Core::SftElogStat->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Posted'             => ' ',
            'VehicleState'       => ' ',
            'Latitude'           => ' ',
            'Longitude'          => ' ',
            'Speed'              => ' ',
            'Fuel'               => ' ',
            'EquipmentId'        => ' ',
            'Acquired'           => ' ',
            'EngineHours'        => ' ',
            'GpsReqId'           => undef,
            'LocationProviderId' => ' ',
            'Bearings'           => ' ',
            'Odometer'           => ' '
        };
        return TMS::API::Core::SftElogStat->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'DspLoadsDestinationObj', as class_type('TMS::API::Core::DspLoadsDestination');
coerce 'DspLoadsDestinationObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DestinationId'    => undef,
            'StopType'         => ' ',
            'AppointmentNotes' => ' ',
            'PU_PO'            => ' ',
            'Branch'           => ' ',
            'AppointmentType'  => ' ',
            'LoadId'           => ' ',
            'AppointmentEnd'   => ' ',
            'Commodity'        => ' ',
            'Pallets'          => ' ',
            'StopOrder'        => ' ',
            'AppointmentStart' => ' ',
            'Pieces'           => ' ',
            'Weight'           => ' '
        };
        return TMS::API::Core::DspLoadsDestination->new(%$TheDefault);
    }
    return TMS::API::Core::DspLoadsDestination->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DestinationId'    => undef,
            'StopType'         => ' ',
            'AppointmentNotes' => ' ',
            'PU_PO'            => ' ',
            'Branch'           => ' ',
            'AppointmentType'  => ' ',
            'LoadId'           => ' ',
            'AppointmentEnd'   => ' ',
            'Commodity'        => ' ',
            'Pallets'          => ' ',
            'StopOrder'        => ' ',
            'AppointmentStart' => ' ',
            'Pieces'           => ' ',
            'Weight'           => ' '
        };
        return TMS::API::Core::DspLoadsDestination->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'EntPersonObj', as class_type('TMS::API::Core::EntPerson');
coerce 'EntPersonObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'MiddleName' => ' ',
            'LastName'   => ' ',
            'Suffix'     => ' ',
            'NickName'   => ' ',
            'PrsnId'     => undef,
            'BrnchId'    => ' ',
            'FirstName'  => ' ',
            'Prefix'     => ' '
        };
        return TMS::API::Core::EntPerson->new(%$TheDefault);
    }
    return TMS::API::Core::EntPerson->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'MiddleName' => ' ',
            'LastName'   => ' ',
            'Suffix'     => ' ',
            'NickName'   => ' ',
            'PrsnId'     => undef,
            'BrnchId'    => ' ',
            'FirstName'  => ' ',
            'Prefix'     => ' '
        };
        return TMS::API::Core::EntPerson->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'EntCustomerObj', as class_type('TMS::API::Core::EntCustomer');
coerce 'EntCustomerObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DontUse'          => ' ',
            'CstmrId'          => undef,
            'Factoring'        => ' ',
            'Terms'            => ' ',
            'MC'               => ' ',
            'CreditLimit'      => ' ',
            'SCAC'             => ' ',
            'DOT'              => ' ',
            'WhyDontUse'       => ' ',
            'DUNS'             => ' ',
            'Bond'             => ' ',
            'RequireOriginals' => ' '
        };
        return TMS::API::Core::EntCustomer->new(%$TheDefault);
    }
    return TMS::API::Core::EntCustomer->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DontUse'          => ' ',
            'CstmrId'          => undef,
            'Factoring'        => ' ',
            'Terms'            => ' ',
            'MC'               => ' ',
            'CreditLimit'      => ' ',
            'SCAC'             => ' ',
            'DOT'              => ' ',
            'WhyDontUse'       => ' ',
            'DUNS'             => ' ',
            'Bond'             => ' ',
            'RequireOriginals' => ' '
        };
        return TMS::API::Core::EntCustomer->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'DspTripObj', as class_type('TMS::API::Core::DspTrip');
coerce 'DspTripObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'TripId'         => undef,
            'DateCreated'    => ' ',
            'DateCompleted'  => ' ',
            'CreatedBy'      => ' ',
            'DateStarted'    => ' ',
            'TripNumber'     => ' ',
            'IsValid'        => ' ',
            'TripStatus'     => ' ',
            'DateDispatched' => ' ',
            'DateBooked'     => ' ',
            'Notes'          => ' '
        };
        return TMS::API::Core::DspTrip->new(%$TheDefault);
    }
    return TMS::API::Core::DspTrip->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'TripId'         => undef,
            'DateCreated'    => ' ',
            'DateCompleted'  => ' ',
            'CreatedBy'      => ' ',
            'DateStarted'    => ' ',
            'TripNumber'     => ' ',
            'IsValid'        => ' ',
            'TripStatus'     => ' ',
            'DateDispatched' => ' ',
            'DateBooked'     => ' ',
            'Notes'          => ' '
        };
        return TMS::API::Core::DspTrip->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinAccountObj', as class_type('TMS::API::Core::FinAccount');
coerce 'FinAccountObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'UserDefined'   => ' ',
            'AccountId'     => undef,
            'Valid'         => ' ',
            'Description'   => ' ',
            'ParentId'      => ' ',
            'ExternalName'  => ' ',
            'DateCreated'   => ' ',
            'AccountTypeId' => ' ',
            'Balance'       => ' ',
            'Active'        => ' ',
            'Code'          => ' ',
            'Name'          => ' '
        };
        return TMS::API::Core::FinAccount->new(%$TheDefault);
    }
    return TMS::API::Core::FinAccount->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'UserDefined'   => ' ',
            'AccountId'     => undef,
            'Valid'         => ' ',
            'Description'   => ' ',
            'ParentId'      => ' ',
            'ExternalName'  => ' ',
            'DateCreated'   => ' ',
            'AccountTypeId' => ' ',
            'Balance'       => ' ',
            'Active'        => ' ',
            'Code'          => ' ',
            'Name'          => ' '
        };
        return TMS::API::Core::FinAccount->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'InvTrailerTypeObj', as class_type('TMS::API::Core::InvTrailerType');
coerce 'InvTrailerTypeObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {'Name' => undef};
        return TMS::API::Core::InvTrailerType->new(%$TheDefault);
    }
    return TMS::API::Core::InvTrailerType->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {'Name' => undef};
        return TMS::API::Core::InvTrailerType->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'EntShipperObj', as class_type('TMS::API::Core::EntShipper');
coerce 'EntShipperObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Notes'     => ' ',
            'ShipperId' => undef
        };
        return TMS::API::Core::EntShipper->new(%$TheDefault);
    }
    return TMS::API::Core::EntShipper->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Notes'     => ' ',
            'ShipperId' => undef
        };
        return TMS::API::Core::EntShipper->new(%$TheDefault);
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
        return TMS::API::Core::FinTransactionType->new(%$TheDefault);
    }
    return TMS::API::Core::FinTransactionType->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'TransTypeId'   => undef,
            'TransTypeName' => ' '
        };
        return TMS::API::Core::FinTransactionType->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'DspLoadObj', as class_type('TMS::API::Core::DspLoad');
coerce 'DspLoadObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'TruckType'      => ' ',
            'ReeferTempLow'  => ' ',
            'ProNumber'      => ' ',
            'DateCreated'    => ' ',
            'CreatedBy'      => ' ',
            'DateBooked'     => ' ',
            'ShipperId'      => ' ',
            'BookedBy'       => ' ',
            'ReeferTempHigh' => ' ',
            'BrokerId'       => ' ',
            'TempMode'       => ' ',
            'Job'            => ' ',
            'DispatchNote'   => ' ',
            'LoadId'         => undef,
            'TeamRequired'   => ' ',
            'LoadNumber'     => ' ',
            'LoadType'       => ' ',
            'Precooling'     => ' '
        };
        return TMS::API::Core::DspLoad->new(%$TheDefault);
    }
    return TMS::API::Core::DspLoad->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'TruckType'      => ' ',
            'ReeferTempLow'  => ' ',
            'ProNumber'      => ' ',
            'DateCreated'    => ' ',
            'CreatedBy'      => ' ',
            'DateBooked'     => ' ',
            'ShipperId'      => ' ',
            'BookedBy'       => ' ',
            'ReeferTempHigh' => ' ',
            'BrokerId'       => ' ',
            'TempMode'       => ' ',
            'Job'            => ' ',
            'DispatchNote'   => ' ',
            'LoadId'         => undef,
            'TeamRequired'   => ' ',
            'LoadNumber'     => ' ',
            'LoadType'       => ' ',
            'Precooling'     => ' '
        };
        return TMS::API::Core::DspLoad->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinChequeObj', as class_type('TMS::API::Core::FinCheque');
coerce 'FinChequeObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'BankRoutingNumber'  => ' ',
            'BankName'           => ' ',
            'DateCreated'        => ' ',
            'CreatedBy'          => ' ',
            'BankPhone'          => ' ',
            'Amount'             => ' ',
            'VoidedBy'           => ' ',
            'AuthorizedBy'       => ' ',
            'Memo'               => ' ',
            'BankStreetAddress'  => ' ',
            'PayeeName'          => ' ',
            'PayerName'          => ' ',
            'DateVoided'         => ' ',
            'Bank'               => ' ',
            'PayerPhone'         => ' ',
            'ChequeNumber'       => ' ',
            'PayeeCityAddress'   => ' ',
            'TransactionId'      => ' ',
            'Payer'              => ' ',
            'BankAccountNumber'  => ' ',
            'PayerStreetAddress' => ' ',
            'ChequeId'           => undef,
            'PayerCityAddress'   => ' ',
            'Payee'              => ' ',
            'BankCityAddress'    => ' ',
            'DateAuthorized'     => ' ',
            'PayeeStreetAddress' => ' ',
            'PayeePhone'         => ' '
        };
        return TMS::API::Core::FinCheque->new(%$TheDefault);
    }
    return TMS::API::Core::FinCheque->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'BankRoutingNumber'  => ' ',
            'BankName'           => ' ',
            'DateCreated'        => ' ',
            'CreatedBy'          => ' ',
            'BankPhone'          => ' ',
            'Amount'             => ' ',
            'VoidedBy'           => ' ',
            'AuthorizedBy'       => ' ',
            'Memo'               => ' ',
            'BankStreetAddress'  => ' ',
            'PayeeName'          => ' ',
            'PayerName'          => ' ',
            'DateVoided'         => ' ',
            'Bank'               => ' ',
            'PayerPhone'         => ' ',
            'ChequeNumber'       => ' ',
            'PayeeCityAddress'   => ' ',
            'TransactionId'      => ' ',
            'Payer'              => ' ',
            'BankAccountNumber'  => ' ',
            'PayerStreetAddress' => ' ',
            'ChequeId'           => undef,
            'PayerCityAddress'   => ' ',
            'Payee'              => ' ',
            'BankCityAddress'    => ' ',
            'DateAuthorized'     => ' ',
            'PayeeStreetAddress' => ' ',
            'PayeePhone'         => ' '
        };
        return TMS::API::Core::FinCheque->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'SftLogbookObj', as class_type('TMS::API::Core::SftLogbook');
coerce 'SftLogbookObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Trip'        => ' ',
            'LogbookId'   => undef,
            'DateStarted' => ' ',
            'Notes'       => ' '
        };
        return TMS::API::Core::SftLogbook->new(%$TheDefault);
    }
    return TMS::API::Core::SftLogbook->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Trip'        => ' ',
            'LogbookId'   => undef,
            'DateStarted' => ' ',
            'Notes'       => ' '
        };
        return TMS::API::Core::SftLogbook->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'EntBusinessObj', as class_type('TMS::API::Core::EntBusiness');
coerce 'EntBusinessObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'RootNode' => ' ',
            'BizId'    => undef,
            'BizName'  => ' ',
            'BizURL'   => ' '
        };
        return TMS::API::Core::EntBusiness->new(%$TheDefault);
    }
    return TMS::API::Core::EntBusiness->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'RootNode' => ' ',
            'BizId'    => undef,
            'BizName'  => ' ',
            'BizURL'   => ' '
        };
        return TMS::API::Core::EntBusiness->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'AppFeatureObj', as class_type('TMS::API::Core::AppFeature');
coerce 'AppFeatureObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'AppFeatureId' => undef,
            'Notes'        => ' ',
            'Name'         => ' '
        };
        return TMS::API::Core::AppFeature->new(%$TheDefault);
    }
    return TMS::API::Core::AppFeature->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'AppFeatureId' => undef,
            'Notes'        => ' ',
            'Name'         => ' '
        };
        return TMS::API::Core::AppFeature->new(%$TheDefault);
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
        return TMS::API::Core::DrvCdlEndorsement->new(%$TheDefault);
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
        return TMS::API::Core::DrvCdlEndorsement->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinInvoicesItemObj', as class_type('TMS::API::Core::FinInvoicesItem');
coerce 'FinInvoicesItemObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Amount'               => ' ',
            'Notes'                => ' ',
            'CreditJournalEntryId' => ' ',
            'DebitJournalEntryId'  => ' ',
            'JobId'                => ' ',
            'Quantity'             => ' ',
            'InvoiceItemId'        => undef,
            'Comments'             => ' ',
            'InvoiceId'            => ' ',
            'ItemTemplateId'       => ' ',
            'CreatedBy'            => ' ',
            'DateCreated'          => ' '
        };
        return TMS::API::Core::FinInvoicesItem->new(%$TheDefault);
    }
    return TMS::API::Core::FinInvoicesItem->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Amount'               => ' ',
            'Notes'                => ' ',
            'CreditJournalEntryId' => ' ',
            'DebitJournalEntryId'  => ' ',
            'JobId'                => ' ',
            'Quantity'             => ' ',
            'InvoiceItemId'        => undef,
            'Comments'             => ' ',
            'InvoiceId'            => ' ',
            'ItemTemplateId'       => ' ',
            'CreatedBy'            => ' ',
            'DateCreated'          => ' '
        };
        return TMS::API::Core::FinInvoicesItem->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'DrvDesttypeObj', as class_type('TMS::API::Core::DrvDesttype');
coerce 'DrvDesttypeObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DestName'      => ' ',
            'Notes'         => ' ',
            'DesiredDestId' => undef
        };
        return TMS::API::Core::DrvDesttype->new(%$TheDefault);
    }
    return TMS::API::Core::DrvDesttype->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DestName'      => ' ',
            'Notes'         => ' ',
            'DesiredDestId' => undef
        };
        return TMS::API::Core::DrvDesttype->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'HrAssociateObj', as class_type('TMS::API::Core::HrAssociate');
coerce 'HrAssociateObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DateRemoved'  => ' ',
            'BizEmail'     => ' ',
            'DateCreated'  => ' ',
            'BizPhone'     => ' ',
            'CurrentTitle' => ' ',
            'NodeId'       => ' ',
            'BizFax'       => ' ',
            'AstId'        => undef,
            'Notes'        => ' '
        };
        return TMS::API::Core::HrAssociate->new(%$TheDefault);
    }
    return TMS::API::Core::HrAssociate->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DateRemoved'  => ' ',
            'BizEmail'     => ' ',
            'DateCreated'  => ' ',
            'BizPhone'     => ' ',
            'CurrentTitle' => ' ',
            'NodeId'       => ' ',
            'BizFax'       => ' ',
            'AstId'        => undef,
            'Notes'        => ' '
        };
        return TMS::API::Core::HrAssociate->new(%$TheDefault);
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
        return TMS::API::Core::InvUnit->new(%$TheDefault);
    }
    return TMS::API::Core::InvUnit->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'UnitTag' => ' ',
            'UnitId'  => undef
        };
        return TMS::API::Core::InvUnit->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'CntAddressObj', as class_type('TMS::API::Core::CntAddress');
coerce 'CntAddressObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Country' => ' ',
            'Street3' => ' ',
            'City'    => ' ',
            'GpsLng'  => ' ',
            'AddrId'  => undef,
            'Street1' => ' ',
            'State'   => ' ',
            'GpsLat'  => ' ',
            'Zip'     => ' ',
            'Notes'   => ' ',
            'Street2' => ' '
        };
        return TMS::API::Core::CntAddress->new(%$TheDefault);
    }
    return TMS::API::Core::CntAddress->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Country' => ' ',
            'Street3' => ' ',
            'City'    => ' ',
            'GpsLng'  => ' ',
            'AddrId'  => undef,
            'Street1' => ' ',
            'State'   => ' ',
            'GpsLat'  => ' ',
            'Zip'     => ' ',
            'Notes'   => ' ',
            'Street2' => ' '
        };
        return TMS::API::Core::CntAddress->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'SftVehicleInspectionObj', as class_type('TMS::API::Core::SftVehicleInspection');
coerce 'SftVehicleInspectionObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DateInspection'       => ' ',
            'InspectionScheduleId' => ' ',
            'InspectionNumber'     => ' ',
            'LocationOfRecords'    => ' ',
            'InspectionId'         => undef,
            'Mileage'              => ' ',
            'InspectorId'          => ' ',
            'Remarks'              => ' ',
            'Status'               => ' ',
            'InspectorSignatureId' => ' '
        };
        return TMS::API::Core::SftVehicleInspection->new(%$TheDefault);
    }
    return TMS::API::Core::SftVehicleInspection->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DateInspection'       => ' ',
            'InspectionScheduleId' => ' ',
            'InspectionNumber'     => ' ',
            'LocationOfRecords'    => ' ',
            'InspectionId'         => undef,
            'Mileage'              => ' ',
            'InspectorId'          => ' ',
            'Remarks'              => ' ',
            'Status'               => ' ',
            'InspectorSignatureId' => ' '
        };
        return TMS::API::Core::SftVehicleInspection->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'AppPermissionObj', as class_type('TMS::API::Core::AppPermission');
coerce 'AppPermissionObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Feature'      => ' ',
            'AccessName'   => ' ',
            'PermissionId' => undef
        };
        return TMS::API::Core::AppPermission->new(%$TheDefault);
    }
    return TMS::API::Core::AppPermission->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Feature'      => ' ',
            'AccessName'   => ' ',
            'PermissionId' => undef
        };
        return TMS::API::Core::AppPermission->new(%$TheDefault);
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
        return TMS::API::Core::InvTiresize->new(%$TheDefault);
    }
    return TMS::API::Core::InvTiresize->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Type'   => ' ',
            'Name'   => ' ',
            'TireId' => undef
        };
        return TMS::API::Core::InvTiresize->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'TskAlrmObj', as class_type('TMS::API::Core::TskAlrm');
coerce 'TskAlrmObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'periodic'  => ' ',
            'alrmid'    => undef,
            'repeat'    => ' ',
            'message'   => ' ',
            'tskid'     => ' ',
            'atcrontab' => ' ',
            'turnoff'   => ' '
        };
        return TMS::API::Core::TskAlrm->new(%$TheDefault);
    }
    return TMS::API::Core::TskAlrm->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'periodic'  => ' ',
            'alrmid'    => undef,
            'repeat'    => ' ',
            'message'   => ' ',
            'tskid'     => ' ',
            'atcrontab' => ' ',
            'turnoff'   => ' '
        };
        return TMS::API::Core::TskAlrm->new(%$TheDefault);
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
        return TMS::API::Core::SftVehicleInspectItem->new(%$TheDefault);
    }
    return TMS::API::Core::SftVehicleInspectItem->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'InspItmId'    => undef,
            'ItemAreaName' => ' ',
            'Notes'        => ' '
        };
        return TMS::API::Core::SftVehicleInspectItem->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'TskTaskObj', as class_type('TMS::API::Core::TskTask');
coerce 'TskTaskObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'priority'  => ' ',
            'duedate'   => ' ',
            'created'   => ' ',
            'severity'  => ' ',
            'estimated' => ' ',
            'PrsnId'    => ' ',
            'name'      => ' ',
            'prjid'     => ' ',
            'startdate' => ' ',
            'completed' => ' ',
            'tskid'     => undef
        };
        return TMS::API::Core::TskTask->new(%$TheDefault);
    }
    return TMS::API::Core::TskTask->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'priority'  => ' ',
            'duedate'   => ' ',
            'created'   => ' ',
            'severity'  => ' ',
            'estimated' => ' ',
            'PrsnId'    => ' ',
            'name'      => ' ',
            'prjid'     => ' ',
            'startdate' => ' ',
            'completed' => ' ',
            'tskid'     => undef
        };
        return TMS::API::Core::TskTask->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinPaymentMethodObj', as class_type('TMS::API::Core::FinPaymentMethod');
coerce 'FinPaymentMethodObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {'PaymentMethodId' => undef};
        return TMS::API::Core::FinPaymentMethod->new(%$TheDefault);
    }
    return TMS::API::Core::FinPaymentMethod->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {'PaymentMethodId' => undef};
        return TMS::API::Core::FinPaymentMethod->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'TmpRelationsNodeObj', as class_type('TMS::API::Core::TmpRelationsNode');
coerce 'TmpRelationsNodeObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'ParentId'  => ' ',
            'RelNodeId' => undef,
            'Name'      => ' '
        };
        return TMS::API::Core::TmpRelationsNode->new(%$TheDefault);
    }
    return TMS::API::Core::TmpRelationsNode->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'ParentId'  => ' ',
            'RelNodeId' => undef,
            'Name'      => ' '
        };
        return TMS::API::Core::TmpRelationsNode->new(%$TheDefault);
    }
    return $_;
};

1;

