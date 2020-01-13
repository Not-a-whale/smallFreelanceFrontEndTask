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

subtype 'ObjAppFeature', as class_type('TMS::API::Core::AppFeature');
coerce 'ObjAppFeature', from 'HashRef', via { _build_type('TMS::API::Core::AppFeature', $_) };

subtype 'ObjAppMenuItem', as class_type('TMS::API::Core::AppMenuItem');
coerce 'ObjAppMenuItem', from 'HashRef', via { _build_type('TMS::API::Core::AppMenuItem', $_) };

subtype 'ObjAppPermission', as class_type('TMS::API::Core::AppPermission');
coerce 'ObjAppPermission', from 'HashRef', via { _build_type('TMS::API::Core::AppPermission', $_) };

subtype 'ObjAppRole', as class_type('TMS::API::Core::AppRole');
coerce 'ObjAppRole', from 'HashRef', via { _build_type('TMS::API::Core::AppRole', $_) };

subtype 'ObjBizBranch', as class_type('TMS::API::Core::BizBranch');
coerce 'ObjBizBranch', from 'HashRef', via { _build_type('TMS::API::Core::BizBranch', $_) };

subtype 'ObjBizCompanyNode', as class_type('TMS::API::Core::BizCompanyNode');
coerce 'ObjBizCompanyNode', from 'HashRef', via { _build_type('TMS::API::Core::BizCompanyNode', $_) };

subtype 'ObjCmmPackage', as class_type('TMS::API::Core::CmmPackage');
coerce 'ObjCmmPackage', from 'HashRef', via { _build_type('TMS::API::Core::CmmPackage', $_) };

subtype 'ObjCntAddress', as class_type('TMS::API::Core::CntAddress');
coerce 'ObjCntAddress', from 'HashRef', via { _build_type('TMS::API::Core::CntAddress', $_) };

subtype 'ObjCntPhonesfax', as class_type('TMS::API::Core::CntPhonesfax');
coerce 'ObjCntPhonesfax', from 'HashRef', via { _build_type('TMS::API::Core::CntPhonesfax', $_) };

subtype 'ObjCrrIfta', as class_type('TMS::API::Core::CrrIfta');
coerce 'ObjCrrIfta', from 'HashRef', via { _build_type('TMS::API::Core::CrrIfta', $_) };

subtype 'ObjCrrPermitAccount', as class_type('TMS::API::Core::CrrPermitAccount');
coerce 'ObjCrrPermitAccount', from 'HashRef', via { _build_type('TMS::API::Core::CrrPermitAccount', $_) };

subtype 'ObjCrrStatePermit', as class_type('TMS::API::Core::CrrStatePermit');
coerce 'ObjCrrStatePermit', from 'HashRef', via { _build_type('TMS::API::Core::CrrStatePermit', $_) };

subtype 'ObjDrvCdlEndorsement', as class_type('TMS::API::Core::DrvCdlEndorsement');
coerce 'ObjDrvCdlEndorsement', from 'HashRef', via { _build_type('TMS::API::Core::DrvCdlEndorsement', $_) };

subtype 'ObjDrvDesttype', as class_type('TMS::API::Core::DrvDesttype');
coerce 'ObjDrvDesttype', from 'HashRef', via { _build_type('TMS::API::Core::DrvDesttype', $_) };

subtype 'ObjDrvDriver', as class_type('TMS::API::Core::DrvDriver');
coerce 'ObjDrvDriver', from 'HashRef', via { _build_type('TMS::API::Core::DrvDriver', $_) };

subtype 'ObjDspLoad', as class_type('TMS::API::Core::DspLoad');
coerce 'ObjDspLoad', from 'HashRef', via { _build_type('TMS::API::Core::DspLoad', $_) };

subtype 'ObjDspLoadsDestination', as class_type('TMS::API::Core::DspLoadsDestination');
coerce 'ObjDspLoadsDestination', from 'HashRef', via { _build_type('TMS::API::Core::DspLoadsDestination', $_) };

subtype 'ObjDspLoadsTracking', as class_type('TMS::API::Core::DspLoadsTracking');
coerce 'ObjDspLoadsTracking', from 'HashRef', via { _build_type('TMS::API::Core::DspLoadsTracking', $_) };

subtype 'ObjDspTrip', as class_type('TMS::API::Core::DspTrip');
coerce 'ObjDspTrip', from 'HashRef', via { _build_type('TMS::API::Core::DspTrip', $_) };

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

subtype 'ObjFinBillingBank', as class_type('TMS::API::Core::FinBillingBank');
coerce 'ObjFinBillingBank', from 'HashRef', via { _build_type('TMS::API::Core::FinBillingBank', $_) };

subtype 'ObjFinBillingInfo', as class_type('TMS::API::Core::FinBillingInfo');
coerce 'ObjFinBillingInfo', from 'HashRef', via { _build_type('TMS::API::Core::FinBillingInfo', $_) };

subtype 'ObjFinBillingTag', as class_type('TMS::API::Core::FinBillingTag');
coerce 'ObjFinBillingTag', from 'HashRef', via { _build_type('TMS::API::Core::FinBillingTag', $_) };

subtype 'ObjFinCheque', as class_type('TMS::API::Core::FinCheque');
coerce 'ObjFinCheque', from 'HashRef', via { _build_type('TMS::API::Core::FinCheque', $_) };

subtype 'ObjFinClass', as class_type('TMS::API::Core::FinClass');
coerce 'ObjFinClass', from 'HashRef', via { _build_type('TMS::API::Core::FinClass', $_) };

subtype 'ObjFinInvoice', as class_type('TMS::API::Core::FinInvoice');
coerce 'ObjFinInvoice', from 'HashRef', via { _build_type('TMS::API::Core::FinInvoice', $_) };

subtype 'ObjFinInvoicePayment', as class_type('TMS::API::Core::FinInvoicePayment');
coerce 'ObjFinInvoicePayment', from 'HashRef', via { _build_type('TMS::API::Core::FinInvoicePayment', $_) };

subtype 'ObjFinInvoicesItem', as class_type('TMS::API::Core::FinInvoicesItem');
coerce 'ObjFinInvoicesItem', from 'HashRef', via { _build_type('TMS::API::Core::FinInvoicesItem', $_) };

subtype 'ObjFinItemTemplate', as class_type('TMS::API::Core::FinItemTemplate');
coerce 'ObjFinItemTemplate', from 'HashRef', via { _build_type('TMS::API::Core::FinItemTemplate', $_) };

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

subtype 'ObjHrGovidcard', as class_type('TMS::API::Core::HrGovidcard');
coerce 'ObjHrGovidcard', from 'HashRef', via { _build_type('TMS::API::Core::HrGovidcard', $_) };

subtype 'ObjInsPolicy', as class_type('TMS::API::Core::InsPolicy');
coerce 'ObjInsPolicy', from 'HashRef', via { _build_type('TMS::API::Core::InsPolicy', $_) };

subtype 'ObjInvElogDevice', as class_type('TMS::API::Core::InvElogDevice');
coerce 'ObjInvElogDevice', from 'HashRef', via { _build_type('TMS::API::Core::InvElogDevice', $_) };

subtype 'ObjInvEquipment', as class_type('TMS::API::Core::InvEquipment');
coerce 'ObjInvEquipment', from 'HashRef', via { _build_type('TMS::API::Core::InvEquipment', $_) };

subtype 'ObjInvEquipmentType', as class_type('TMS::API::Core::InvEquipmentType');
coerce 'ObjInvEquipmentType', from 'HashRef', via { _build_type('TMS::API::Core::InvEquipmentType', $_) };

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

subtype 'ObjInvVehicle', as class_type('TMS::API::Core::InvVehicle');
coerce 'ObjInvVehicle', from 'HashRef', via { _build_type('TMS::API::Core::InvVehicle', $_) };

subtype 'ObjMsgAccess', as class_type('TMS::API::Core::MsgAccess');
coerce 'ObjMsgAccess', from 'HashRef', via { _build_type('TMS::API::Core::MsgAccess', $_) };

subtype 'ObjSftElogStat', as class_type('TMS::API::Core::SftElogStat');
coerce 'ObjSftElogStat', from 'HashRef', via { _build_type('TMS::API::Core::SftElogStat', $_) };

subtype 'ObjSftInspectionSchedule', as class_type('TMS::API::Core::SftInspectionSchedule');
coerce 'ObjSftInspectionSchedule', from 'HashRef', via { _build_type('TMS::API::Core::SftInspectionSchedule', $_) };

subtype 'ObjSftLogbook', as class_type('TMS::API::Core::SftLogbook');
coerce 'ObjSftLogbook', from 'HashRef', via { _build_type('TMS::API::Core::SftLogbook', $_) };

subtype 'ObjSftVehicleInspectItem', as class_type('TMS::API::Core::SftVehicleInspectItem');
coerce 'ObjSftVehicleInspectItem', from 'HashRef', via { _build_type('TMS::API::Core::SftVehicleInspectItem', $_) };

subtype 'ObjSftVehicleInspectedItem', as class_type('TMS::API::Core::SftVehicleInspectedItem');
coerce 'ObjSftVehicleInspectedItem', from 'HashRef', via { _build_type('TMS::API::Core::SftVehicleInspectedItem', $_) };

subtype 'ObjSftVehicleInspection', as class_type('TMS::API::Core::SftVehicleInspection');
coerce 'ObjSftVehicleInspection', from 'HashRef', via { _build_type('TMS::API::Core::SftVehicleInspection', $_) };

subtype 'ObjTmpRelationsNode', as class_type('TMS::API::Core::TmpRelationsNode');
coerce 'ObjTmpRelationsNode', from 'HashRef', via { _build_type('TMS::API::Core::TmpRelationsNode', $_) };

subtype 'ObjTskActn', as class_type('TMS::API::Core::TskActn');
coerce 'ObjTskActn', from 'HashRef', via { _build_type('TMS::API::Core::TskActn', $_) };

subtype 'ObjTskAlrm', as class_type('TMS::API::Core::TskAlrm');
coerce 'ObjTskAlrm', from 'HashRef', via { _build_type('TMS::API::Core::TskAlrm', $_) };

subtype 'ObjTskTask', as class_type('TMS::API::Core::TskTask');
coerce 'ObjTskTask', from 'HashRef', via { _build_type('TMS::API::Core::TskTask', $_) };

1;
