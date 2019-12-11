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
subtype 'FinBillingInfoObj', as class_type('TMS::API::Core::FinBillingInfo');
coerce 'FinBillingInfoObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Fax'             => ' ',
            'BillingTagId'    => ' ',
            'PayToTheOrderOf' => ' ',
            'BillingId'       => undef,
            'DateOut'         => ' ',
            'DateIn'          => ' ',
            'Phone'           => ' ',
            'CreditLimit'     => ' ',
            'Address'         => ' ',
            'CreditHold'      => ' ',
            'ContactName'     => ' ',
            'EntityId'        => ' ',
            'Notes'           => ' ',
            'EMail'           => ' '
        };
        return TMS::Test::Core::FinBillingInfo->new(%$TheDefault);
    }
    return TMS::API::Core::FinBillingInfo->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Fax'             => ' ',
            'BillingTagId'    => ' ',
            'PayToTheOrderOf' => ' ',
            'BillingId'       => undef,
            'DateOut'         => ' ',
            'DateIn'          => ' ',
            'Phone'           => ' ',
            'CreditLimit'     => ' ',
            'Address'         => ' ',
            'CreditHold'      => ' ',
            'ContactName'     => ' ',
            'EntityId'        => ' ',
            'Notes'           => ' ',
            'EMail'           => ' '
        };
        return TMS::Test::Core::FinBillingInfo->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'CntPhonesfaxObj', as class_type('TMS::API::Core::CntPhonesfax');
coerce 'CntPhonesfaxObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Notes'     => ' ',
            'Features'  => ' ',
            'PhnFaxId'  => undef,
            'Mobility'  => ' ',
            'Extension' => ' ',
            'Number'    => ' '
        };
        return TMS::Test::Core::CntPhonesfax->new(%$TheDefault);
    }
    return TMS::API::Core::CntPhonesfax->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Notes'     => ' ',
            'Features'  => ' ',
            'PhnFaxId'  => undef,
            'Mobility'  => ' ',
            'Extension' => ' ',
            'Number'    => ' '
        };
        return TMS::Test::Core::CntPhonesfax->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'SftLogbookObj', as class_type('TMS::API::Core::SftLogbook');
coerce 'SftLogbookObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'LogbookId'   => undef,
            'Notes'       => ' ',
            'Trip'        => ' ',
            'DateStarted' => ' '
        };
        return TMS::Test::Core::SftLogbook->new(%$TheDefault);
    }
    return TMS::API::Core::SftLogbook->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'LogbookId'   => undef,
            'Notes'       => ' ',
            'Trip'        => ' ',
            'DateStarted' => ' '
        };
        return TMS::Test::Core::SftLogbook->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinInvoicesItemObj', as class_type('TMS::API::Core::FinInvoicesItem');
coerce 'FinInvoicesItemObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'CreatedBy'            => ' ',
            'Quantity'             => ' ',
            'ItemTemplateId'       => ' ',
            'CreditJournalEntryId' => ' ',
            'JobId'                => ' ',
            'Comments'             => ' ',
            'InvoiceItemId'        => undef,
            'InvoiceId'            => ' ',
            'DebitJournalEntryId'  => ' ',
            'DateCreated'          => ' ',
            'Notes'                => ' ',
            'Amount'               => ' '
        };
        return TMS::Test::Core::FinInvoicesItem->new(%$TheDefault);
    }
    return TMS::API::Core::FinInvoicesItem->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'CreatedBy'            => ' ',
            'Quantity'             => ' ',
            'ItemTemplateId'       => ' ',
            'CreditJournalEntryId' => ' ',
            'JobId'                => ' ',
            'Comments'             => ' ',
            'InvoiceItemId'        => undef,
            'InvoiceId'            => ' ',
            'DebitJournalEntryId'  => ' ',
            'DateCreated'          => ' ',
            'Notes'                => ' ',
            'Amount'               => ' '
        };
        return TMS::Test::Core::FinInvoicesItem->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'SftVehicleInspectedItemObj', as class_type('TMS::API::Core::SftVehicleInspectedItem');
coerce 'SftVehicleInspectedItemObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'InspectionId'  => ' ',
            'InspectedId'   => undef,
            'InspectedItem' => ' ',
            'Status'        => ' ',
            'InspectedDate' => ' '
        };
        return TMS::Test::Core::SftVehicleInspectedItem->new(%$TheDefault);
    }
    return TMS::API::Core::SftVehicleInspectedItem->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'InspectionId'  => ' ',
            'InspectedId'   => undef,
            'InspectedItem' => ' ',
            'Status'        => ' ',
            'InspectedDate' => ' '
        };
        return TMS::Test::Core::SftVehicleInspectedItem->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'CrrStatePermitObj', as class_type('TMS::API::Core::CrrStatePermit');
coerce 'CrrStatePermitObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Issued'       => ' ',
            'Expired'      => ' ',
            'CrrPrmtAccId' => ' ',
            'StatePrmtId'  => undef,
            'ReceiptNo'    => ' ',
            'Effective'    => ' ',
            'VehicleId'    => ' '
        };
        return TMS::Test::Core::CrrStatePermit->new(%$TheDefault);
    }
    return TMS::API::Core::CrrStatePermit->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Issued'       => ' ',
            'Expired'      => ' ',
            'CrrPrmtAccId' => ' ',
            'StatePrmtId'  => undef,
            'ReceiptNo'    => ' ',
            'Effective'    => ' ',
            'VehicleId'    => ' '
        };
        return TMS::Test::Core::CrrStatePermit->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinPaymentTermObj', as class_type('TMS::API::Core::FinPaymentTerm');
coerce 'FinPaymentTermObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DiscountInDays'  => ' ',
            'Name'            => ' ',
            'Type'            => ' ',
            'DueNext'         => ' ',
            'DueInDays'       => ' ',
            'PaymentTermId'   => undef,
            'DiscountAmount'  => ' ',
            'DiscountPercent' => ' '
        };
        return TMS::Test::Core::FinPaymentTerm->new(%$TheDefault);
    }
    return TMS::API::Core::FinPaymentTerm->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DiscountInDays'  => ' ',
            'Name'            => ' ',
            'Type'            => ' ',
            'DueNext'         => ' ',
            'DueInDays'       => ' ',
            'PaymentTermId'   => undef,
            'DiscountAmount'  => ' ',
            'DiscountPercent' => ' '
        };
        return TMS::Test::Core::FinPaymentTerm->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'EntCarrierObj', as class_type('TMS::API::Core::EntCarrier');
coerce 'EntCarrierObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'CrType'               => ' ',
            'DOT'                  => ' ',
            'CarrierId'            => undef,
            'SCAC'                 => ' ',
            'RateConfEmailAddress' => ' ',
            'McCertificatePhoto'   => ' ',
            'MC'                   => ' '
        };
        return TMS::Test::Core::EntCarrier->new(%$TheDefault);
    }
    return TMS::API::Core::EntCarrier->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'CrType'               => ' ',
            'DOT'                  => ' ',
            'CarrierId'            => undef,
            'SCAC'                 => ' ',
            'RateConfEmailAddress' => ' ',
            'McCertificatePhoto'   => ' ',
            'MC'                   => ' '
        };
        return TMS::Test::Core::EntCarrier->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'TskActnObj', as class_type('TMS::API::Core::TskActn');
coerce 'TskActnObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'note'   => ' ',
            'PrsnId' => ' ',
            'tskid'  => ' ',
            'actid'  => undef
        };
        return TMS::Test::Core::TskActn->new(%$TheDefault);
    }
    return TMS::API::Core::TskActn->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'note'   => ' ',
            'PrsnId' => ' ',
            'tskid'  => ' ',
            'actid'  => undef
        };
        return TMS::Test::Core::TskActn->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinInvoiceObj', as class_type('TMS::API::Core::FinInvoice');
coerce 'FinInvoiceObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'PONumber'       => ' ',
            'Comments'       => ' ',
            'PaymentTermsId' => ' ',
            'DateInvoiced'   => ' ',
            'Notes'          => ' ',
            'DateCreated'    => ' ',
            'EntityId'       => ' ',
            'InvoiceId'      => undef,
            'FactoredParent' => ' ',
            'RefNumber'      => ' ',
            'Status'         => ' '
        };
        return TMS::Test::Core::FinInvoice->new(%$TheDefault);
    }
    return TMS::API::Core::FinInvoice->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'PONumber'       => ' ',
            'Comments'       => ' ',
            'PaymentTermsId' => ' ',
            'DateInvoiced'   => ' ',
            'Notes'          => ' ',
            'DateCreated'    => ' ',
            'EntityId'       => ' ',
            'InvoiceId'      => undef,
            'FactoredParent' => ' ',
            'RefNumber'      => ' ',
            'Status'         => ' '
        };
        return TMS::Test::Core::FinInvoice->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinJournalEntryObj', as class_type('TMS::API::Core::FinJournalEntry');
coerce 'FinJournalEntryObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Amount'         => ' ',
            'VendorAmount'   => ' ',
            'JrlEntryId'     => undef,
            'EntityId'       => ' ',
            'DateCreated'    => ' ',
            'DebitCredit'    => ' ',
            'TransactionId'  => ' ',
            'ReportAmount'   => ' ',
            'AccountId'      => ' ',
            'Classification' => ' ',
            'JobId'          => ' ',
            'CreatedBy'      => ' '
        };
        return TMS::Test::Core::FinJournalEntry->new(%$TheDefault);
    }
    return TMS::API::Core::FinJournalEntry->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Amount'         => ' ',
            'VendorAmount'   => ' ',
            'JrlEntryId'     => undef,
            'EntityId'       => ' ',
            'DateCreated'    => ' ',
            'DebitCredit'    => ' ',
            'TransactionId'  => ' ',
            'ReportAmount'   => ' ',
            'AccountId'      => ' ',
            'Classification' => ' ',
            'JobId'          => ' ',
            'CreatedBy'      => ' '
        };
        return TMS::Test::Core::FinJournalEntry->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'SftVehicleInspectionObj', as class_type('TMS::API::Core::SftVehicleInspection');
coerce 'SftVehicleInspectionObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'InspectorSignatureId' => ' ',
            'LocationOfRecords'    => ' ',
            'Remarks'              => ' ',
            'InspectorId'          => ' ',
            'Status'               => ' ',
            'DateInspection'       => ' ',
            'InspectionNumber'     => ' ',
            'InspectionId'         => undef,
            'InspectionScheduleId' => ' ',
            'Mileage'              => ' '
        };
        return TMS::Test::Core::SftVehicleInspection->new(%$TheDefault);
    }
    return TMS::API::Core::SftVehicleInspection->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'InspectorSignatureId' => ' ',
            'LocationOfRecords'    => ' ',
            'Remarks'              => ' ',
            'InspectorId'          => ' ',
            'Status'               => ' ',
            'DateInspection'       => ' ',
            'InspectionNumber'     => ' ',
            'InspectionId'         => undef,
            'InspectionScheduleId' => ' ',
            'Mileage'              => ' '
        };
        return TMS::Test::Core::SftVehicleInspection->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'InvRoleObj', as class_type('TMS::API::Core::InvRole');
coerce 'InvRoleObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Notes'     => ' ',
            'InvRoleId' => undef,
            'RoleName'  => ' '
        };
        return TMS::Test::Core::InvRole->new(%$TheDefault);
    }
    return TMS::API::Core::InvRole->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Notes'     => ' ',
            'InvRoleId' => undef,
            'RoleName'  => ' '
        };
        return TMS::Test::Core::InvRole->new(%$TheDefault);
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
subtype 'SftInspectionScheduleObj', as class_type('TMS::API::Core::SftInspectionSchedule');
coerce 'SftInspectionScheduleObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'InspectionScheduleId' => undef,
            'VehicleId'            => ' ',
            'InspectionType'       => ' '
        };
        return TMS::Test::Core::SftInspectionSchedule->new(%$TheDefault);
    }
    return TMS::API::Core::SftInspectionSchedule->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'InspectionScheduleId' => undef,
            'VehicleId'            => ' ',
            'InspectionType'       => ' '
        };
        return TMS::Test::Core::SftInspectionSchedule->new(%$TheDefault);
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
subtype 'DspLoadsDestinationObj', as class_type('TMS::API::Core::DspLoadsDestination');
coerce 'DspLoadsDestinationObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Commodity'        => ' ',
            'PU_PO'            => ' ',
            'Branch'           => ' ',
            'AppointmentEnd'   => ' ',
            'DestinationId'    => undef,
            'Weight'           => ' ',
            'AppointmentStart' => ' ',
            'StopType'         => ' ',
            'StopOrder'        => ' ',
            'Pieces'           => ' ',
            'LoadId'           => ' ',
            'Pallets'          => ' ',
            'AppointmentType'  => ' ',
            'AppointmentNotes' => ' '
        };
        return TMS::Test::Core::DspLoadsDestination->new(%$TheDefault);
    }
    return TMS::API::Core::DspLoadsDestination->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Commodity'        => ' ',
            'PU_PO'            => ' ',
            'Branch'           => ' ',
            'AppointmentEnd'   => ' ',
            'DestinationId'    => undef,
            'Weight'           => ' ',
            'AppointmentStart' => ' ',
            'StopType'         => ' ',
            'StopOrder'        => ' ',
            'Pieces'           => ' ',
            'LoadId'           => ' ',
            'Pallets'          => ' ',
            'AppointmentType'  => ' ',
            'AppointmentNotes' => ' '
        };
        return TMS::Test::Core::DspLoadsDestination->new(%$TheDefault);
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
        return TMS::Test::Core::DrvDesttype->new(%$TheDefault);
    }
    return TMS::API::Core::DrvDesttype->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DestName'      => ' ',
            'Notes'         => ' ',
            'DesiredDestId' => undef
        };
        return TMS::Test::Core::DrvDesttype->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'MsgAccessObj', as class_type('TMS::API::Core::MsgAccess');
coerce 'MsgAccessObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'PermissionName' => ' ',
            'macsid'         => undef
        };
        return TMS::Test::Core::MsgAccess->new(%$TheDefault);
    }
    return TMS::API::Core::MsgAccess->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'PermissionName' => ' ',
            'macsid'         => undef
        };
        return TMS::Test::Core::MsgAccess->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'InvEquipmentObj', as class_type('TMS::API::Core::InvEquipment');
coerce 'InvEquipmentObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'GeneralName'    => ' ',
            'OwnerId'        => ' ',
            'SerialNo'       => ' ',
            'PricePurchased' => ' ',
            'VendorId'       => ' ',
            'PriceSold'      => ' ',
            'EquipmentId'    => undef,
            'EquipmentType'  => ' ',
            'DateSold'       => ' ',
            'DatePurchased'  => ' '
        };
        return TMS::Test::Core::InvEquipment->new(%$TheDefault);
    }
    return TMS::API::Core::InvEquipment->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'GeneralName'    => ' ',
            'OwnerId'        => ' ',
            'SerialNo'       => ' ',
            'PricePurchased' => ' ',
            'VendorId'       => ' ',
            'PriceSold'      => ' ',
            'EquipmentId'    => undef,
            'EquipmentType'  => ' ',
            'DateSold'       => ' ',
            'DatePurchased'  => ' '
        };
        return TMS::Test::Core::InvEquipment->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinJobObj', as class_type('TMS::API::Core::FinJob');
coerce 'FinJobObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Title'      => ' ',
            'JobId'      => undef,
            'JobCreated' => ' ',
            'JobAddedBy' => ' '
        };
        return TMS::Test::Core::FinJob->new(%$TheDefault);
    }
    return TMS::API::Core::FinJob->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Title'      => ' ',
            'JobId'      => undef,
            'JobCreated' => ' ',
            'JobAddedBy' => ' '
        };
        return TMS::Test::Core::FinJob->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinItemTemplateObj', as class_type('TMS::API::Core::FinItemTemplate');
coerce 'FinItemTemplateObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'ParentId'        => ' ',
            'CreatedBy'       => ' ',
            'Description'     => ' ',
            'PriceType'       => ' ',
            'Deleted'         => ' ',
            'TransactionType' => ' ',
            'CreditAccountId' => ' ',
            'DebitAccountId'  => ' ',
            'ItemTemplateId'  => undef,
            'DateDeleted'     => ' ',
            'DateUpdated'     => ' ',
            'UpdatedBy'       => ' ',
            'Price'           => ' ',
            'UserDefined'     => ' ',
            'TemplateTypeId'  => ' ',
            'DeletedBy'       => ' ',
            'EntityId'        => ' ',
            'DateCreated'     => ' ',
            'Name'            => ' '
        };
        return TMS::Test::Core::FinItemTemplate->new(%$TheDefault);
    }
    return TMS::API::Core::FinItemTemplate->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'ParentId'        => ' ',
            'CreatedBy'       => ' ',
            'Description'     => ' ',
            'PriceType'       => ' ',
            'Deleted'         => ' ',
            'TransactionType' => ' ',
            'CreditAccountId' => ' ',
            'DebitAccountId'  => ' ',
            'ItemTemplateId'  => undef,
            'DateDeleted'     => ' ',
            'DateUpdated'     => ' ',
            'UpdatedBy'       => ' ',
            'Price'           => ' ',
            'UserDefined'     => ' ',
            'TemplateTypeId'  => ' ',
            'DeletedBy'       => ' ',
            'EntityId'        => ' ',
            'DateCreated'     => ' ',
            'Name'            => ' '
        };
        return TMS::Test::Core::FinItemTemplate->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'AppAccountObj', as class_type('TMS::API::Core::AppAccount');
coerce 'AppAccountObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'PasswordHash' => ' ',
            'DateCreated'  => ' ',
            'Locked'       => ' ',
            'Username'     => ' ',
            'AppAccountId' => undef,
            'Salt'         => ' ',
            'UserId'       => ' '
        };
        return TMS::Test::Core::AppAccount->new(%$TheDefault);
    }
    return TMS::API::Core::AppAccount->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'PasswordHash' => ' ',
            'DateCreated'  => ' ',
            'Locked'       => ' ',
            'Username'     => ' ',
            'AppAccountId' => undef,
            'Salt'         => ' ',
            'UserId'       => ' '
        };
        return TMS::Test::Core::AppAccount->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'DrvDriverObj', as class_type('TMS::API::Core::DrvDriver');
coerce 'DrvDriverObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'InternationalRoutes' => ' ',
            'LastAnnualReview'    => ' ',
            'DriverId'            => undef,
            'PullNotice'          => ' ',
            'LocalRoutes'         => ' '
        };
        return TMS::Test::Core::DrvDriver->new(%$TheDefault);
    }
    return TMS::API::Core::DrvDriver->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'InternationalRoutes' => ' ',
            'LastAnnualReview'    => ' ',
            'DriverId'            => undef,
            'PullNotice'          => ' ',
            'LocalRoutes'         => ' '
        };
        return TMS::Test::Core::DrvDriver->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'GenFileObj', as class_type('TMS::API::Core::GenFile');
coerce 'GenFileObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'FileName'      => ' ',
            'DocumentTitle' => ' ',
            'Notes'         => ' ',
            'UploadDate'    => ' ',
            'FileId'        => undef,
            'ExpiredDate'   => ' ',
            'MIMEType'      => ' ',
            'SHASIG'        => ' ',
            'Keywords'      => ' ',
            'FileData'      => ' '
        };
        return TMS::Test::Core::GenFile->new(%$TheDefault);
    }
    return TMS::API::Core::GenFile->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'FileName'      => ' ',
            'DocumentTitle' => ' ',
            'Notes'         => ' ',
            'UploadDate'    => ' ',
            'FileId'        => undef,
            'ExpiredDate'   => ' ',
            'MIMEType'      => ' ',
            'SHASIG'        => ' ',
            'Keywords'      => ' ',
            'FileData'      => ' '
        };
        return TMS::Test::Core::GenFile->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'SftVehicleInspectItemObj', as class_type('TMS::API::Core::SftVehicleInspectItem');
coerce 'SftVehicleInspectItemObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'ItemAreaName' => ' ',
            'Notes'        => ' ',
            'InspItmId'    => undef
        };
        return TMS::Test::Core::SftVehicleInspectItem->new(%$TheDefault);
    }
    return TMS::API::Core::SftVehicleInspectItem->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'ItemAreaName' => ' ',
            'Notes'        => ' ',
            'InspItmId'    => undef
        };
        return TMS::Test::Core::SftVehicleInspectItem->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'EntPersonObj', as class_type('TMS::API::Core::EntPerson');
coerce 'EntPersonObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'MiddleName' => ' ',
            'Prefix'     => ' ',
            'PrsnId'     => undef,
            'Suffix'     => ' ',
            'FirstName'  => ' ',
            'NickName'   => ' ',
            'BrnchId'    => ' ',
            'LastName'   => ' '
        };
        return TMS::Test::Core::EntPerson->new(%$TheDefault);
    }
    return TMS::API::Core::EntPerson->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'MiddleName' => ' ',
            'Prefix'     => ' ',
            'PrsnId'     => undef,
            'Suffix'     => ' ',
            'FirstName'  => ' ',
            'NickName'   => ' ',
            'BrnchId'    => ' ',
            'LastName'   => ' '
        };
        return TMS::Test::Core::EntPerson->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'SftElogStatObj', as class_type('TMS::API::Core::SftElogStat');
coerce 'SftElogStatObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Odometer'           => ' ',
            'Posted'             => ' ',
            'LocationProviderId' => ' ',
            'Speed'              => ' ',
            'Bearings'           => ' ',
            'Acquired'           => ' ',
            'Fuel'               => ' ',
            'GpsReqId'           => undef,
            'EngineHours'        => ' ',
            'EquipmentId'        => ' ',
            'Latitude'           => ' ',
            'VehicleState'       => ' ',
            'Longitude'          => ' '
        };
        return TMS::Test::Core::SftElogStat->new(%$TheDefault);
    }
    return TMS::API::Core::SftElogStat->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Odometer'           => ' ',
            'Posted'             => ' ',
            'LocationProviderId' => ' ',
            'Speed'              => ' ',
            'Bearings'           => ' ',
            'Acquired'           => ' ',
            'Fuel'               => ' ',
            'GpsReqId'           => undef,
            'EngineHours'        => ' ',
            'EquipmentId'        => ' ',
            'Latitude'           => ' ',
            'VehicleState'       => ' ',
            'Longitude'          => ' '
        };
        return TMS::Test::Core::SftElogStat->new(%$TheDefault);
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
        return TMS::Test::Core::EntShipper->new(%$TheDefault);
    }
    return TMS::API::Core::EntShipper->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Notes'     => ' ',
            'ShipperId' => undef
        };
        return TMS::Test::Core::EntShipper->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'HrAssociateObj', as class_type('TMS::API::Core::HrAssociate');
coerce 'HrAssociateObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Notes'          => ' ',
            'DateCreated'    => ' ',
            'NodeId'         => ' ',
            'AuthorityLevel' => ' ',
            'BizFax'         => ' ',
            'AstId'          => undef,
            'CurrentTitle'   => ' ',
            'DateRemoved'    => ' ',
            'BizEmail'       => ' ',
            'BizPhone'       => ' '
        };
        return TMS::Test::Core::HrAssociate->new(%$TheDefault);
    }
    return TMS::API::Core::HrAssociate->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Notes'          => ' ',
            'DateCreated'    => ' ',
            'NodeId'         => ' ',
            'AuthorityLevel' => ' ',
            'BizFax'         => ' ',
            'AstId'          => undef,
            'CurrentTitle'   => ' ',
            'DateRemoved'    => ' ',
            'BizEmail'       => ' ',
            'BizPhone'       => ' '
        };
        return TMS::Test::Core::HrAssociate->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinItemTemplatesTypeObj', as class_type('TMS::API::Core::FinItemTemplatesType');
coerce 'FinItemTemplatesTypeObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Description'    => ' ',
            'UserDefined'    => ' ',
            'TemplateTypeId' => undef,
            'DisplayToUser'  => ' ',
            'Name'           => ' '
        };
        return TMS::Test::Core::FinItemTemplatesType->new(%$TheDefault);
    }
    return TMS::API::Core::FinItemTemplatesType->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Description'    => ' ',
            'UserDefined'    => ' ',
            'TemplateTypeId' => undef,
            'DisplayToUser'  => ' ',
            'Name'           => ' '
        };
        return TMS::Test::Core::FinItemTemplatesType->new(%$TheDefault);
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
subtype 'BizCompanyNodeObj', as class_type('TMS::API::Core::BizCompanyNode');
coerce 'BizCompanyNodeObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Type'     => ' ',
            'ParentId' => ' ',
            'NodeId'   => undef,
            'UnitName' => ' '
        };
        return TMS::Test::Core::BizCompanyNode->new(%$TheDefault);
    }
    return TMS::API::Core::BizCompanyNode->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Type'     => ' ',
            'ParentId' => ' ',
            'NodeId'   => undef,
            'UnitName' => ' '
        };
        return TMS::Test::Core::BizCompanyNode->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinTransactionObj', as class_type('TMS::API::Core::FinTransaction');
coerce 'FinTransactionObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DateCreated'     => ' ',
            'JobId'           => ' ',
            'Class'           => ' ',
            'DateTransaction' => ' ',
            'TransactionType' => ' ',
            'TransactionId'   => undef,
            'Status'          => ' ',
            'RefNumber'       => ' ',
            'Memo'            => ' ',
            'CreatedBy'       => ' '
        };
        return TMS::Test::Core::FinTransaction->new(%$TheDefault);
    }
    return TMS::API::Core::FinTransaction->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DateCreated'     => ' ',
            'JobId'           => ' ',
            'Class'           => ' ',
            'DateTransaction' => ' ',
            'TransactionType' => ' ',
            'TransactionId'   => undef,
            'Status'          => ' ',
            'RefNumber'       => ' ',
            'Memo'            => ' ',
            'CreatedBy'       => ' '
        };
        return TMS::Test::Core::FinTransaction->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinBillingBankObj', as class_type('TMS::API::Core::FinBillingBank');
coerce 'FinBillingBankObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'AccountNumber'   => ' ',
            'Notes'           => ' ',
            'BankId'          => undef,
            'Purpose'         => ' ',
            'RoutingNumber'   => ' ',
            'BillingId'       => ' ',
            'Institution'     => ' ',
            'AccountNickname' => ' ',
            'VoidCheck'       => ' ',
            'Active'          => ' ',
            'AccountType'     => ' '
        };
        return TMS::Test::Core::FinBillingBank->new(%$TheDefault);
    }
    return TMS::API::Core::FinBillingBank->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'AccountNumber'   => ' ',
            'Notes'           => ' ',
            'BankId'          => undef,
            'Purpose'         => ' ',
            'RoutingNumber'   => ' ',
            'BillingId'       => ' ',
            'Institution'     => ' ',
            'AccountNickname' => ' ',
            'VoidCheck'       => ' ',
            'Active'          => ' ',
            'AccountType'     => ' '
        };
        return TMS::Test::Core::FinBillingBank->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinChequeObj', as class_type('TMS::API::Core::FinCheque');
coerce 'FinChequeObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'AuthorizedBy'       => ' ',
            'TransactionId'      => ' ',
            'PayerCityAddress'   => ' ',
            'BankStreetAddress'  => ' ',
            'BankRoutingNumber'  => ' ',
            'DateCreated'        => ' ',
            'BankName'           => ' ',
            'ChequeNumber'       => ' ',
            'PayerPhone'         => ' ',
            'Bank'               => ' ',
            'Payee'              => ' ',
            'PayeeStreetAddress' => ' ',
            'PayeeName'          => ' ',
            'ChequeId'           => undef,
            'BankAccountNumber'  => ' ',
            'DateVoided'         => ' ',
            'BankPhone'          => ' ',
            'PayeeCityAddress'   => ' ',
            'Amount'             => ' ',
            'BankCityAddress'    => ' ',
            'VoidedBy'           => ' ',
            'PayeePhone'         => ' ',
            'Payer'              => ' ',
            'PayerStreetAddress' => ' ',
            'CreatedBy'          => ' ',
            'Memo'               => ' ',
            'DateAuthorized'     => ' ',
            'PayerName'          => ' '
        };
        return TMS::Test::Core::FinCheque->new(%$TheDefault);
    }
    return TMS::API::Core::FinCheque->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'AuthorizedBy'       => ' ',
            'TransactionId'      => ' ',
            'PayerCityAddress'   => ' ',
            'BankStreetAddress'  => ' ',
            'BankRoutingNumber'  => ' ',
            'DateCreated'        => ' ',
            'BankName'           => ' ',
            'ChequeNumber'       => ' ',
            'PayerPhone'         => ' ',
            'Bank'               => ' ',
            'Payee'              => ' ',
            'PayeeStreetAddress' => ' ',
            'PayeeName'          => ' ',
            'ChequeId'           => undef,
            'BankAccountNumber'  => ' ',
            'DateVoided'         => ' ',
            'BankPhone'          => ' ',
            'PayeeCityAddress'   => ' ',
            'Amount'             => ' ',
            'BankCityAddress'    => ' ',
            'VoidedBy'           => ' ',
            'PayeePhone'         => ' ',
            'Payer'              => ' ',
            'PayerStreetAddress' => ' ',
            'CreatedBy'          => ' ',
            'Memo'               => ' ',
            'DateAuthorized'     => ' ',
            'PayerName'          => ' '
        };
        return TMS::Test::Core::FinCheque->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'CntAddressObj', as class_type('TMS::API::Core::CntAddress');
coerce 'CntAddressObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Country' => ' ',
            'Street2' => ' ',
            'AddrId'  => undef,
            'Street1' => ' ',
            'Notes'   => ' ',
            'State'   => ' ',
            'GpsLng'  => ' ',
            'Zip'     => ' ',
            'GpsLat'  => ' ',
            'City'    => ' ',
            'Street3' => ' '
        };
        return TMS::Test::Core::CntAddress->new(%$TheDefault);
    }
    return TMS::API::Core::CntAddress->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Country' => ' ',
            'Street2' => ' ',
            'AddrId'  => undef,
            'Street1' => ' ',
            'Notes'   => ' ',
            'State'   => ' ',
            'GpsLng'  => ' ',
            'Zip'     => ' ',
            'GpsLat'  => ' ',
            'City'    => ' ',
            'Street3' => ' '
        };
        return TMS::Test::Core::CntAddress->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'InvTiresizeObj', as class_type('TMS::API::Core::InvTiresize');
coerce 'InvTiresizeObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Type'   => ' ',
            'TireId' => undef,
            'Name'   => ' '
        };
        return TMS::Test::Core::InvTiresize->new(%$TheDefault);
    }
    return TMS::API::Core::InvTiresize->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Type'   => ' ',
            'TireId' => undef,
            'Name'   => ' '
        };
        return TMS::Test::Core::InvTiresize->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'BizBranchObj', as class_type('TMS::API::Core::BizBranch');
coerce 'BizBranchObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'BrnchId'      => undef,
            'OfficeName'   => ' ',
            'BrnchEMail'   => ' ',
            'BrnchFax'     => ' ',
            'BizId'        => ' ',
            'BrnchPhone'   => ' ',
            'BrnchAddress' => ' '
        };
        return TMS::Test::Core::BizBranch->new(%$TheDefault);
    }
    return TMS::API::Core::BizBranch->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'BrnchId'      => undef,
            'OfficeName'   => ' ',
            'BrnchEMail'   => ' ',
            'BrnchFax'     => ' ',
            'BizId'        => ' ',
            'BrnchPhone'   => ' ',
            'BrnchAddress' => ' '
        };
        return TMS::Test::Core::BizBranch->new(%$TheDefault);
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
        return TMS::Test::Core::AppFeature->new(%$TheDefault);
    }
    return TMS::API::Core::AppFeature->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'AppFeatureId' => undef,
            'Notes'        => ' ',
            'Name'         => ' '
        };
        return TMS::Test::Core::AppFeature->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'CrrPermitAccountObj', as class_type('TMS::API::Core::CrrPermitAccount');
coerce 'CrrPermitAccountObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'CarrierId'    => ' ',
            'CrrPrmtAccId' => undef,
            'State'        => ' ',
            'AccountNo'    => ' '
        };
        return TMS::Test::Core::CrrPermitAccount->new(%$TheDefault);
    }
    return TMS::API::Core::CrrPermitAccount->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'CarrierId'    => ' ',
            'CrrPrmtAccId' => undef,
            'State'        => ' ',
            'AccountNo'    => ' '
        };
        return TMS::Test::Core::CrrPermitAccount->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'TskAlrmObj', as class_type('TMS::API::Core::TskAlrm');
coerce 'TskAlrmObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'repeat'    => ' ',
            'message'   => ' ',
            'atcrontab' => ' ',
            'periodic'  => ' ',
            'alrmid'    => undef,
            'tskid'     => ' ',
            'turnoff'   => ' '
        };
        return TMS::Test::Core::TskAlrm->new(%$TheDefault);
    }
    return TMS::API::Core::TskAlrm->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'repeat'    => ' ',
            'message'   => ' ',
            'atcrontab' => ' ',
            'periodic'  => ' ',
            'alrmid'    => undef,
            'tskid'     => ' ',
            'turnoff'   => ' '
        };
        return TMS::Test::Core::TskAlrm->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'DspTripObj', as class_type('TMS::API::Core::DspTrip');
coerce 'DspTripObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DateCreated'    => ' ',
            'Notes'          => ' ',
            'IsValid'        => ' ',
            'DateBooked'     => ' ',
            'TripNumber'     => ' ',
            'DateStarted'    => ' ',
            'TripId'         => undef,
            'GoogleRoute'    => ' ',
            'TripStatus'     => ' ',
            'CreatedBy'      => ' ',
            'DateDispatched' => ' ',
            'DateCompleted'  => ' '
        };
        return TMS::Test::Core::DspTrip->new(%$TheDefault);
    }
    return TMS::API::Core::DspTrip->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DateCreated'    => ' ',
            'Notes'          => ' ',
            'IsValid'        => ' ',
            'DateBooked'     => ' ',
            'TripNumber'     => ' ',
            'DateStarted'    => ' ',
            'TripId'         => undef,
            'GoogleRoute'    => ' ',
            'TripStatus'     => ' ',
            'CreatedBy'      => ' ',
            'DateDispatched' => ' ',
            'DateCompleted'  => ' '
        };
        return TMS::Test::Core::DspTrip->new(%$TheDefault);
    }
    return $_;
};

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
subtype 'FinAccountObj', as class_type('TMS::API::Core::FinAccount');
coerce 'FinAccountObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'AccountId'     => undef,
            'Code'          => ' ',
            'Active'        => ' ',
            'Balance'       => ' ',
            'AccountTypeId' => ' ',
            'Description'   => ' ',
            'ParentId'      => ' ',
            'DateCreated'   => ' ',
            'Name'          => ' ',
            'Valid'         => ' ',
            'UserDefined'   => ' ',
            'ExternalName'  => ' '
        };
        return TMS::Test::Core::FinAccount->new(%$TheDefault);
    }
    return TMS::API::Core::FinAccount->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'AccountId'     => undef,
            'Code'          => ' ',
            'Active'        => ' ',
            'Balance'       => ' ',
            'AccountTypeId' => ' ',
            'Description'   => ' ',
            'ParentId'      => ' ',
            'DateCreated'   => ' ',
            'Name'          => ' ',
            'Valid'         => ' ',
            'UserDefined'   => ' ',
            'ExternalName'  => ' '
        };
        return TMS::Test::Core::FinAccount->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'TskTaskObj', as class_type('TMS::API::Core::TskTask');
coerce 'TskTaskObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'estimated' => ' ',
            'PrsnId'    => ' ',
            'priority'  => ' ',
            'name'      => ' ',
            'startdate' => ' ',
            'created'   => ' ',
            'severity'  => ' ',
            'completed' => ' ',
            'prjid'     => ' ',
            'duedate'   => ' ',
            'tskid'     => undef
        };
        return TMS::Test::Core::TskTask->new(%$TheDefault);
    }
    return TMS::API::Core::TskTask->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'estimated' => ' ',
            'PrsnId'    => ' ',
            'priority'  => ' ',
            'name'      => ' ',
            'startdate' => ' ',
            'created'   => ' ',
            'severity'  => ' ',
            'completed' => ' ',
            'prjid'     => ' ',
            'duedate'   => ' ',
            'tskid'     => undef
        };
        return TMS::Test::Core::TskTask->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinInvoicePaymentObj', as class_type('TMS::API::Core::FinInvoicePayment');
coerce 'FinInvoicePaymentObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Amount'           => ' ',
            'DateCreated'      => ' ',
            'CreatedBy'        => ' ',
            'PaymentMethodId'  => ' ',
            'DatePayment'      => ' ',
            'InvoiceId'        => ' ',
            'InvoicePaymentId' => undef,
            'TransactionId'    => ' ',
            'PayerId'          => ' ',
            'Valid'            => ' '
        };
        return TMS::Test::Core::FinInvoicePayment->new(%$TheDefault);
    }
    return TMS::API::Core::FinInvoicePayment->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Amount'           => ' ',
            'DateCreated'      => ' ',
            'CreatedBy'        => ' ',
            'PaymentMethodId'  => ' ',
            'DatePayment'      => ' ',
            'InvoiceId'        => ' ',
            'InvoicePaymentId' => undef,
            'TransactionId'    => ' ',
            'PayerId'          => ' ',
            'Valid'            => ' '
        };
        return TMS::Test::Core::FinInvoicePayment->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'AppMenuItemObj', as class_type('TMS::API::Core::AppMenuItem');
coerce 'AppMenuItemObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Title'      => ' ',
            'MenuItemId' => undef,
            'Enabled'    => ' ',
            'SortIndex'  => ' ',
            'Help'       => ' ',
            'Target'     => ' ',
            'Icon'       => ' ',
            'Route'      => ' ',
            'Label'      => ' ',
            'ParentId'   => ' '
        };
        return TMS::Test::Core::AppMenuItem->new(%$TheDefault);
    }
    return TMS::API::Core::AppMenuItem->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Title'      => ' ',
            'MenuItemId' => undef,
            'Enabled'    => ' ',
            'SortIndex'  => ' ',
            'Help'       => ' ',
            'Target'     => ' ',
            'Icon'       => ' ',
            'Route'      => ' ',
            'Label'      => ' ',
            'ParentId'   => ' '
        };
        return TMS::Test::Core::AppMenuItem->new(%$TheDefault);
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
subtype 'EntBusinessObj', as class_type('TMS::API::Core::EntBusiness');
coerce 'EntBusinessObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'BizId'   => undef,
            'BizName' => ' ',
            'BizURL'  => ' '
        };
        return TMS::Test::Core::EntBusiness->new(%$TheDefault);
    }
    return TMS::API::Core::EntBusiness->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'BizId'   => undef,
            'BizName' => ' ',
            'BizURL'  => ' '
        };
        return TMS::Test::Core::EntBusiness->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'CrrIftaObj', as class_type('TMS::API::Core::CrrIfta');
coerce 'CrrIftaObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'IFTALicense' => ' ',
            'Effective'   => ' ',
            'State'       => ' ',
            'BizId'       => ' ',
            'IftaAcctId'  => undef,
            'ProofDoc'    => ' ',
            'Expiration'  => ' ',
            'McAccount'   => ' '
        };
        return TMS::Test::Core::CrrIfta->new(%$TheDefault);
    }
    return TMS::API::Core::CrrIfta->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'IFTALicense' => ' ',
            'Effective'   => ' ',
            'State'       => ' ',
            'BizId'       => ' ',
            'IftaAcctId'  => undef,
            'ProofDoc'    => ' ',
            'Expiration'  => ' ',
            'McAccount'   => ' '
        };
        return TMS::Test::Core::CrrIfta->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'InvUnitObj', as class_type('TMS::API::Core::InvUnit');
coerce 'InvUnitObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'UnitId'  => undef,
            'UnitTag' => ' '
        };
        return TMS::Test::Core::InvUnit->new(%$TheDefault);
    }
    return TMS::API::Core::InvUnit->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'UnitId'  => undef,
            'UnitTag' => ' '
        };
        return TMS::Test::Core::InvUnit->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'DspLoadObj', as class_type('TMS::API::Core::DspLoad');
coerce 'DspLoadObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'BookedBy'       => ' ',
            'LoadId'         => undef,
            'BrokerId'       => ' ',
            'CreatedBy'      => ' ',
            'Precooling'     => ' ',
            'ReeferTempHigh' => ' ',
            'GoogleRoute'    => ' ',
            'LoadType'       => ' ',
            'TempMode'       => ' ',
            'ProNumber'      => ' ',
            'ReeferTempLow'  => ' ',
            'DateBooked'     => ' ',
            'DateCreated'    => ' ',
            'LoadRate'       => ' ',
            'Job'            => ' ',
            'DispatchNote'   => ' ',
            'TruckType'      => ' ',
            'TeamRequired'   => ' ',
            'ShipperId'      => ' ',
            'LoadNumber'     => ' ',
            'Status'         => ' '
        };
        return TMS::Test::Core::DspLoad->new(%$TheDefault);
    }
    return TMS::API::Core::DspLoad->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'BookedBy'       => ' ',
            'LoadId'         => undef,
            'BrokerId'       => ' ',
            'CreatedBy'      => ' ',
            'Precooling'     => ' ',
            'ReeferTempHigh' => ' ',
            'GoogleRoute'    => ' ',
            'LoadType'       => ' ',
            'TempMode'       => ' ',
            'ProNumber'      => ' ',
            'ReeferTempLow'  => ' ',
            'DateBooked'     => ' ',
            'DateCreated'    => ' ',
            'LoadRate'       => ' ',
            'Job'            => ' ',
            'DispatchNote'   => ' ',
            'TruckType'      => ' ',
            'TeamRequired'   => ' ',
            'ShipperId'      => ' ',
            'LoadNumber'     => ' ',
            'Status'         => ' '
        };
        return TMS::Test::Core::DspLoad->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'DrvCdlEndorsementObj', as class_type('TMS::API::Core::DrvCdlEndorsement');
coerce 'DrvCdlEndorsementObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'EndrsId'       => undef,
            'ExpiredDate'   => ' ',
            'Endorsement'   => ' ',
            'ValidFromDate' => ' '
        };
        return TMS::Test::Core::DrvCdlEndorsement->new(%$TheDefault);
    }
    return TMS::API::Core::DrvCdlEndorsement->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'EndrsId'       => undef,
            'ExpiredDate'   => ' ',
            'Endorsement'   => ' ',
            'ValidFromDate' => ' '
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
            'PersonId'    => ' ',
            'DateCreated' => ' ',
            'Notes'       => ' ',
            'EntityId'    => undef,
            'BusinessId'  => ' ',
            'IsActive'    => ' '
        };
        return TMS::Test::Core::Entity->new(%$TheDefault);
    }
    return TMS::API::Core::Entity->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'PersonId'    => ' ',
            'DateCreated' => ' ',
            'Notes'       => ' ',
            'EntityId'    => undef,
            'BusinessId'  => ' ',
            'IsActive'    => ' '
        };
        return TMS::Test::Core::Entity->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'InvVehicleObj', as class_type('TMS::API::Core::InvVehicle');
coerce 'InvVehicleObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'VehicleId'     => undef,
            'Make'          => ' ',
            'Year'          => ' ',
            'Height'        => ' ',
            'UnladenWeight' => ' ',
            'Width'         => ' ',
            'TireSize'      => ' ',
            'VIN'           => ' ',
            'Axels'         => ' ',
            'Fuel'          => ' ',
            'Length'        => ' ',
            'CarrierId'     => ' ',
            'Model'         => ' ',
            'Color'         => ' '
        };
        return TMS::Test::Core::InvVehicle->new(%$TheDefault);
    }
    return TMS::API::Core::InvVehicle->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'VehicleId'     => undef,
            'Make'          => ' ',
            'Year'          => ' ',
            'Height'        => ' ',
            'UnladenWeight' => ' ',
            'Width'         => ' ',
            'TireSize'      => ' ',
            'VIN'           => ' ',
            'Axels'         => ' ',
            'Fuel'          => ' ',
            'Length'        => ' ',
            'CarrierId'     => ' ',
            'Model'         => ' ',
            'Color'         => ' '
        };
        return TMS::Test::Core::InvVehicle->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinAccountTypeObj', as class_type('TMS::API::Core::FinAccountType');
coerce 'FinAccountTypeObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Name'          => ' ',
            'Temp'          => ' ',
            'Valid'         => ' ',
            'UserDefined'   => ' ',
            'Debit'         => ' ',
            'BalanceSheet'  => ' ',
            'Editable'      => ' ',
            'DisplayOrder'  => ' ',
            'Credit'        => ' ',
            'IncomeSheet'   => ' ',
            'AccountTypeId' => undef,
            'ParentId'      => ' '
        };
        return TMS::Test::Core::FinAccountType->new(%$TheDefault);
    }
    return TMS::API::Core::FinAccountType->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Name'          => ' ',
            'Temp'          => ' ',
            'Valid'         => ' ',
            'UserDefined'   => ' ',
            'Debit'         => ' ',
            'BalanceSheet'  => ' ',
            'Editable'      => ' ',
            'DisplayOrder'  => ' ',
            'Credit'        => ' ',
            'IncomeSheet'   => ' ',
            'AccountTypeId' => undef,
            'ParentId'      => ' '
        };
        return TMS::Test::Core::FinAccountType->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'FinBillingTagObj', as class_type('TMS::API::Core::FinBillingTag');
coerce 'FinBillingTagObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DateCreated'  => ' ',
            'BillingTagId' => undef,
            'BillingTag'   => ' ',
            'UserDefined'  => ' ',
            'CreatedBy'    => ' '
        };
        return TMS::Test::Core::FinBillingTag->new(%$TheDefault);
    }
    return TMS::API::Core::FinBillingTag->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'DateCreated'  => ' ',
            'BillingTagId' => undef,
            'BillingTag'   => ' ',
            'UserDefined'  => ' ',
            'CreatedBy'    => ' '
        };
        return TMS::Test::Core::FinBillingTag->new(%$TheDefault);
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
subtype 'AppPermissionObj', as class_type('TMS::API::Core::AppPermission');
coerce 'AppPermissionObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'PermissionId' => undef,
            'Feature'      => ' ',
            'AccessName'   => ' '
        };
        return TMS::Test::Core::AppPermission->new(%$TheDefault);
    }
    return TMS::API::Core::AppPermission->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'PermissionId' => undef,
            'Feature'      => ' ',
            'AccessName'   => ' '
        };
        return TMS::Test::Core::AppPermission->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'EntCustomerObj', as class_type('TMS::API::Core::EntCustomer');
coerce 'EntCustomerObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Terms'            => ' ',
            'WhyDontUse'       => ' ',
            'DUNS'             => ' ',
            'DontUse'          => ' ',
            'DOT'              => ' ',
            'CstmrId'          => undef,
            'Bond'             => ' ',
            'MC'               => ' ',
            'Factoring'        => ' ',
            'CreditLimit'      => ' ',
            'SCAC'             => ' ',
            'RequireOriginals' => ' '
        };
        return TMS::Test::Core::EntCustomer->new(%$TheDefault);
    }
    return TMS::API::Core::EntCustomer->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Terms'            => ' ',
            'WhyDontUse'       => ' ',
            'DUNS'             => ' ',
            'DontUse'          => ' ',
            'DOT'              => ' ',
            'CstmrId'          => undef,
            'Bond'             => ' ',
            'MC'               => ' ',
            'Factoring'        => ' ',
            'CreditLimit'      => ' ',
            'SCAC'             => ' ',
            'RequireOriginals' => ' '
        };
        return TMS::Test::Core::EntCustomer->new(%$TheDefault);
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
            'DateUpdated' => ' ',
            'DateCreated' => ' ',
            'RoleId'      => undef,
            'RoleName'    => ' ',
            'CreatedBy'   => ' ',
            'Description' => ' ',
            'UserDefined' => ' '
        };
        return TMS::Test::Core::AppRole->new(%$TheDefault);
    }
    return TMS::API::Core::AppRole->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Editable'    => ' ',
            'UpdatedBy'   => ' ',
            'DateUpdated' => ' ',
            'DateCreated' => ' ',
            'RoleId'      => undef,
            'RoleName'    => ' ',
            'CreatedBy'   => ' ',
            'Description' => ' ',
            'UserDefined' => ' '
        };
        return TMS::Test::Core::AppRole->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'InvSupportVendorObj', as class_type('TMS::API::Core::InvSupportVendor');
coerce 'InvSupportVendorObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'VendorId'       => ' ',
            'PrimaryContact' => ' ',
            'Name'           => ' ',
            'SupportId'      => undef,
            'Description'    => ' '
        };
        return TMS::Test::Core::InvSupportVendor->new(%$TheDefault);
    }
    return TMS::API::Core::InvSupportVendor->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'VendorId'       => ' ',
            'PrimaryContact' => ' ',
            'Name'           => ' ',
            'SupportId'      => undef,
            'Description'    => ' '
        };
        return TMS::Test::Core::InvSupportVendor->new(%$TheDefault);
    }
    return $_;
};

# ............................................................................
subtype 'HrGovidcardObj', as class_type('TMS::API::Core::HrGovidcard');
coerce 'HrGovidcardObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Photo'           => ' ',
            'CardDateExpired' => ' ',
            'CardId'          => undef,
            'AddedBy'         => ' ',
            'CardSate'        => ' ',
            'AstId'           => ' ',
            'CardDateValid'   => ' ',
            'CardNumber'      => ' ',
            'CardType'        => ' '
        };
        return TMS::Test::Core::HrGovidcard->new(%$TheDefault);
    }
    return TMS::API::Core::HrGovidcard->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'Photo'           => ' ',
            'CardDateExpired' => ' ',
            'CardId'          => undef,
            'AddedBy'         => ' ',
            'CardSate'        => ' ',
            'AstId'           => ' ',
            'CardDateValid'   => ' ',
            'CardNumber'      => ' ',
            'CardType'        => ' '
        };
        return TMS::Test::Core::HrGovidcard->new(%$TheDefault);
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
subtype 'InsPolicyObj', as class_type('TMS::API::Core::InsPolicy');
coerce 'InsPolicyObj', from 'HashRef', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'ProofOfInsurance'  => ' ',
            'WhatIsInsured'     => ' ',
            'DownpaymentAmount' => ' ',
            'EffectiveDate'     => ' ',
            'PaidBy'            => ' ',
            'InsId'             => undef,
            'InsuredAmount'     => ' ',
            'ProviderAgent'     => ' ',
            'TagName'           => ' ',
            'ExpirationDate'    => ' ',
            'PolicyNumber'      => ' '
        };
        return TMS::Test::Core::InsPolicy->new(%$TheDefault);
    }
    return TMS::API::Core::InsPolicy->new(%{$_});
}, from 'Str', via {
    if ($AUTO_GENERATE) {
        my $TheDefault = {
            'ProofOfInsurance'  => ' ',
            'WhatIsInsured'     => ' ',
            'DownpaymentAmount' => ' ',
            'EffectiveDate'     => ' ',
            'PaidBy'            => ' ',
            'InsId'             => undef,
            'InsuredAmount'     => ' ',
            'ProviderAgent'     => ' ',
            'TagName'           => ' ',
            'ExpirationDate'    => ' ',
            'PolicyNumber'      => ' '
        };
        return TMS::Test::Core::InsPolicy->new(%$TheDefault);
    }
    return $_;
};

1;

