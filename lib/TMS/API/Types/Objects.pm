package TMS::API::Types::Objects;

use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use Devel::Confess;
use Data::Dumper;
use Date::Manip;

use Moose::Util::TypeConstraints;
# ............................................................................
subtype 'AppPermissionObj',
    as class_type('TMS::API::Core::AppPermission');
coerce 'AppPermissionObj',
    from 'HashRef',
        via { TMS::API::Core::AppPermission->new(%{$_}) };

# ............................................................................
subtype 'AppRoleObj',
    as class_type('TMS::API::Core::AppRole');
coerce 'AppRoleObj',
    from 'HashRef',
        via { TMS::API::Core::AppRole->new(%{$_}) };

# ............................................................................
subtype 'FinTransactionObj',
    as class_type('TMS::API::Core::FinTransaction');
coerce 'FinTransactionObj',
    from 'HashRef',
        via { TMS::API::Core::FinTransaction->new(%{$_}) };

# ............................................................................
subtype 'FinClassObj',
    as class_type('TMS::API::Core::FinClass');
coerce 'FinClassObj',
    from 'HashRef',
        via { TMS::API::Core::FinClass->new(%{$_}) };

# ............................................................................
subtype 'BizCompanyNodeObj',
    as class_type('TMS::API::Core::BizCompanyNode');
coerce 'BizCompanyNodeObj',
    from 'HashRef',
        via { TMS::API::Core::BizCompanyNode->new(%{$_}) };

# ............................................................................
subtype 'FinPaymentTermObj',
    as class_type('TMS::API::Core::FinPaymentTerm');
coerce 'FinPaymentTermObj',
    from 'HashRef',
        via { TMS::API::Core::FinPaymentTerm->new(%{$_}) };

# ............................................................................
subtype 'CmmPackageObj',
    as class_type('TMS::API::Core::CmmPackage');
coerce 'CmmPackageObj',
    from 'HashRef',
        via { TMS::API::Core::CmmPackage->new(%{$_}) };

# ............................................................................
subtype 'TskAlrmObj',
    as class_type('TMS::API::Core::TskAlrm');
coerce 'TskAlrmObj',
    from 'HashRef',
        via { TMS::API::Core::TskAlrm->new(%{$_}) };

# ............................................................................
subtype 'InvSupportVendorObj',
    as class_type('TMS::API::Core::InvSupportVendor');
coerce 'InvSupportVendorObj',
    from 'HashRef',
        via { TMS::API::Core::InvSupportVendor->new(%{$_}) };

# ............................................................................
subtype 'DspTripObj',
    as class_type('TMS::API::Core::DspTrip');
coerce 'DspTripObj',
    from 'HashRef',
        via { TMS::API::Core::DspTrip->new(%{$_}) };

# ............................................................................
subtype 'TskActnObj',
    as class_type('TMS::API::Core::TskActn');
coerce 'TskActnObj',
    from 'HashRef',
        via { TMS::API::Core::TskActn->new(%{$_}) };

# ............................................................................
subtype 'AppMenuActionObj',
    as class_type('TMS::API::Core::AppMenuAction');
coerce 'AppMenuActionObj',
    from 'HashRef',
        via { TMS::API::Core::AppMenuAction->new(%{$_}) };

# ............................................................................
subtype 'FinInvoiceObj',
    as class_type('TMS::API::Core::FinInvoice');
coerce 'FinInvoiceObj',
    from 'HashRef',
        via { TMS::API::Core::FinInvoice->new(%{$_}) };

# ............................................................................
subtype 'TskTaskObj',
    as class_type('TMS::API::Core::TskTask');
coerce 'TskTaskObj',
    from 'HashRef',
        via { TMS::API::Core::TskTask->new(%{$_}) };

# ............................................................................
subtype 'EntPersonObj',
    as class_type('TMS::API::Core::EntPerson');
coerce 'EntPersonObj',
    from 'HashRef',
        via { TMS::API::Core::EntPerson->new(%{$_}) };

# ............................................................................
subtype 'CntAddressObj',
    as class_type('TMS::API::Core::CntAddress');
coerce 'CntAddressObj',
    from 'HashRef',
        via { TMS::API::Core::CntAddress->new(%{$_}) };

# ............................................................................
subtype 'InsPolicyObj',
    as class_type('TMS::API::Core::InsPolicy');
coerce 'InsPolicyObj',
    from 'HashRef',
        via { TMS::API::Core::InsPolicy->new(%{$_}) };

# ............................................................................
subtype 'InvRoleObj',
    as class_type('TMS::API::Core::InvRole');
coerce 'InvRoleObj',
    from 'HashRef',
        via { TMS::API::Core::InvRole->new(%{$_}) };

# ............................................................................
subtype 'InvUnitObj',
    as class_type('TMS::API::Core::InvUnit');
coerce 'InvUnitObj',
    from 'HashRef',
        via { TMS::API::Core::InvUnit->new(%{$_}) };

# ............................................................................
subtype 'AppAccountObj',
    as class_type('TMS::API::Core::AppAccount');
coerce 'AppAccountObj',
    from 'HashRef',
        via { TMS::API::Core::AppAccount->new(%{$_}) };

# ............................................................................
subtype 'CntPhonesfaxObj',
    as class_type('TMS::API::Core::CntPhonesfax');
coerce 'CntPhonesfaxObj',
    from 'HashRef',
        via { TMS::API::Core::CntPhonesfax->new(%{$_}) };

# ............................................................................
subtype 'DrvCdlEndorsementObj',
    as class_type('TMS::API::Core::DrvCdlEndorsement');
coerce 'DrvCdlEndorsementObj',
    from 'HashRef',
        via { TMS::API::Core::DrvCdlEndorsement->new(%{$_}) };

# ............................................................................
subtype 'FinItemTemplateObj',
    as class_type('TMS::API::Core::FinItemTemplate');
coerce 'FinItemTemplateObj',
    from 'HashRef',
        via { TMS::API::Core::FinItemTemplate->new(%{$_}) };

# ............................................................................
subtype 'SftInspectionScheduleObj',
    as class_type('TMS::API::Core::SftInspectionSchedule');
coerce 'SftInspectionScheduleObj',
    from 'HashRef',
        via { TMS::API::Core::SftInspectionSchedule->new(%{$_}) };

# ............................................................................
subtype 'FinChequeObj',
    as class_type('TMS::API::Core::FinCheque');
coerce 'FinChequeObj',
    from 'HashRef',
        via { TMS::API::Core::FinCheque->new(%{$_}) };

# ............................................................................
subtype 'EntShipperObj',
    as class_type('TMS::API::Core::EntShipper');
coerce 'EntShipperObj',
    from 'HashRef',
        via { TMS::API::Core::EntShipper->new(%{$_}) };

# ............................................................................
subtype 'InvVehicleObj',
    as class_type('TMS::API::Core::InvVehicle');
coerce 'InvVehicleObj',
    from 'HashRef',
        via { TMS::API::Core::InvVehicle->new(%{$_}) };

# ............................................................................
subtype 'InvEquipmentObj',
    as class_type('TMS::API::Core::InvEquipment');
coerce 'InvEquipmentObj',
    from 'HashRef',
        via { TMS::API::Core::InvEquipment->new(%{$_}) };

# ............................................................................
subtype 'DrvDesttypeObj',
    as class_type('TMS::API::Core::DrvDesttype');
coerce 'DrvDesttypeObj',
    from 'HashRef',
        via { TMS::API::Core::DrvDesttype->new(%{$_}) };

# ............................................................................
subtype 'SftLogbookObj',
    as class_type('TMS::API::Core::SftLogbook');
coerce 'SftLogbookObj',
    from 'HashRef',
        via { TMS::API::Core::SftLogbook->new(%{$_}) };

# ............................................................................
subtype 'InvTiresizeObj',
    as class_type('TMS::API::Core::InvTiresize');
coerce 'InvTiresizeObj',
    from 'HashRef',
        via { TMS::API::Core::InvTiresize->new(%{$_}) };

# ............................................................................
subtype 'AppFeatureObj',
    as class_type('TMS::API::Core::AppFeature');
coerce 'AppFeatureObj',
    from 'HashRef',
        via { TMS::API::Core::AppFeature->new(%{$_}) };

# ............................................................................
subtype 'FinJournalEntryObj',
    as class_type('TMS::API::Core::FinJournalEntry');
coerce 'FinJournalEntryObj',
    from 'HashRef',
        via { TMS::API::Core::FinJournalEntry->new(%{$_}) };

# ............................................................................
subtype 'CntStateObj',
    as class_type('TMS::API::Core::CntState');
coerce 'CntStateObj',
    from 'HashRef',
        via { TMS::API::Core::CntState->new(%{$_}) };

# ............................................................................
subtype 'EntCarrierObj',
    as class_type('TMS::API::Core::EntCarrier');
coerce 'EntCarrierObj',
    from 'HashRef',
        via { TMS::API::Core::EntCarrier->new(%{$_}) };

# ............................................................................
subtype 'DspLoadsDestinationObj',
    as class_type('TMS::API::Core::DspLoadsDestination');
coerce 'DspLoadsDestinationObj',
    from 'HashRef',
        via { TMS::API::Core::DspLoadsDestination->new(%{$_}) };

# ............................................................................
subtype 'EntityObj',
    as class_type('TMS::API::Core::Entity');
coerce 'EntityObj',
    from 'HashRef',
        via { TMS::API::Core::Entity->new(%{$_}) };

# ............................................................................
subtype 'FinInvoicesItemObj',
    as class_type('TMS::API::Core::FinInvoicesItem');
coerce 'FinInvoicesItemObj',
    from 'HashRef',
        via { TMS::API::Core::FinInvoicesItem->new(%{$_}) };

# ............................................................................
subtype 'FinPaymentMethodObj',
    as class_type('TMS::API::Core::FinPaymentMethod');
coerce 'FinPaymentMethodObj',
    from 'HashRef',
        via { TMS::API::Core::FinPaymentMethod->new(%{$_}) };

# ............................................................................
subtype 'AppMenuItemObj',
    as class_type('TMS::API::Core::AppMenuItem');
coerce 'AppMenuItemObj',
    from 'HashRef',
        via { TMS::API::Core::AppMenuItem->new(%{$_}) };

# ............................................................................
subtype 'FinTransactionTypeObj',
    as class_type('TMS::API::Core::FinTransactionType');
coerce 'FinTransactionTypeObj',
    from 'HashRef',
        via { TMS::API::Core::FinTransactionType->new(%{$_}) };

# ............................................................................
subtype 'GenFileObj',
    as class_type('TMS::API::Core::GenFile');
coerce 'GenFileObj',
    from 'HashRef',
        via { TMS::API::Core::GenFile->new(%{$_}) };

# ............................................................................
subtype 'EntCustomerObj',
    as class_type('TMS::API::Core::EntCustomer');
coerce 'EntCustomerObj',
    from 'HashRef',
        via { TMS::API::Core::EntCustomer->new(%{$_}) };

# ............................................................................
subtype 'FinInvoicePaymentObj',
    as class_type('TMS::API::Core::FinInvoicePayment');
coerce 'FinInvoicePaymentObj',
    from 'HashRef',
        via { TMS::API::Core::FinInvoicePayment->new(%{$_}) };

# ............................................................................
subtype 'EntBusinessObj',
    as class_type('TMS::API::Core::EntBusiness');
coerce 'EntBusinessObj',
    from 'HashRef',
        via { TMS::API::Core::EntBusiness->new(%{$_}) };

# ............................................................................
subtype 'JobObj',
    as class_type('TMS::API::Core::Job');
coerce 'JobObj',
    from 'HashRef',
        via { TMS::API::Core::Job->new(%{$_}) };

# ............................................................................
subtype 'FinAccountTypeObj',
    as class_type('TMS::API::Core::FinAccountType');
coerce 'FinAccountTypeObj',
    from 'HashRef',
        via { TMS::API::Core::FinAccountType->new(%{$_}) };

# ............................................................................
subtype 'DspLoadObj',
    as class_type('TMS::API::Core::DspLoad');
coerce 'DspLoadObj',
    from 'HashRef',
        via { TMS::API::Core::DspLoad->new(%{$_}) };

# ............................................................................
subtype 'TmpRelationsNodeObj',
    as class_type('TMS::API::Core::TmpRelationsNode');
coerce 'TmpRelationsNodeObj',
    from 'HashRef',
        via { TMS::API::Core::TmpRelationsNode->new(%{$_}) };

# ............................................................................
subtype 'FinBillingTagObj',
    as class_type('TMS::API::Core::FinBillingTag');
coerce 'FinBillingTagObj',
    from 'HashRef',
        via { TMS::API::Core::FinBillingTag->new(%{$_}) };

# ............................................................................
subtype 'BizBranchObj',
    as class_type('TMS::API::Core::BizBranch');
coerce 'BizBranchObj',
    from 'HashRef',
        via { TMS::API::Core::BizBranch->new(%{$_}) };

# ............................................................................
subtype 'FinItemTemplatesTypeObj',
    as class_type('TMS::API::Core::FinItemTemplatesType');
coerce 'FinItemTemplatesTypeObj',
    from 'HashRef',
        via { TMS::API::Core::FinItemTemplatesType->new(%{$_}) };

# ............................................................................
subtype 'DrvDriverObj',
    as class_type('TMS::API::Core::DrvDriver');
coerce 'DrvDriverObj',
    from 'HashRef',
        via { TMS::API::Core::DrvDriver->new(%{$_}) };

# ............................................................................
subtype 'HrAssociateObj',
    as class_type('TMS::API::Core::HrAssociate');
coerce 'HrAssociateObj',
    from 'HashRef',
        via { TMS::API::Core::HrAssociate->new(%{$_}) };

# ............................................................................
subtype 'FinAccountObj',
    as class_type('TMS::API::Core::FinAccount');
coerce 'FinAccountObj',
    from 'HashRef',
        via { TMS::API::Core::FinAccount->new(%{$_}) };

# ............................................................................
subtype 'InvTrailerTypeObj',
    as class_type('TMS::API::Core::InvTrailerType');
coerce 'InvTrailerTypeObj',
    from 'HashRef',
        via { TMS::API::Core::InvTrailerType->new(%{$_}) };

1;
