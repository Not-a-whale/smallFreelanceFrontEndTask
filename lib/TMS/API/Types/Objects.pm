package TMS::API::Types::Objects;

use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use namespace::autoclean;
use Devel::Confess;
use Data::Dumper;

use Moose;
use Moose::Util::TypeConstraints;
use TMS::API::Types::Tools;

our $AUTO_GENERATE = 0;
$Data::Dumper::Terse = 1;

sub _auto_ok { $AUTO_GENERATE && (!defined $_[0] || $_[0] !~ /\S+/s) ? 1 : 0 }

sub _build_type {
    my ($class, $input) = @_;
    my $trait = $class . TMS::API::Types::Tools::Chained();
    return $class->with_traits($trait)->new(%$input);
}

subtype 'ObjAppAccount', as class_type('TMS::API::Core::AppAccount');
coerce 'ObjAppAccount', from 'HashRef', via { _build_type('TMS::API::Core::AppAccount', $_) };

subtype 'ObjAppAccountLock', as class_type('TMS::API::Core::AppAccountLock');
coerce 'ObjAppAccountLock', from 'HashRef', via { _build_type('TMS::API::Core::AppAccountLock', $_) };

subtype 'ObjAppAccountLogin', as class_type('TMS::API::Core::AppAccountLogin');
coerce 'ObjAppAccountLogin', from 'HashRef', via { _build_type('TMS::API::Core::AppAccountLogin', $_) };

subtype 'ObjAppFeature', as class_type('TMS::API::Core::AppFeature');
coerce 'ObjAppFeature', from 'HashRef', via { _build_type('TMS::API::Core::AppFeature', $_) };

subtype 'ObjAppMenuItem', as class_type('TMS::API::Core::AppMenuItem');
coerce 'ObjAppMenuItem', from 'HashRef', via { _build_type('TMS::API::Core::AppMenuItem', $_) };

subtype 'ObjAppMenuItemsTree', as class_type('TMS::API::Core::AppMenuItemsTree');
coerce 'ObjAppMenuItemsTree', from 'HashRef', via { _build_type('TMS::API::Core::AppMenuItemsTree', $_) };

subtype 'ObjAppRole', as class_type('TMS::API::Core::AppRole');
coerce 'ObjAppRole', from 'HashRef', via { _build_type('TMS::API::Core::AppRole', $_) };

subtype 'ObjAppRoleAssigned', as class_type('TMS::API::Core::AppRoleAssigned');
coerce 'ObjAppRoleAssigned', from 'HashRef', via { _build_type('TMS::API::Core::AppRoleAssigned', $_) };

subtype 'ObjAppRoleMenus', as class_type('TMS::API::Core::AppRoleMenus');
coerce 'ObjAppRoleMenus', from 'HashRef', via { _build_type('TMS::API::Core::AppRoleMenus', $_) };

subtype 'ObjAppRolePermission', as class_type('TMS::API::Core::AppRolePermission');
coerce 'ObjAppRolePermission', from 'HashRef', via { _build_type('TMS::API::Core::AppRolePermission', $_) };

subtype 'ObjBizBranch', as class_type('TMS::API::Core::BizBranch');
coerce 'ObjBizBranch', from 'HashRef', via { _build_type('TMS::API::Core::BizBranch', $_) };

subtype 'ObjBizCompanyNode', as class_type('TMS::API::Core::BizCompanyNode');
coerce 'ObjBizCompanyNode', from 'HashRef', via { _build_type('TMS::API::Core::BizCompanyNode', $_) };

subtype 'ObjBizCompanyTree', as class_type('TMS::API::Core::BizCompanyTree');
coerce 'ObjBizCompanyTree', from 'HashRef', via { _build_type('TMS::API::Core::BizCompanyTree', $_) };

subtype 'ObjBrkLoadstatus', as class_type('TMS::API::Core::BrkLoadstatus');
coerce 'ObjBrkLoadstatus', from 'HashRef', via { _build_type('TMS::API::Core::BrkLoadstatus', $_) };

subtype 'ObjBrkStatuslist', as class_type('TMS::API::Core::BrkStatuslist');
coerce 'ObjBrkStatuslist', from 'HashRef', via { _build_type('TMS::API::Core::BrkStatuslist', $_) };

subtype 'ObjCmmAssignment', as class_type('TMS::API::Core::CmmAssignment');
coerce 'ObjCmmAssignment', from 'HashRef', via { _build_type('TMS::API::Core::CmmAssignment', $_) };

subtype 'ObjCmmAssignmentsCustomer', as class_type('TMS::API::Core::CmmAssignmentsCustomer');
coerce 'ObjCmmAssignmentsCustomer', from 'HashRef', via { _build_type('TMS::API::Core::CmmAssignmentsCustomer', $_) };

subtype 'ObjCmmAssignmentsGroup', as class_type('TMS::API::Core::CmmAssignmentsGroup');
coerce 'ObjCmmAssignmentsGroup', from 'HashRef', via { _build_type('TMS::API::Core::CmmAssignmentsGroup', $_) };

subtype 'ObjCmmPackage', as class_type('TMS::API::Core::CmmPackage');
coerce 'ObjCmmPackage', from 'HashRef', via { _build_type('TMS::API::Core::CmmPackage', $_) };

subtype 'ObjCmmPackageTier', as class_type('TMS::API::Core::CmmPackageTier');
coerce 'ObjCmmPackageTier', from 'HashRef', via { _build_type('TMS::API::Core::CmmPackageTier', $_) };

subtype 'ObjCntAddress', as class_type('TMS::API::Core::CntAddress');
coerce 'ObjCntAddress', from 'HashRef', via { _build_type('TMS::API::Core::CntAddress', $_) };

subtype 'ObjCntPhonesfax', as class_type('TMS::API::Core::CntPhonesfax');
coerce 'ObjCntPhonesfax', from 'HashRef', via { _build_type('TMS::API::Core::CntPhonesfax', $_) };

subtype 'ObjCrrIfta', as class_type('TMS::API::Core::CrrIfta');
coerce 'ObjCrrIfta', from 'HashRef', via { _build_type('TMS::API::Core::CrrIfta', $_) };

subtype 'ObjCrrIftaDecal', as class_type('TMS::API::Core::CrrIftaDecal');
coerce 'ObjCrrIftaDecal', from 'HashRef', via { _build_type('TMS::API::Core::CrrIftaDecal', $_) };

subtype 'ObjCrrPermitAccount', as class_type('TMS::API::Core::CrrPermitAccount');
coerce 'ObjCrrPermitAccount', from 'HashRef', via { _build_type('TMS::API::Core::CrrPermitAccount', $_) };

subtype 'ObjCrrPermitAccountDoc', as class_type('TMS::API::Core::CrrPermitAccountDoc');
coerce 'ObjCrrPermitAccountDoc', from 'HashRef', via { _build_type('TMS::API::Core::CrrPermitAccountDoc', $_) };

subtype 'ObjCrrPermitImage', as class_type('TMS::API::Core::CrrPermitImage');
coerce 'ObjCrrPermitImage', from 'HashRef', via { _build_type('TMS::API::Core::CrrPermitImage', $_) };

subtype 'ObjCrrStatePermit', as class_type('TMS::API::Core::CrrStatePermit');
coerce 'ObjCrrStatePermit', from 'HashRef', via { _build_type('TMS::API::Core::CrrStatePermit', $_) };

subtype 'ObjCrrStatistic', as class_type('TMS::API::Core::CrrStatistic');
coerce 'ObjCrrStatistic', from 'HashRef', via { _build_type('TMS::API::Core::CrrStatistic', $_) };

subtype 'ObjDrvCdlEndorsement', as class_type('TMS::API::Core::DrvCdlEndorsement');
coerce 'ObjDrvCdlEndorsement', from 'HashRef', via { _build_type('TMS::API::Core::DrvCdlEndorsement', $_) };

subtype 'ObjDrvDesttype', as class_type('TMS::API::Core::DrvDesttype');
coerce 'ObjDrvDesttype', from 'HashRef', via { _build_type('TMS::API::Core::DrvDesttype', $_) };

subtype 'ObjDrvDriver', as class_type('TMS::API::Core::DrvDriver');
coerce 'ObjDrvDriver', from 'HashRef', via { _build_type('TMS::API::Core::DrvDriver', $_) };

subtype 'ObjDrvDriverlicence', as class_type('TMS::API::Core::DrvDriverlicence');
coerce 'ObjDrvDriverlicence', from 'HashRef', via { _build_type('TMS::API::Core::DrvDriverlicence', $_) };

subtype 'ObjDrvMedcard', as class_type('TMS::API::Core::DrvMedcard');
coerce 'ObjDrvMedcard', from 'HashRef', via { _build_type('TMS::API::Core::DrvMedcard', $_) };

subtype 'ObjDrvSchedule', as class_type('TMS::API::Core::DrvSchedule');
coerce 'ObjDrvSchedule', from 'HashRef', via { _build_type('TMS::API::Core::DrvSchedule', $_) };

subtype 'ObjDspLoad', as class_type('TMS::API::Core::DspLoad');
coerce 'ObjDspLoad', from 'HashRef', via { _build_type('TMS::API::Core::DspLoad', $_) };

subtype 'ObjDspLoadDispatched', as class_type('TMS::API::Core::DspLoadDispatched');
coerce 'ObjDspLoadDispatched', from 'HashRef', via { _build_type('TMS::API::Core::DspLoadDispatched', $_) };

subtype 'ObjDspLoadsDestination', as class_type('TMS::API::Core::DspLoadsDestination');
coerce 'ObjDspLoadsDestination', from 'HashRef', via { _build_type('TMS::API::Core::DspLoadsDestination', $_) };

subtype 'ObjDspLoadsDestinationsDoc', as class_type('TMS::API::Core::DspLoadsDestinationsDoc');
coerce 'ObjDspLoadsDestinationsDoc', from 'HashRef', via { _build_type('TMS::API::Core::DspLoadsDestinationsDoc', $_) };

subtype 'ObjDspLoadsDoc', as class_type('TMS::API::Core::DspLoadsDoc');
coerce 'ObjDspLoadsDoc', from 'HashRef', via { _build_type('TMS::API::Core::DspLoadsDoc', $_) };

subtype 'ObjDspLoadsRequiredEquipment', as class_type('TMS::API::Core::DspLoadsRequiredEquipment');
coerce 'ObjDspLoadsRequiredEquipment', from 'HashRef', via { _build_type('TMS::API::Core::DspLoadsRequiredEquipment', $_) };

subtype 'ObjDspLoadsTracking', as class_type('TMS::API::Core::DspLoadsTracking');
coerce 'ObjDspLoadsTracking', from 'HashRef', via { _build_type('TMS::API::Core::DspLoadsTracking', $_) };

subtype 'ObjDspTrip', as class_type('TMS::API::Core::DspTrip');
coerce 'ObjDspTrip', from 'HashRef', via { _build_type('TMS::API::Core::DspTrip', $_) };

subtype 'ObjDspTripsLoad', as class_type('TMS::API::Core::DspTripsLoad');
coerce 'ObjDspTripsLoad', from 'HashRef', via { _build_type('TMS::API::Core::DspTripsLoad', $_) };

subtype 'ObjEntBlacklist', as class_type('TMS::API::Core::EntBlacklist');
coerce 'ObjEntBlacklist', from 'HashRef', via { _build_type('TMS::API::Core::EntBlacklist', $_) };

subtype 'ObjEntBusiness', as class_type('TMS::API::Core::EntBusiness');
coerce 'ObjEntBusiness', from 'HashRef', via { _build_type('TMS::API::Core::EntBusiness', $_) };

subtype 'ObjEntCarrier', as class_type('TMS::API::Core::EntCarrier');
coerce 'ObjEntCarrier', from 'HashRef', via { _build_type('TMS::API::Core::EntCarrier', $_) };

subtype 'ObjEntCustomer', as class_type('TMS::API::Core::EntCustomer');
coerce 'ObjEntCustomer', from 'HashRef', via { _build_type('TMS::API::Core::EntCustomer', $_) };

subtype 'ObjEntOwnerOperator', as class_type('TMS::API::Core::EntOwnerOperator');
coerce 'ObjEntOwnerOperator', from 'HashRef', via { _build_type('TMS::API::Core::EntOwnerOperator', $_) };

subtype 'ObjEntPerson', as class_type('TMS::API::Core::EntPerson');
coerce 'ObjEntPerson', from 'HashRef', via { _build_type('TMS::API::Core::EntPerson', $_) };

subtype 'ObjEntShipper', as class_type('TMS::API::Core::EntShipper');
coerce 'ObjEntShipper', from 'HashRef', via { _build_type('TMS::API::Core::EntShipper', $_) };

subtype 'ObjEntity', as class_type('TMS::API::Core::Entity');
coerce 'ObjEntity', from 'HashRef', via { _build_type('TMS::API::Core::Entity', $_) };

subtype 'ObjFinAccount', as class_type('TMS::API::Core::FinAccount');
coerce 'ObjFinAccount', from 'HashRef', via { _build_type('TMS::API::Core::FinAccount', $_) };

subtype 'ObjFinAccountType', as class_type('TMS::API::Core::FinAccountType');
coerce 'ObjFinAccountType', from 'HashRef', via { _build_type('TMS::API::Core::FinAccountType', $_) };

subtype 'ObjFinAccountTypesTree', as class_type('TMS::API::Core::FinAccountTypesTree');
coerce 'ObjFinAccountTypesTree', from 'HashRef', via { _build_type('TMS::API::Core::FinAccountTypesTree', $_) };

subtype 'ObjFinAccountsTree', as class_type('TMS::API::Core::FinAccountsTree');
coerce 'ObjFinAccountsTree', from 'HashRef', via { _build_type('TMS::API::Core::FinAccountsTree', $_) };

subtype 'ObjFinBillingBank', as class_type('TMS::API::Core::FinBillingBank');
coerce 'ObjFinBillingBank', from 'HashRef', via { _build_type('TMS::API::Core::FinBillingBank', $_) };

subtype 'ObjFinBillingInfo', as class_type('TMS::API::Core::FinBillingInfo');
coerce 'ObjFinBillingInfo', from 'HashRef', via { _build_type('TMS::API::Core::FinBillingInfo', $_) };

subtype 'ObjFinBillingRule', as class_type('TMS::API::Core::FinBillingRule');
coerce 'ObjFinBillingRule', from 'HashRef', via { _build_type('TMS::API::Core::FinBillingRule', $_) };

subtype 'ObjFinBillingTag', as class_type('TMS::API::Core::FinBillingTag');
coerce 'ObjFinBillingTag', from 'HashRef', via { _build_type('TMS::API::Core::FinBillingTag', $_) };

subtype 'ObjFinCheque', as class_type('TMS::API::Core::FinCheque');
coerce 'ObjFinCheque', from 'HashRef', via { _build_type('TMS::API::Core::FinCheque', $_) };

subtype 'ObjFinChequesPrint', as class_type('TMS::API::Core::FinChequesPrint');
coerce 'ObjFinChequesPrint', from 'HashRef', via { _build_type('TMS::API::Core::FinChequesPrint', $_) };

subtype 'ObjFinClass', as class_type('TMS::API::Core::FinClass');
coerce 'ObjFinClass', from 'HashRef', via { _build_type('TMS::API::Core::FinClass', $_) };

subtype 'ObjFinInvoice', as class_type('TMS::API::Core::FinInvoice');
coerce 'ObjFinInvoice', from 'HashRef', via { _build_type('TMS::API::Core::FinInvoice', $_) };

subtype 'ObjFinInvoicePayment', as class_type('TMS::API::Core::FinInvoicePayment');
coerce 'ObjFinInvoicePayment', from 'HashRef', via { _build_type('TMS::API::Core::FinInvoicePayment', $_) };

subtype 'ObjFinInvoicePaymentItem', as class_type('TMS::API::Core::FinInvoicePaymentItem');
coerce 'ObjFinInvoicePaymentItem', from 'HashRef', via { _build_type('TMS::API::Core::FinInvoicePaymentItem', $_) };

subtype 'ObjFinInvoicesItem', as class_type('TMS::API::Core::FinInvoicesItem');
coerce 'ObjFinInvoicesItem', from 'HashRef', via { _build_type('TMS::API::Core::FinInvoicesItem', $_) };

subtype 'ObjFinItemTemplate', as class_type('TMS::API::Core::FinItemTemplate');
coerce 'ObjFinItemTemplate', from 'HashRef', via { _build_type('TMS::API::Core::FinItemTemplate', $_) };

subtype 'ObjFinItemTemplatesTree', as class_type('TMS::API::Core::FinItemTemplatesTree');
coerce 'ObjFinItemTemplatesTree', from 'HashRef', via { _build_type('TMS::API::Core::FinItemTemplatesTree', $_) };

subtype 'ObjFinItemTemplatesType', as class_type('TMS::API::Core::FinItemTemplatesType');
coerce 'ObjFinItemTemplatesType', from 'HashRef', via { _build_type('TMS::API::Core::FinItemTemplatesType', $_) };

subtype 'ObjFinJob', as class_type('TMS::API::Core::FinJob');
coerce 'ObjFinJob', from 'HashRef', via { _build_type('TMS::API::Core::FinJob', $_) };

subtype 'ObjFinJournalEntry', as class_type('TMS::API::Core::FinJournalEntry');
coerce 'ObjFinJournalEntry', from 'HashRef', via { _build_type('TMS::API::Core::FinJournalEntry', $_) };

subtype 'ObjFinPaymentMethod', as class_type('TMS::API::Core::FinPaymentMethod');
coerce 'ObjFinPaymentMethod', from 'HashRef', via { _build_type('TMS::API::Core::FinPaymentMethod', $_) };

subtype 'ObjFinPaymentTerm', as class_type('TMS::API::Core::FinPaymentTerm');
coerce 'ObjFinPaymentTerm', from 'HashRef', via { _build_type('TMS::API::Core::FinPaymentTerm', $_) };

subtype 'ObjFinScheduledDeduction', as class_type('TMS::API::Core::FinScheduledDeduction');
coerce 'ObjFinScheduledDeduction', from 'HashRef', via { _build_type('TMS::API::Core::FinScheduledDeduction', $_) };

subtype 'ObjFinTaxId', as class_type('TMS::API::Core::FinTaxId');
coerce 'ObjFinTaxId', from 'HashRef', via { _build_type('TMS::API::Core::FinTaxId', $_) };

subtype 'ObjFinTransaction', as class_type('TMS::API::Core::FinTransaction');
coerce 'ObjFinTransaction', from 'HashRef', via { _build_type('TMS::API::Core::FinTransaction', $_) };

subtype 'ObjFinTransactionType', as class_type('TMS::API::Core::FinTransactionType');
coerce 'ObjFinTransactionType', from 'HashRef', via { _build_type('TMS::API::Core::FinTransactionType', $_) };

subtype 'ObjGenFile', as class_type('TMS::API::Core::GenFile');
coerce 'ObjGenFile', from 'HashRef', via { _build_type('TMS::API::Core::GenFile', $_) };

subtype 'ObjHrAssociate', as class_type('TMS::API::Core::HrAssociate');
coerce 'ObjHrAssociate', from 'HashRef', via { _build_type('TMS::API::Core::HrAssociate', $_) };

subtype 'ObjHrConfidential', as class_type('TMS::API::Core::HrConfidential');
coerce 'ObjHrConfidential', from 'HashRef', via { _build_type('TMS::API::Core::HrConfidential', $_) };

subtype 'ObjHrEmrgencyContact', as class_type('TMS::API::Core::HrEmrgencyContact');
coerce 'ObjHrEmrgencyContact', from 'HashRef', via { _build_type('TMS::API::Core::HrEmrgencyContact', $_) };

subtype 'ObjHrGovidcard', as class_type('TMS::API::Core::HrGovidcard');
coerce 'ObjHrGovidcard', from 'HashRef', via { _build_type('TMS::API::Core::HrGovidcard', $_) };

subtype 'ObjHrHireRecord', as class_type('TMS::API::Core::HrHireRecord');
coerce 'ObjHrHireRecord', from 'HashRef', via { _build_type('TMS::API::Core::HrHireRecord', $_) };

subtype 'ObjHrPayrate', as class_type('TMS::API::Core::HrPayrate');
coerce 'ObjHrPayrate', from 'HashRef', via { _build_type('TMS::API::Core::HrPayrate', $_) };

subtype 'ObjHrReference', as class_type('TMS::API::Core::HrReference');
coerce 'ObjHrReference', from 'HashRef', via { _build_type('TMS::API::Core::HrReference', $_) };

subtype 'ObjHrResidence', as class_type('TMS::API::Core::HrResidence');
coerce 'ObjHrResidence', from 'HashRef', via { _build_type('TMS::API::Core::HrResidence', $_) };

subtype 'ObjInsPolicy', as class_type('TMS::API::Core::InsPolicy');
coerce 'ObjInsPolicy', from 'HashRef', via { _build_type('TMS::API::Core::InsPolicy', $_) };

subtype 'ObjInsToEntity', as class_type('TMS::API::Core::InsToEntity');
coerce 'ObjInsToEntity', from 'HashRef', via { _build_type('TMS::API::Core::InsToEntity', $_) };

subtype 'ObjInsToVehicle', as class_type('TMS::API::Core::InsToVehicle');
coerce 'ObjInsToVehicle', from 'HashRef', via { _build_type('TMS::API::Core::InsToVehicle', $_) };

subtype 'ObjInvElogDevice', as class_type('TMS::API::Core::InvElogDevice');
coerce 'ObjInvElogDevice', from 'HashRef', via { _build_type('TMS::API::Core::InvElogDevice', $_) };

subtype 'ObjInvEquipment', as class_type('TMS::API::Core::InvEquipment');
coerce 'ObjInvEquipment', from 'HashRef', via { _build_type('TMS::API::Core::InvEquipment', $_) };

subtype 'ObjInvEquipmentDoc', as class_type('TMS::API::Core::InvEquipmentDoc');
coerce 'ObjInvEquipmentDoc', from 'HashRef', via { _build_type('TMS::API::Core::InvEquipmentDoc', $_) };

subtype 'ObjInvEquipmentToSupport', as class_type('TMS::API::Core::InvEquipmentToSupport');
coerce 'ObjInvEquipmentToSupport', from 'HashRef', via { _build_type('TMS::API::Core::InvEquipmentToSupport', $_) };

subtype 'ObjInvEquipmentType', as class_type('TMS::API::Core::InvEquipmentType');
coerce 'ObjInvEquipmentType', from 'HashRef', via { _build_type('TMS::API::Core::InvEquipmentType', $_) };

subtype 'ObjInvNote', as class_type('TMS::API::Core::InvNote');
coerce 'ObjInvNote', from 'HashRef', via { _build_type('TMS::API::Core::InvNote', $_) };

subtype 'ObjInvRole', as class_type('TMS::API::Core::InvRole');
coerce 'ObjInvRole', from 'HashRef', via { _build_type('TMS::API::Core::InvRole', $_) };

subtype 'ObjInvSemitruck', as class_type('TMS::API::Core::InvSemitruck');
coerce 'ObjInvSemitruck', from 'HashRef', via { _build_type('TMS::API::Core::InvSemitruck', $_) };

subtype 'ObjInvSprinter', as class_type('TMS::API::Core::InvSprinter');
coerce 'ObjInvSprinter', from 'HashRef', via { _build_type('TMS::API::Core::InvSprinter', $_) };

subtype 'ObjInvSupportVendor', as class_type('TMS::API::Core::InvSupportVendor');
coerce 'ObjInvSupportVendor', from 'HashRef', via { _build_type('TMS::API::Core::InvSupportVendor', $_) };

subtype 'ObjInvTiresize', as class_type('TMS::API::Core::InvTiresize');
coerce 'ObjInvTiresize', from 'HashRef', via { _build_type('TMS::API::Core::InvTiresize', $_) };

subtype 'ObjInvTrailer', as class_type('TMS::API::Core::InvTrailer');
coerce 'ObjInvTrailer', from 'HashRef', via { _build_type('TMS::API::Core::InvTrailer', $_) };

subtype 'ObjInvTrailerType', as class_type('TMS::API::Core::InvTrailerType');
coerce 'ObjInvTrailerType', from 'HashRef', via { _build_type('TMS::API::Core::InvTrailerType', $_) };

subtype 'ObjInvUnit', as class_type('TMS::API::Core::InvUnit');
coerce 'ObjInvUnit', from 'HashRef', via { _build_type('TMS::API::Core::InvUnit', $_) };

subtype 'ObjInvUnitReservation', as class_type('TMS::API::Core::InvUnitReservation');
coerce 'ObjInvUnitReservation', from 'HashRef', via { _build_type('TMS::API::Core::InvUnitReservation', $_) };

subtype 'ObjInvUnitsToEquipment', as class_type('TMS::API::Core::InvUnitsToEquipment');
coerce 'ObjInvUnitsToEquipment', from 'HashRef', via { _build_type('TMS::API::Core::InvUnitsToEquipment', $_) };

subtype 'ObjInvVehicle', as class_type('TMS::API::Core::InvVehicle');
coerce 'ObjInvVehicle', from 'HashRef', via { _build_type('TMS::API::Core::InvVehicle', $_) };

subtype 'ObjMsgAccess', as class_type('TMS::API::Core::MsgAccess');
coerce 'ObjMsgAccess', from 'HashRef', via { _build_type('TMS::API::Core::MsgAccess', $_) };

subtype 'ObjMsgBrkLoadstatus', as class_type('TMS::API::Core::MsgBrkLoadstatus');
coerce 'ObjMsgBrkLoadstatus', from 'HashRef', via { _build_type('TMS::API::Core::MsgBrkLoadstatus', $_) };

subtype 'ObjMsgCntAddress', as class_type('TMS::API::Core::MsgCntAddress');
coerce 'ObjMsgCntAddress', from 'HashRef', via { _build_type('TMS::API::Core::MsgCntAddress', $_) };

subtype 'ObjMsgCntPhonesfax', as class_type('TMS::API::Core::MsgCntPhonesfax');
coerce 'ObjMsgCntPhonesfax', from 'HashRef', via { _build_type('TMS::API::Core::MsgCntPhonesfax', $_) };

subtype 'ObjMsgDrvDesttype', as class_type('TMS::API::Core::MsgDrvDesttype');
coerce 'ObjMsgDrvDesttype', from 'HashRef', via { _build_type('TMS::API::Core::MsgDrvDesttype', $_) };

subtype 'ObjMsgDrvSchedule', as class_type('TMS::API::Core::MsgDrvSchedule');
coerce 'ObjMsgDrvSchedule', from 'HashRef', via { _build_type('TMS::API::Core::MsgDrvSchedule', $_) };

subtype 'ObjMsgDspLoad', as class_type('TMS::API::Core::MsgDspLoad');
coerce 'ObjMsgDspLoad', from 'HashRef', via { _build_type('TMS::API::Core::MsgDspLoad', $_) };

subtype 'ObjMsgDspLoadsDestination', as class_type('TMS::API::Core::MsgDspLoadsDestination');
coerce 'ObjMsgDspLoadsDestination', from 'HashRef', via { _build_type('TMS::API::Core::MsgDspLoadsDestination', $_) };

subtype 'ObjMsgDspLoadsTracking', as class_type('TMS::API::Core::MsgDspLoadsTracking');
coerce 'ObjMsgDspLoadsTracking', from 'HashRef', via { _build_type('TMS::API::Core::MsgDspLoadsTracking', $_) };

subtype 'ObjMsgDspTrip', as class_type('TMS::API::Core::MsgDspTrip');
coerce 'ObjMsgDspTrip', from 'HashRef', via { _build_type('TMS::API::Core::MsgDspTrip', $_) };

subtype 'ObjMsgEntBlacklist', as class_type('TMS::API::Core::MsgEntBlacklist');
coerce 'ObjMsgEntBlacklist', from 'HashRef', via { _build_type('TMS::API::Core::MsgEntBlacklist', $_) };

subtype 'ObjMsgEntCarrier', as class_type('TMS::API::Core::MsgEntCarrier');
coerce 'ObjMsgEntCarrier', from 'HashRef', via { _build_type('TMS::API::Core::MsgEntCarrier', $_) };

subtype 'ObjMsgEntCustomer', as class_type('TMS::API::Core::MsgEntCustomer');
coerce 'ObjMsgEntCustomer', from 'HashRef', via { _build_type('TMS::API::Core::MsgEntCustomer', $_) };

subtype 'ObjMsgEntShipper', as class_type('TMS::API::Core::MsgEntShipper');
coerce 'ObjMsgEntShipper', from 'HashRef', via { _build_type('TMS::API::Core::MsgEntShipper', $_) };

subtype 'ObjMsgEntity', as class_type('TMS::API::Core::MsgEntity');
coerce 'ObjMsgEntity', from 'HashRef', via { _build_type('TMS::API::Core::MsgEntity', $_) };

subtype 'ObjMsgFinBillingBank', as class_type('TMS::API::Core::MsgFinBillingBank');
coerce 'ObjMsgFinBillingBank', from 'HashRef', via { _build_type('TMS::API::Core::MsgFinBillingBank', $_) };

subtype 'ObjMsgFinBillingInfo', as class_type('TMS::API::Core::MsgFinBillingInfo');
coerce 'ObjMsgFinBillingInfo', from 'HashRef', via { _build_type('TMS::API::Core::MsgFinBillingInfo', $_) };

subtype 'ObjMsgFinBillingRule', as class_type('TMS::API::Core::MsgFinBillingRule');
coerce 'ObjMsgFinBillingRule', from 'HashRef', via { _build_type('TMS::API::Core::MsgFinBillingRule', $_) };

subtype 'ObjMsgFinInvoice', as class_type('TMS::API::Core::MsgFinInvoice');
coerce 'ObjMsgFinInvoice', from 'HashRef', via { _build_type('TMS::API::Core::MsgFinInvoice', $_) };

subtype 'ObjMsgFinInvoicesItem', as class_type('TMS::API::Core::MsgFinInvoicesItem');
coerce 'ObjMsgFinInvoicesItem', from 'HashRef', via { _build_type('TMS::API::Core::MsgFinInvoicesItem', $_) };

subtype 'ObjMsgFinItemTemplate', as class_type('TMS::API::Core::MsgFinItemTemplate');
coerce 'ObjMsgFinItemTemplate', from 'HashRef', via { _build_type('TMS::API::Core::MsgFinItemTemplate', $_) };

subtype 'ObjMsgFinItemTemplatesType', as class_type('TMS::API::Core::MsgFinItemTemplatesType');
coerce 'ObjMsgFinItemTemplatesType', from 'HashRef', via { _build_type('TMS::API::Core::MsgFinItemTemplatesType', $_) };

subtype 'ObjMsgFinScheduledDeduction', as class_type('TMS::API::Core::MsgFinScheduledDeduction');
coerce 'ObjMsgFinScheduledDeduction', from 'HashRef', via { _build_type('TMS::API::Core::MsgFinScheduledDeduction', $_) };

subtype 'ObjMsgFinTaxId', as class_type('TMS::API::Core::MsgFinTaxId');
coerce 'ObjMsgFinTaxId', from 'HashRef', via { _build_type('TMS::API::Core::MsgFinTaxId', $_) };

subtype 'ObjMsgFinTransaction', as class_type('TMS::API::Core::MsgFinTransaction');
coerce 'ObjMsgFinTransaction', from 'HashRef', via { _build_type('TMS::API::Core::MsgFinTransaction', $_) };

subtype 'ObjMsgGenFile', as class_type('TMS::API::Core::MsgGenFile');
coerce 'ObjMsgGenFile', from 'HashRef', via { _build_type('TMS::API::Core::MsgGenFile', $_) };

subtype 'ObjMsgHrAssociate', as class_type('TMS::API::Core::MsgHrAssociate');
coerce 'ObjMsgHrAssociate', from 'HashRef', via { _build_type('TMS::API::Core::MsgHrAssociate', $_) };

subtype 'ObjMsgHrEmrgencyContact', as class_type('TMS::API::Core::MsgHrEmrgencyContact');
coerce 'ObjMsgHrEmrgencyContact', from 'HashRef', via { _build_type('TMS::API::Core::MsgHrEmrgencyContact', $_) };

subtype 'ObjMsgHrReference', as class_type('TMS::API::Core::MsgHrReference');
coerce 'ObjMsgHrReference', from 'HashRef', via { _build_type('TMS::API::Core::MsgHrReference', $_) };

subtype 'ObjMsgInsToEntity', as class_type('TMS::API::Core::MsgInsToEntity');
coerce 'ObjMsgInsToEntity', from 'HashRef', via { _build_type('TMS::API::Core::MsgInsToEntity', $_) };

subtype 'ObjMsgInsToVehicle', as class_type('TMS::API::Core::MsgInsToVehicle');
coerce 'ObjMsgInsToVehicle', from 'HashRef', via { _build_type('TMS::API::Core::MsgInsToVehicle', $_) };

subtype 'ObjMsgInvNote', as class_type('TMS::API::Core::MsgInvNote');
coerce 'ObjMsgInvNote', from 'HashRef', via { _build_type('TMS::API::Core::MsgInvNote', $_) };

subtype 'ObjMsgInvRole', as class_type('TMS::API::Core::MsgInvRole');
coerce 'ObjMsgInvRole', from 'HashRef', via { _build_type('TMS::API::Core::MsgInvRole', $_) };

subtype 'ObjMsgInvSupportVendor', as class_type('TMS::API::Core::MsgInvSupportVendor');
coerce 'ObjMsgInvSupportVendor', from 'HashRef', via { _build_type('TMS::API::Core::MsgInvSupportVendor', $_) };

subtype 'ObjMsgInvUnitsToEquipment', as class_type('TMS::API::Core::MsgInvUnitsToEquipment');
coerce 'ObjMsgInvUnitsToEquipment', from 'HashRef', via { _build_type('TMS::API::Core::MsgInvUnitsToEquipment', $_) };

subtype 'ObjMsgNote', as class_type('TMS::API::Core::MsgNote');
coerce 'ObjMsgNote', from 'HashRef', via { _build_type('TMS::API::Core::MsgNote', $_) };

subtype 'ObjMsgSftLogbook', as class_type('TMS::API::Core::MsgSftLogbook');
coerce 'ObjMsgSftLogbook', from 'HashRef', via { _build_type('TMS::API::Core::MsgSftLogbook', $_) };

subtype 'ObjMsgSftVehicleInspectItem', as class_type('TMS::API::Core::MsgSftVehicleInspectItem');
coerce 'ObjMsgSftVehicleInspectItem', from 'HashRef', via { _build_type('TMS::API::Core::MsgSftVehicleInspectItem', $_) };

subtype 'ObjMsgSftVehicleInspectProof', as class_type('TMS::API::Core::MsgSftVehicleInspectProof');
coerce 'ObjMsgSftVehicleInspectProof', from 'HashRef', via { _build_type('TMS::API::Core::MsgSftVehicleInspectProof', $_) };

subtype 'ObjMsgSftVehicleInspection', as class_type('TMS::API::Core::MsgSftVehicleInspection');
coerce 'ObjMsgSftVehicleInspection', from 'HashRef', via { _build_type('TMS::API::Core::MsgSftVehicleInspection', $_) };

subtype 'ObjSftElogStat', as class_type('TMS::API::Core::SftElogStat');
coerce 'ObjSftElogStat', from 'HashRef', via { _build_type('TMS::API::Core::SftElogStat', $_) };

subtype 'ObjSftInspectionSchedule', as class_type('TMS::API::Core::SftInspectionSchedule');
coerce 'ObjSftInspectionSchedule', from 'HashRef', via { _build_type('TMS::API::Core::SftInspectionSchedule', $_) };

subtype 'ObjSftLogEntry', as class_type('TMS::API::Core::SftLogEntry');
coerce 'ObjSftLogEntry', from 'HashRef', via { _build_type('TMS::API::Core::SftLogEntry', $_) };

subtype 'ObjSftLogbook', as class_type('TMS::API::Core::SftLogbook');
coerce 'ObjSftLogbook', from 'HashRef', via { _build_type('TMS::API::Core::SftLogbook', $_) };

subtype 'ObjSftVehicleInspectItem', as class_type('TMS::API::Core::SftVehicleInspectItem');
coerce 'ObjSftVehicleInspectItem', from 'HashRef', via { _build_type('TMS::API::Core::SftVehicleInspectItem', $_) };

subtype 'ObjSftVehicleInspectProof', as class_type('TMS::API::Core::SftVehicleInspectProof');
coerce 'ObjSftVehicleInspectProof', from 'HashRef', via { _build_type('TMS::API::Core::SftVehicleInspectProof', $_) };

subtype 'ObjSftVehicleInspectedItem', as class_type('TMS::API::Core::SftVehicleInspectedItem');
coerce 'ObjSftVehicleInspectedItem', from 'HashRef', via { _build_type('TMS::API::Core::SftVehicleInspectedItem', $_) };

subtype 'ObjSftVehicleInspection', as class_type('TMS::API::Core::SftVehicleInspection');
coerce 'ObjSftVehicleInspection', from 'HashRef', via { _build_type('TMS::API::Core::SftVehicleInspection', $_) };

subtype 'ObjSftVehicleRegistration', as class_type('TMS::API::Core::SftVehicleRegistration');
coerce 'ObjSftVehicleRegistration', from 'HashRef', via { _build_type('TMS::API::Core::SftVehicleRegistration', $_) };

subtype 'ObjTmpRelationsClsr', as class_type('TMS::API::Core::TmpRelationsClsr');
coerce 'ObjTmpRelationsClsr', from 'HashRef', via { _build_type('TMS::API::Core::TmpRelationsClsr', $_) };

subtype 'ObjTmpRelationsNode', as class_type('TMS::API::Core::TmpRelationsNode');
coerce 'ObjTmpRelationsNode', from 'HashRef', via { _build_type('TMS::API::Core::TmpRelationsNode', $_) };

subtype 'ObjTskActn', as class_type('TMS::API::Core::TskActn');
coerce 'ObjTskActn', from 'HashRef', via { _build_type('TMS::API::Core::TskActn', $_) };

subtype 'ObjTskAlrm', as class_type('TMS::API::Core::TskAlrm');
coerce 'ObjTskAlrm', from 'HashRef', via { _build_type('TMS::API::Core::TskAlrm', $_) };

subtype 'ObjTskNtfi', as class_type('TMS::API::Core::TskNtfi');
coerce 'ObjTskNtfi', from 'HashRef', via { _build_type('TMS::API::Core::TskNtfi', $_) };

subtype 'ObjTskResp', as class_type('TMS::API::Core::TskResp');
coerce 'ObjTskResp', from 'HashRef', via { _build_type('TMS::API::Core::TskResp', $_) };

subtype 'ObjTskTask', as class_type('TMS::API::Core::TskTask');
coerce 'ObjTskTask', from 'HashRef', via { _build_type('TMS::API::Core::TskTask', $_) };

subtype 'ObjTskTime', as class_type('TMS::API::Core::TskTime');
coerce 'ObjTskTime', from 'HashRef', via { _build_type('TMS::API::Core::TskTime', $_) };

subtype 'ObjTskTree', as class_type('TMS::API::Core::TskTree');
coerce 'ObjTskTree', from 'HashRef', via { _build_type('TMS::API::Core::TskTree', $_) };

1;
