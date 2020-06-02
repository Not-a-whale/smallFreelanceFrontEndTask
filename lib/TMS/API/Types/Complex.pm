package TMS::API::Types::Complex;

use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use namespace::autoclean;
use Devel::Confess;
use Data::Dumper;

use Moose;
use Moose::Util::TypeConstraints;
use TMS::API::Types::Objects;
use TMS::API::Types::Tools;

our $AUTO_GENERATE = 0;
$Data::Dumper::Terse = 1;

sub _auto_ok { $AUTO_GENERATE && (!defined $_[0] || $_[0] !~ /\S+/s) ? 1 : 0 }

sub _build_types {
    my ($class, $input) = @_;
    my $results = [];
    my $trait   = $class . TMS::API::Types::Tools::Chained();
    foreach my $item (@$input) {
        if (ref($item) eq $class) {
            push @$results, $item;
        } elsif (ref($item) eq 'HASH') {
            push @$results, $class->with_traits($trait)->new(%{$item});
        } else {
            confess "Unable to coerce type \"" . ref($item) . "\" as \"$class\" reference";
        }
    }
    return $results;
} ## end sub _build_types

subtype 'ArrayObjAppAccount', as 'ArrayRef[ObjAppAccount]';
coerce 'ArrayObjAppAccount', from 'ArrayRef', via { _build_types('TMS::API::Core::AppAccount', $_) };

subtype 'ArrayObjAppAccountLock', as 'ArrayRef[ObjAppAccountLock]';
coerce 'ArrayObjAppAccountLock', from 'ArrayRef', via { _build_types('TMS::API::Core::AppAccountLock', $_) };

subtype 'ArrayObjAppAccountLogin', as 'ArrayRef[ObjAppAccountLogin]';
coerce 'ArrayObjAppAccountLogin', from 'ArrayRef', via { _build_types('TMS::API::Core::AppAccountLogin', $_) };

subtype 'ArrayObjAppMenuItem', as 'ArrayRef[ObjAppMenuItem]';
coerce 'ArrayObjAppMenuItem', from 'ArrayRef', via { _build_types('TMS::API::Core::AppMenuItem', $_) };

subtype 'ArrayObjAppMenuItemsTree', as 'ArrayRef[ObjAppMenuItemsTree]';
coerce 'ArrayObjAppMenuItemsTree', from 'ArrayRef', via { _build_types('TMS::API::Core::AppMenuItemsTree', $_) };

subtype 'ArrayObjAppRole', as 'ArrayRef[ObjAppRole]';
coerce 'ArrayObjAppRole', from 'ArrayRef', via { _build_types('TMS::API::Core::AppRole', $_) };

subtype 'ArrayObjAppRoleAssigned', as 'ArrayRef[ObjAppRoleAssigned]';
coerce 'ArrayObjAppRoleAssigned', from 'ArrayRef', via { _build_types('TMS::API::Core::AppRoleAssigned', $_) };

subtype 'ArrayObjAppRoleMenus', as 'ArrayRef[ObjAppRoleMenus]';
coerce 'ArrayObjAppRoleMenus', from 'ArrayRef', via { _build_types('TMS::API::Core::AppRoleMenus', $_) };

subtype 'ArrayObjAppRolePermission', as 'ArrayRef[ObjAppRolePermission]';
coerce 'ArrayObjAppRolePermission', from 'ArrayRef', via { _build_types('TMS::API::Core::AppRolePermission', $_) };

subtype 'ArrayObjBizBranch', as 'ArrayRef[ObjBizBranch]';
coerce 'ArrayObjBizBranch', from 'ArrayRef', via { _build_types('TMS::API::Core::BizBranch', $_) };

subtype 'ArrayObjBizCompanyNode', as 'ArrayRef[ObjBizCompanyNode]';
coerce 'ArrayObjBizCompanyNode', from 'ArrayRef', via { _build_types('TMS::API::Core::BizCompanyNode', $_) };

subtype 'ArrayObjBizCompanyTree', as 'ArrayRef[ObjBizCompanyTree]';
coerce 'ArrayObjBizCompanyTree', from 'ArrayRef', via { _build_types('TMS::API::Core::BizCompanyTree', $_) };

subtype 'ArrayObjBrkLoadstatus', as 'ArrayRef[ObjBrkLoadstatus]';
coerce 'ArrayObjBrkLoadstatus', from 'ArrayRef', via { _build_types('TMS::API::Core::BrkLoadstatus', $_) };

subtype 'ArrayObjCmmAssignment', as 'ArrayRef[ObjCmmAssignment]';
coerce 'ArrayObjCmmAssignment', from 'ArrayRef', via { _build_types('TMS::API::Core::CmmAssignment', $_) };

subtype 'ArrayObjCmmAssignmentsCustomer', as 'ArrayRef[ObjCmmAssignmentsCustomer]';
coerce 'ArrayObjCmmAssignmentsCustomer', from 'ArrayRef', via { _build_types('TMS::API::Core::CmmAssignmentsCustomer', $_) };

subtype 'ArrayObjCmmAssignmentsGroup', as 'ArrayRef[ObjCmmAssignmentsGroup]';
coerce 'ArrayObjCmmAssignmentsGroup', from 'ArrayRef', via { _build_types('TMS::API::Core::CmmAssignmentsGroup', $_) };

subtype 'ArrayObjCmmPackageTier', as 'ArrayRef[ObjCmmPackageTier]';
coerce 'ArrayObjCmmPackageTier', from 'ArrayRef', via { _build_types('TMS::API::Core::CmmPackageTier', $_) };

subtype 'ArrayObjCrrIfta', as 'ArrayRef[ObjCrrIfta]';
coerce 'ArrayObjCrrIfta', from 'ArrayRef', via { _build_types('TMS::API::Core::CrrIfta', $_) };

subtype 'ArrayObjCrrIftaDecal', as 'ArrayRef[ObjCrrIftaDecal]';
coerce 'ArrayObjCrrIftaDecal', from 'ArrayRef', via { _build_types('TMS::API::Core::CrrIftaDecal', $_) };

subtype 'ArrayObjCrrPermitAccount', as 'ArrayRef[ObjCrrPermitAccount]';
coerce 'ArrayObjCrrPermitAccount', from 'ArrayRef', via { _build_types('TMS::API::Core::CrrPermitAccount', $_) };

subtype 'ArrayObjCrrPermitAccountDoc', as 'ArrayRef[ObjCrrPermitAccountDoc]';
coerce 'ArrayObjCrrPermitAccountDoc', from 'ArrayRef', via { _build_types('TMS::API::Core::CrrPermitAccountDoc', $_) };

subtype 'ArrayObjCrrPermitImage', as 'ArrayRef[ObjCrrPermitImage]';
coerce 'ArrayObjCrrPermitImage', from 'ArrayRef', via { _build_types('TMS::API::Core::CrrPermitImage', $_) };

subtype 'ArrayObjCrrStatePermit', as 'ArrayRef[ObjCrrStatePermit]';
coerce 'ArrayObjCrrStatePermit', from 'ArrayRef', via { _build_types('TMS::API::Core::CrrStatePermit', $_) };

subtype 'ArrayObjCrrStatistic', as 'ArrayRef[ObjCrrStatistic]';
coerce 'ArrayObjCrrStatistic', from 'ArrayRef', via { _build_types('TMS::API::Core::CrrStatistic', $_) };

subtype 'ArrayObjDrvDriverlicence', as 'ArrayRef[ObjDrvDriverlicence]';
coerce 'ArrayObjDrvDriverlicence', from 'ArrayRef', via { _build_types('TMS::API::Core::DrvDriverlicence', $_) };

subtype 'ArrayObjDrvMedcard', as 'ArrayRef[ObjDrvMedcard]';
coerce 'ArrayObjDrvMedcard', from 'ArrayRef', via { _build_types('TMS::API::Core::DrvMedcard', $_) };

subtype 'ArrayObjDrvSchedule', as 'ArrayRef[ObjDrvSchedule]';
coerce 'ArrayObjDrvSchedule', from 'ArrayRef', via { _build_types('TMS::API::Core::DrvSchedule', $_) };

subtype 'ArrayObjDspLoad', as 'ArrayRef[ObjDspLoad]';
coerce 'ArrayObjDspLoad', from 'ArrayRef', via { _build_types('TMS::API::Core::DspLoad', $_) };

subtype 'ArrayObjDspLoadDispatched', as 'ArrayRef[ObjDspLoadDispatched]';
coerce 'ArrayObjDspLoadDispatched', from 'ArrayRef', via { _build_types('TMS::API::Core::DspLoadDispatched', $_) };

subtype 'ArrayObjDspLoadsDestination', as 'ArrayRef[ObjDspLoadsDestination]';
coerce 'ArrayObjDspLoadsDestination', from 'ArrayRef', via { _build_types('TMS::API::Core::DspLoadsDestination', $_) };

subtype 'ArrayObjDspLoadsDestinationsDoc', as 'ArrayRef[ObjDspLoadsDestinationsDoc]';
coerce 'ArrayObjDspLoadsDestinationsDoc', from 'ArrayRef', via { _build_types('TMS::API::Core::DspLoadsDestinationsDoc', $_) };

subtype 'ArrayObjDspLoadsDoc', as 'ArrayRef[ObjDspLoadsDoc]';
coerce 'ArrayObjDspLoadsDoc', from 'ArrayRef', via { _build_types('TMS::API::Core::DspLoadsDoc', $_) };

subtype 'ArrayObjDspLoadsRequiredEquipment', as 'ArrayRef[ObjDspLoadsRequiredEquipment]';
coerce 'ArrayObjDspLoadsRequiredEquipment', from 'ArrayRef', via { _build_types('TMS::API::Core::DspLoadsRequiredEquipment', $_) };

subtype 'ArrayObjDspLoadsTracking', as 'ArrayRef[ObjDspLoadsTracking]';
coerce 'ArrayObjDspLoadsTracking', from 'ArrayRef', via { _build_types('TMS::API::Core::DspLoadsTracking', $_) };

subtype 'ArrayObjDspTrip', as 'ArrayRef[ObjDspTrip]';
coerce 'ArrayObjDspTrip', from 'ArrayRef', via { _build_types('TMS::API::Core::DspTrip', $_) };

subtype 'ArrayObjDspTripsLoad', as 'ArrayRef[ObjDspTripsLoad]';
coerce 'ArrayObjDspTripsLoad', from 'ArrayRef', via { _build_types('TMS::API::Core::DspTripsLoad', $_) };

subtype 'ArrayObjEntBlacklist', as 'ArrayRef[ObjEntBlacklist]';
coerce 'ArrayObjEntBlacklist', from 'ArrayRef', via { _build_types('TMS::API::Core::EntBlacklist', $_) };

subtype 'ArrayObjEntBusiness', as 'ArrayRef[ObjEntBusiness]';
coerce 'ArrayObjEntBusiness', from 'ArrayRef', via { _build_types('TMS::API::Core::EntBusiness', $_) };

subtype 'ArrayObjEntCarrier', as 'ArrayRef[ObjEntCarrier]';
coerce 'ArrayObjEntCarrier', from 'ArrayRef', via { _build_types('TMS::API::Core::EntCarrier', $_) };

subtype 'ArrayObjEntOwnerOperator', as 'ArrayRef[ObjEntOwnerOperator]';
coerce 'ArrayObjEntOwnerOperator', from 'ArrayRef', via { _build_types('TMS::API::Core::EntOwnerOperator', $_) };

subtype 'ArrayObjEntPerson', as 'ArrayRef[ObjEntPerson]';
coerce 'ArrayObjEntPerson', from 'ArrayRef', via { _build_types('TMS::API::Core::EntPerson', $_) };

subtype 'ArrayObjFinAccount', as 'ArrayRef[ObjFinAccount]';
coerce 'ArrayObjFinAccount', from 'ArrayRef', via { _build_types('TMS::API::Core::FinAccount', $_) };

subtype 'ArrayObjFinAccountType', as 'ArrayRef[ObjFinAccountType]';
coerce 'ArrayObjFinAccountType', from 'ArrayRef', via { _build_types('TMS::API::Core::FinAccountType', $_) };

subtype 'ArrayObjFinAccountTypesTree', as 'ArrayRef[ObjFinAccountTypesTree]';
coerce 'ArrayObjFinAccountTypesTree', from 'ArrayRef', via { _build_types('TMS::API::Core::FinAccountTypesTree', $_) };

subtype 'ArrayObjFinAccountsTree', as 'ArrayRef[ObjFinAccountsTree]';
coerce 'ArrayObjFinAccountsTree', from 'ArrayRef', via { _build_types('TMS::API::Core::FinAccountsTree', $_) };

subtype 'ArrayObjFinBillingBank', as 'ArrayRef[ObjFinBillingBank]';
coerce 'ArrayObjFinBillingBank', from 'ArrayRef', via { _build_types('TMS::API::Core::FinBillingBank', $_) };

subtype 'ArrayObjFinBillingInfo', as 'ArrayRef[ObjFinBillingInfo]';
coerce 'ArrayObjFinBillingInfo', from 'ArrayRef', via { _build_types('TMS::API::Core::FinBillingInfo', $_) };

subtype 'ArrayObjFinBillingRule', as 'ArrayRef[ObjFinBillingRule]';
coerce 'ArrayObjFinBillingRule', from 'ArrayRef', via { _build_types('TMS::API::Core::FinBillingRule', $_) };

subtype 'ArrayObjFinBillingTag', as 'ArrayRef[ObjFinBillingTag]';
coerce 'ArrayObjFinBillingTag', from 'ArrayRef', via { _build_types('TMS::API::Core::FinBillingTag', $_) };

subtype 'ArrayObjFinCheque', as 'ArrayRef[ObjFinCheque]';
coerce 'ArrayObjFinCheque', from 'ArrayRef', via { _build_types('TMS::API::Core::FinCheque', $_) };

subtype 'ArrayObjFinChequesPrint', as 'ArrayRef[ObjFinChequesPrint]';
coerce 'ArrayObjFinChequesPrint', from 'ArrayRef', via { _build_types('TMS::API::Core::FinChequesPrint', $_) };

subtype 'ArrayObjFinInvoice', as 'ArrayRef[ObjFinInvoice]';
coerce 'ArrayObjFinInvoice', from 'ArrayRef', via { _build_types('TMS::API::Core::FinInvoice', $_) };

subtype 'ArrayObjFinInvoicePayment', as 'ArrayRef[ObjFinInvoicePayment]';
coerce 'ArrayObjFinInvoicePayment', from 'ArrayRef', via { _build_types('TMS::API::Core::FinInvoicePayment', $_) };

subtype 'ArrayObjFinInvoicePaymentItem', as 'ArrayRef[ObjFinInvoicePaymentItem]';
coerce 'ArrayObjFinInvoicePaymentItem', from 'ArrayRef', via { _build_types('TMS::API::Core::FinInvoicePaymentItem', $_) };

subtype 'ArrayObjFinInvoicesItem', as 'ArrayRef[ObjFinInvoicesItem]';
coerce 'ArrayObjFinInvoicesItem', from 'ArrayRef', via { _build_types('TMS::API::Core::FinInvoicesItem', $_) };

subtype 'ArrayObjFinItemTemplate', as 'ArrayRef[ObjFinItemTemplate]';
coerce 'ArrayObjFinItemTemplate', from 'ArrayRef', via { _build_types('TMS::API::Core::FinItemTemplate', $_) };

subtype 'ArrayObjFinItemTemplatesTree', as 'ArrayRef[ObjFinItemTemplatesTree]';
coerce 'ArrayObjFinItemTemplatesTree', from 'ArrayRef', via { _build_types('TMS::API::Core::FinItemTemplatesTree', $_) };

subtype 'ArrayObjFinJournalEntry', as 'ArrayRef[ObjFinJournalEntry]';
coerce 'ArrayObjFinJournalEntry', from 'ArrayRef', via { _build_types('TMS::API::Core::FinJournalEntry', $_) };

subtype 'ArrayObjFinScheduledDeduction', as 'ArrayRef[ObjFinScheduledDeduction]';
coerce 'ArrayObjFinScheduledDeduction', from 'ArrayRef', via { _build_types('TMS::API::Core::FinScheduledDeduction', $_) };

subtype 'ArrayObjFinTaxId', as 'ArrayRef[ObjFinTaxId]';
coerce 'ArrayObjFinTaxId', from 'ArrayRef', via { _build_types('TMS::API::Core::FinTaxId', $_) };

subtype 'ArrayObjFinTransaction', as 'ArrayRef[ObjFinTransaction]';
coerce 'ArrayObjFinTransaction', from 'ArrayRef', via { _build_types('TMS::API::Core::FinTransaction', $_) };

subtype 'ArrayObjHrAssociate', as 'ArrayRef[ObjHrAssociate]';
coerce 'ArrayObjHrAssociate', from 'ArrayRef', via { _build_types('TMS::API::Core::HrAssociate', $_) };

subtype 'ArrayObjHrConfidential', as 'ArrayRef[ObjHrConfidential]';
coerce 'ArrayObjHrConfidential', from 'ArrayRef', via { _build_types('TMS::API::Core::HrConfidential', $_) };

subtype 'ArrayObjHrEmrgencyContact', as 'ArrayRef[ObjHrEmrgencyContact]';
coerce 'ArrayObjHrEmrgencyContact', from 'ArrayRef', via { _build_types('TMS::API::Core::HrEmrgencyContact', $_) };

subtype 'ArrayObjHrGovidcard', as 'ArrayRef[ObjHrGovidcard]';
coerce 'ArrayObjHrGovidcard', from 'ArrayRef', via { _build_types('TMS::API::Core::HrGovidcard', $_) };

subtype 'ArrayObjHrHireRecord', as 'ArrayRef[ObjHrHireRecord]';
coerce 'ArrayObjHrHireRecord', from 'ArrayRef', via { _build_types('TMS::API::Core::HrHireRecord', $_) };

subtype 'ArrayObjHrPayrate', as 'ArrayRef[ObjHrPayrate]';
coerce 'ArrayObjHrPayrate', from 'ArrayRef', via { _build_types('TMS::API::Core::HrPayrate', $_) };

subtype 'ArrayObjHrReference', as 'ArrayRef[ObjHrReference]';
coerce 'ArrayObjHrReference', from 'ArrayRef', via { _build_types('TMS::API::Core::HrReference', $_) };

subtype 'ArrayObjHrResidence', as 'ArrayRef[ObjHrResidence]';
coerce 'ArrayObjHrResidence', from 'ArrayRef', via { _build_types('TMS::API::Core::HrResidence', $_) };

subtype 'ArrayObjInsPolicy', as 'ArrayRef[ObjInsPolicy]';
coerce 'ArrayObjInsPolicy', from 'ArrayRef', via { _build_types('TMS::API::Core::InsPolicy', $_) };

subtype 'ArrayObjInsToEntity', as 'ArrayRef[ObjInsToEntity]';
coerce 'ArrayObjInsToEntity', from 'ArrayRef', via { _build_types('TMS::API::Core::InsToEntity', $_) };

subtype 'ArrayObjInsToVehicle', as 'ArrayRef[ObjInsToVehicle]';
coerce 'ArrayObjInsToVehicle', from 'ArrayRef', via { _build_types('TMS::API::Core::InsToVehicle', $_) };

subtype 'ArrayObjInvEquipment', as 'ArrayRef[ObjInvEquipment]';
coerce 'ArrayObjInvEquipment', from 'ArrayRef', via { _build_types('TMS::API::Core::InvEquipment', $_) };

subtype 'ArrayObjInvEquipmentDoc', as 'ArrayRef[ObjInvEquipmentDoc]';
coerce 'ArrayObjInvEquipmentDoc', from 'ArrayRef', via { _build_types('TMS::API::Core::InvEquipmentDoc', $_) };

subtype 'ArrayObjInvEquipmentToSupport', as 'ArrayRef[ObjInvEquipmentToSupport]';
coerce 'ArrayObjInvEquipmentToSupport', from 'ArrayRef', via { _build_types('TMS::API::Core::InvEquipmentToSupport', $_) };

subtype 'ArrayObjInvNote', as 'ArrayRef[ObjInvNote]';
coerce 'ArrayObjInvNote', from 'ArrayRef', via { _build_types('TMS::API::Core::InvNote', $_) };

subtype 'ArrayObjInvSupportVendor', as 'ArrayRef[ObjInvSupportVendor]';
coerce 'ArrayObjInvSupportVendor', from 'ArrayRef', via { _build_types('TMS::API::Core::InvSupportVendor', $_) };

subtype 'ArrayObjInvTrailer', as 'ArrayRef[ObjInvTrailer]';
coerce 'ArrayObjInvTrailer', from 'ArrayRef', via { _build_types('TMS::API::Core::InvTrailer', $_) };

subtype 'ArrayObjInvUnitReservation', as 'ArrayRef[ObjInvUnitReservation]';
coerce 'ArrayObjInvUnitReservation', from 'ArrayRef', via { _build_types('TMS::API::Core::InvUnitReservation', $_) };

subtype 'ArrayObjInvUnitsToEquipment', as 'ArrayRef[ObjInvUnitsToEquipment]';
coerce 'ArrayObjInvUnitsToEquipment', from 'ArrayRef', via { _build_types('TMS::API::Core::InvUnitsToEquipment', $_) };

subtype 'ArrayObjInvVehicle', as 'ArrayRef[ObjInvVehicle]';
coerce 'ArrayObjInvVehicle', from 'ArrayRef', via { _build_types('TMS::API::Core::InvVehicle', $_) };

subtype 'ArrayObjMsgBrkLoadstatus', as 'ArrayRef[ObjMsgBrkLoadstatus]';
coerce 'ArrayObjMsgBrkLoadstatus', from 'ArrayRef', via { _build_types('TMS::API::Core::MsgBrkLoadstatus', $_) };

subtype 'ArrayObjMsgCntAddress', as 'ArrayRef[ObjMsgCntAddress]';
coerce 'ArrayObjMsgCntAddress', from 'ArrayRef', via { _build_types('TMS::API::Core::MsgCntAddress', $_) };

subtype 'ArrayObjMsgCntPhonesfax', as 'ArrayRef[ObjMsgCntPhonesfax]';
coerce 'ArrayObjMsgCntPhonesfax', from 'ArrayRef', via { _build_types('TMS::API::Core::MsgCntPhonesfax', $_) };

subtype 'ArrayObjMsgDrvDesttype', as 'ArrayRef[ObjMsgDrvDesttype]';
coerce 'ArrayObjMsgDrvDesttype', from 'ArrayRef', via { _build_types('TMS::API::Core::MsgDrvDesttype', $_) };

subtype 'ArrayObjMsgDrvSchedule', as 'ArrayRef[ObjMsgDrvSchedule]';
coerce 'ArrayObjMsgDrvSchedule', from 'ArrayRef', via { _build_types('TMS::API::Core::MsgDrvSchedule', $_) };

subtype 'ArrayObjMsgDspLoad', as 'ArrayRef[ObjMsgDspLoad]';
coerce 'ArrayObjMsgDspLoad', from 'ArrayRef', via { _build_types('TMS::API::Core::MsgDspLoad', $_) };

subtype 'ArrayObjMsgDspLoadsDestination', as 'ArrayRef[ObjMsgDspLoadsDestination]';
coerce 'ArrayObjMsgDspLoadsDestination', from 'ArrayRef', via { _build_types('TMS::API::Core::MsgDspLoadsDestination', $_) };

subtype 'ArrayObjMsgDspLoadsTracking', as 'ArrayRef[ObjMsgDspLoadsTracking]';
coerce 'ArrayObjMsgDspLoadsTracking', from 'ArrayRef', via { _build_types('TMS::API::Core::MsgDspLoadsTracking', $_) };

subtype 'ArrayObjMsgDspTrip', as 'ArrayRef[ObjMsgDspTrip]';
coerce 'ArrayObjMsgDspTrip', from 'ArrayRef', via { _build_types('TMS::API::Core::MsgDspTrip', $_) };

subtype 'ArrayObjMsgEntBlacklist', as 'ArrayRef[ObjMsgEntBlacklist]';
coerce 'ArrayObjMsgEntBlacklist', from 'ArrayRef', via { _build_types('TMS::API::Core::MsgEntBlacklist', $_) };

subtype 'ArrayObjMsgEntCarrier', as 'ArrayRef[ObjMsgEntCarrier]';
coerce 'ArrayObjMsgEntCarrier', from 'ArrayRef', via { _build_types('TMS::API::Core::MsgEntCarrier', $_) };

subtype 'ArrayObjMsgEntCustomer', as 'ArrayRef[ObjMsgEntCustomer]';
coerce 'ArrayObjMsgEntCustomer', from 'ArrayRef', via { _build_types('TMS::API::Core::MsgEntCustomer', $_) };

subtype 'ArrayObjMsgEntShipper', as 'ArrayRef[ObjMsgEntShipper]';
coerce 'ArrayObjMsgEntShipper', from 'ArrayRef', via { _build_types('TMS::API::Core::MsgEntShipper', $_) };

subtype 'ArrayObjMsgEntity', as 'ArrayRef[ObjMsgEntity]';
coerce 'ArrayObjMsgEntity', from 'ArrayRef', via { _build_types('TMS::API::Core::MsgEntity', $_) };

subtype 'ArrayObjMsgFinBillingBank', as 'ArrayRef[ObjMsgFinBillingBank]';
coerce 'ArrayObjMsgFinBillingBank', from 'ArrayRef', via { _build_types('TMS::API::Core::MsgFinBillingBank', $_) };

subtype 'ArrayObjMsgFinBillingInfo', as 'ArrayRef[ObjMsgFinBillingInfo]';
coerce 'ArrayObjMsgFinBillingInfo', from 'ArrayRef', via { _build_types('TMS::API::Core::MsgFinBillingInfo', $_) };

subtype 'ArrayObjMsgFinBillingRule', as 'ArrayRef[ObjMsgFinBillingRule]';
coerce 'ArrayObjMsgFinBillingRule', from 'ArrayRef', via { _build_types('TMS::API::Core::MsgFinBillingRule', $_) };

subtype 'ArrayObjMsgFinInvoice', as 'ArrayRef[ObjMsgFinInvoice]';
coerce 'ArrayObjMsgFinInvoice', from 'ArrayRef', via { _build_types('TMS::API::Core::MsgFinInvoice', $_) };

subtype 'ArrayObjMsgFinInvoicesItem', as 'ArrayRef[ObjMsgFinInvoicesItem]';
coerce 'ArrayObjMsgFinInvoicesItem', from 'ArrayRef', via { _build_types('TMS::API::Core::MsgFinInvoicesItem', $_) };

subtype 'ArrayObjMsgFinItemTemplate', as 'ArrayRef[ObjMsgFinItemTemplate]';
coerce 'ArrayObjMsgFinItemTemplate', from 'ArrayRef', via { _build_types('TMS::API::Core::MsgFinItemTemplate', $_) };

subtype 'ArrayObjMsgFinItemTemplatesType', as 'ArrayRef[ObjMsgFinItemTemplatesType]';
coerce 'ArrayObjMsgFinItemTemplatesType', from 'ArrayRef', via { _build_types('TMS::API::Core::MsgFinItemTemplatesType', $_) };

subtype 'ArrayObjMsgFinScheduledDeduction', as 'ArrayRef[ObjMsgFinScheduledDeduction]';
coerce 'ArrayObjMsgFinScheduledDeduction', from 'ArrayRef', via { _build_types('TMS::API::Core::MsgFinScheduledDeduction', $_) };

subtype 'ArrayObjMsgFinTaxId', as 'ArrayRef[ObjMsgFinTaxId]';
coerce 'ArrayObjMsgFinTaxId', from 'ArrayRef', via { _build_types('TMS::API::Core::MsgFinTaxId', $_) };

subtype 'ArrayObjMsgFinTransaction', as 'ArrayRef[ObjMsgFinTransaction]';
coerce 'ArrayObjMsgFinTransaction', from 'ArrayRef', via { _build_types('TMS::API::Core::MsgFinTransaction', $_) };

subtype 'ArrayObjMsgGenFile', as 'ArrayRef[ObjMsgGenFile]';
coerce 'ArrayObjMsgGenFile', from 'ArrayRef', via { _build_types('TMS::API::Core::MsgGenFile', $_) };

subtype 'ArrayObjMsgHrAssociate', as 'ArrayRef[ObjMsgHrAssociate]';
coerce 'ArrayObjMsgHrAssociate', from 'ArrayRef', via { _build_types('TMS::API::Core::MsgHrAssociate', $_) };

subtype 'ArrayObjMsgHrEmrgencyContact', as 'ArrayRef[ObjMsgHrEmrgencyContact]';
coerce 'ArrayObjMsgHrEmrgencyContact', from 'ArrayRef', via { _build_types('TMS::API::Core::MsgHrEmrgencyContact', $_) };

subtype 'ArrayObjMsgHrReference', as 'ArrayRef[ObjMsgHrReference]';
coerce 'ArrayObjMsgHrReference', from 'ArrayRef', via { _build_types('TMS::API::Core::MsgHrReference', $_) };

subtype 'ArrayObjMsgInsToEntity', as 'ArrayRef[ObjMsgInsToEntity]';
coerce 'ArrayObjMsgInsToEntity', from 'ArrayRef', via { _build_types('TMS::API::Core::MsgInsToEntity', $_) };

subtype 'ArrayObjMsgInsToVehicle', as 'ArrayRef[ObjMsgInsToVehicle]';
coerce 'ArrayObjMsgInsToVehicle', from 'ArrayRef', via { _build_types('TMS::API::Core::MsgInsToVehicle', $_) };

subtype 'ArrayObjMsgInvNote', as 'ArrayRef[ObjMsgInvNote]';
coerce 'ArrayObjMsgInvNote', from 'ArrayRef', via { _build_types('TMS::API::Core::MsgInvNote', $_) };

subtype 'ArrayObjMsgInvRole', as 'ArrayRef[ObjMsgInvRole]';
coerce 'ArrayObjMsgInvRole', from 'ArrayRef', via { _build_types('TMS::API::Core::MsgInvRole', $_) };

subtype 'ArrayObjMsgInvSupportVendor', as 'ArrayRef[ObjMsgInvSupportVendor]';
coerce 'ArrayObjMsgInvSupportVendor', from 'ArrayRef', via { _build_types('TMS::API::Core::MsgInvSupportVendor', $_) };

subtype 'ArrayObjMsgInvUnitsToEquipment', as 'ArrayRef[ObjMsgInvUnitsToEquipment]';
coerce 'ArrayObjMsgInvUnitsToEquipment', from 'ArrayRef', via { _build_types('TMS::API::Core::MsgInvUnitsToEquipment', $_) };

subtype 'ArrayObjMsgNote', as 'ArrayRef[ObjMsgNote]';
coerce 'ArrayObjMsgNote', from 'ArrayRef', via { _build_types('TMS::API::Core::MsgNote', $_) };

subtype 'ArrayObjMsgSftLogbook', as 'ArrayRef[ObjMsgSftLogbook]';
coerce 'ArrayObjMsgSftLogbook', from 'ArrayRef', via { _build_types('TMS::API::Core::MsgSftLogbook', $_) };

subtype 'ArrayObjMsgSftVehicleInspectItem', as 'ArrayRef[ObjMsgSftVehicleInspectItem]';
coerce 'ArrayObjMsgSftVehicleInspectItem', from 'ArrayRef', via { _build_types('TMS::API::Core::MsgSftVehicleInspectItem', $_) };

subtype 'ArrayObjMsgSftVehicleInspectProof', as 'ArrayRef[ObjMsgSftVehicleInspectProof]';
coerce 'ArrayObjMsgSftVehicleInspectProof', from 'ArrayRef', via { _build_types('TMS::API::Core::MsgSftVehicleInspectProof', $_) };

subtype 'ArrayObjMsgSftVehicleInspection', as 'ArrayRef[ObjMsgSftVehicleInspection]';
coerce 'ArrayObjMsgSftVehicleInspection', from 'ArrayRef', via { _build_types('TMS::API::Core::MsgSftVehicleInspection', $_) };

subtype 'ArrayObjSftElogStat', as 'ArrayRef[ObjSftElogStat]';
coerce 'ArrayObjSftElogStat', from 'ArrayRef', via { _build_types('TMS::API::Core::SftElogStat', $_) };

subtype 'ArrayObjSftInspectionSchedule', as 'ArrayRef[ObjSftInspectionSchedule]';
coerce 'ArrayObjSftInspectionSchedule', from 'ArrayRef', via { _build_types('TMS::API::Core::SftInspectionSchedule', $_) };

subtype 'ArrayObjSftLogEntry', as 'ArrayRef[ObjSftLogEntry]';
coerce 'ArrayObjSftLogEntry', from 'ArrayRef', via { _build_types('TMS::API::Core::SftLogEntry', $_) };

subtype 'ArrayObjSftLogbook', as 'ArrayRef[ObjSftLogbook]';
coerce 'ArrayObjSftLogbook', from 'ArrayRef', via { _build_types('TMS::API::Core::SftLogbook', $_) };

subtype 'ArrayObjSftVehicleInspectProof', as 'ArrayRef[ObjSftVehicleInspectProof]';
coerce 'ArrayObjSftVehicleInspectProof', from 'ArrayRef', via { _build_types('TMS::API::Core::SftVehicleInspectProof', $_) };

subtype 'ArrayObjSftVehicleInspectedItem', as 'ArrayRef[ObjSftVehicleInspectedItem]';
coerce 'ArrayObjSftVehicleInspectedItem', from 'ArrayRef', via { _build_types('TMS::API::Core::SftVehicleInspectedItem', $_) };

subtype 'ArrayObjSftVehicleInspection', as 'ArrayRef[ObjSftVehicleInspection]';
coerce 'ArrayObjSftVehicleInspection', from 'ArrayRef', via { _build_types('TMS::API::Core::SftVehicleInspection', $_) };

subtype 'ArrayObjSftVehicleRegistration', as 'ArrayRef[ObjSftVehicleRegistration]';
coerce 'ArrayObjSftVehicleRegistration', from 'ArrayRef', via { _build_types('TMS::API::Core::SftVehicleRegistration', $_) };

subtype 'ArrayObjTmpRelationsClsr', as 'ArrayRef[ObjTmpRelationsClsr]';
coerce 'ArrayObjTmpRelationsClsr', from 'ArrayRef', via { _build_types('TMS::API::Core::TmpRelationsClsr', $_) };

subtype 'ArrayObjTmpRelationsNode', as 'ArrayRef[ObjTmpRelationsNode]';
coerce 'ArrayObjTmpRelationsNode', from 'ArrayRef', via { _build_types('TMS::API::Core::TmpRelationsNode', $_) };

subtype 'ArrayObjTskActn', as 'ArrayRef[ObjTskActn]';
coerce 'ArrayObjTskActn', from 'ArrayRef', via { _build_types('TMS::API::Core::TskActn', $_) };

subtype 'ArrayObjTskAlrm', as 'ArrayRef[ObjTskAlrm]';
coerce 'ArrayObjTskAlrm', from 'ArrayRef', via { _build_types('TMS::API::Core::TskAlrm', $_) };

subtype 'ArrayObjTskNtfi', as 'ArrayRef[ObjTskNtfi]';
coerce 'ArrayObjTskNtfi', from 'ArrayRef', via { _build_types('TMS::API::Core::TskNtfi', $_) };

subtype 'ArrayObjTskResp', as 'ArrayRef[ObjTskResp]';
coerce 'ArrayObjTskResp', from 'ArrayRef', via { _build_types('TMS::API::Core::TskResp', $_) };

subtype 'ArrayObjTskTask', as 'ArrayRef[ObjTskTask]';
coerce 'ArrayObjTskTask', from 'ArrayRef', via { _build_types('TMS::API::Core::TskTask', $_) };

subtype 'ArrayObjTskTime', as 'ArrayRef[ObjTskTime]';
coerce 'ArrayObjTskTime', from 'ArrayRef', via { _build_types('TMS::API::Core::TskTime', $_) };

subtype 'ArrayObjTskTree', as 'ArrayRef[ObjTskTree]';
coerce 'ArrayObjTskTree', from 'ArrayRef', via { _build_types('TMS::API::Core::TskTree', $_) };

1;
