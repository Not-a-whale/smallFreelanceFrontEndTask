package TMS::API::Core::HrAssociate;

use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use namespace::autoclean;
use Devel::Confess;
use Data::Dumper;
use Try::Tiny;

$Data::Dumper::Terse = 1;

use Moose;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Complex;

extends 'TMS::SchemaWrapper';
with 'MooseX::Traits';

has 'BizEmail'     => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'BizFax'       => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'BizPhone'     => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'CurrentTitle' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'DateCreated'  => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '0');
has 'DateRemoved'  => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '0');
has 'NodeId'       => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'Notes'        => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');

# relations
has 'app_accounts'              => ('is' => 'rw', 'isa' => 'ArrayObjAppAccount',             'coerce' => '1', 'required' => '0');
has 'app_roles_assigned'        => ('is' => 'rw', 'isa' => 'ArrayObjAppRoleAssigned',        'coerce' => '1', 'required' => '0');
has 'app_roles_created_by'      => ('is' => 'rw', 'isa' => 'ArrayObjAppRole',                'coerce' => '1', 'required' => '0');
has 'app_roles_updated_by'      => ('is' => 'rw', 'isa' => 'ArrayObjAppRole',                'coerce' => '1', 'required' => '0');
has 'ast'                       => ('is' => 'rw', 'isa' => 'ObjEntPerson',                   'coerce' => '1', 'required' => '0');
has 'ast_customer'              => ('is' => 'rw', 'isa' => 'ObjEntPerson',                   'coerce' => '1', 'required' => '0');
has 'ast_dispatcher'            => ('is' => 'rw', 'isa' => 'ObjEntPerson',                   'coerce' => '1', 'required' => '0');
has 'ast_driver'                => ('is' => 'rw', 'isa' => 'ObjEntPerson',                   'coerce' => '1', 'required' => '0');
has 'ast_owner'                 => ('is' => 'rw', 'isa' => 'ObjEntPerson',                   'coerce' => '1', 'required' => '0');
has 'ast_shipper'               => ('is' => 'rw', 'isa' => 'ObjEntPerson',                   'coerce' => '1', 'required' => '0');
has 'ast_vendor'                => ('is' => 'rw', 'isa' => 'ObjEntPerson',                   'coerce' => '1', 'required' => '0');
has 'biz_fax'                   => ('is' => 'rw', 'isa' => 'ObjCntPhonesfax',                'coerce' => '1', 'required' => '0');
has 'biz_fax_customer'          => ('is' => 'rw', 'isa' => 'ObjCntPhonesfax',                'coerce' => '1', 'required' => '0');
has 'biz_fax_dispatcher'        => ('is' => 'rw', 'isa' => 'ObjCntPhonesfax',                'coerce' => '1', 'required' => '0');
has 'biz_fax_driver'            => ('is' => 'rw', 'isa' => 'ObjCntPhonesfax',                'coerce' => '1', 'required' => '0');
has 'biz_fax_owner'             => ('is' => 'rw', 'isa' => 'ObjCntPhonesfax',                'coerce' => '1', 'required' => '0');
has 'biz_fax_shipper'           => ('is' => 'rw', 'isa' => 'ObjCntPhonesfax',                'coerce' => '1', 'required' => '0');
has 'biz_fax_vendor'            => ('is' => 'rw', 'isa' => 'ObjCntPhonesfax',                'coerce' => '1', 'required' => '0');
has 'biz_phone'                 => ('is' => 'rw', 'isa' => 'ObjCntPhonesfax',                'coerce' => '1', 'required' => '0');
has 'biz_phone_customer'        => ('is' => 'rw', 'isa' => 'ObjCntPhonesfax',                'coerce' => '1', 'required' => '0');
has 'biz_phone_dispatcher'      => ('is' => 'rw', 'isa' => 'ObjCntPhonesfax',                'coerce' => '1', 'required' => '0');
has 'biz_phone_driver'          => ('is' => 'rw', 'isa' => 'ObjCntPhonesfax',                'coerce' => '1', 'required' => '0');
has 'biz_phone_owner'           => ('is' => 'rw', 'isa' => 'ObjCntPhonesfax',                'coerce' => '1', 'required' => '0');
has 'biz_phone_shipper'         => ('is' => 'rw', 'isa' => 'ObjCntPhonesfax',                'coerce' => '1', 'required' => '0');
has 'biz_phone_vendor'          => ('is' => 'rw', 'isa' => 'ObjCntPhonesfax',                'coerce' => '1', 'required' => '0');
has 'cmm_assignments'           => ('is' => 'rw', 'isa' => 'ArrayObjCmmAssignment',          'coerce' => '1', 'required' => '0');
has 'cmm_assignments_addeds_by' => ('is' => 'rw', 'isa' => 'ArrayObjCmmAssignment',          'coerce' => '1', 'required' => '0');
has 'cmm_assignments_customers' => ('is' => 'rw', 'isa' => 'ArrayObjCmmAssignmentsCustomer', 'coerce' => '1', 'required' => '0');
has 'cmm_assignments_customers_addeds_by' =>
    ('is' => 'rw', 'isa' => 'ArrayObjCmmAssignmentsCustomer', 'coerce' => '1', 'required' => '0');
has 'cmm_assignments_groups' => ('is' => 'rw', 'isa' => 'ArrayObjCmmAssignmentsGroup', 'coerce' => '1', 'required' => '0');
has 'cmm_assignments_groups_addeds_by' =>
    ('is' => 'rw', 'isa' => 'ArrayObjCmmAssignmentsGroup', 'coerce' => '1', 'required' => '0');
has 'crr_ifta_decals'             => ('is' => 'rw', 'isa' => 'ArrayObjCrrIftaDecal',            'coerce' => '1', 'required' => '0');
has 'drv_driver'                  => ('is' => 'rw', 'isa' => 'ObjDrvDriver',                    'coerce' => '1', 'required' => '0');
has 'drv_schedules'               => ('is' => 'rw', 'isa' => 'ArrayObjDrvSchedule',             'coerce' => '1', 'required' => '0');
has 'dsp_loads'                   => ('is' => 'rw', 'isa' => 'ArrayObjDspLoad',                 'coerce' => '1', 'required' => '0');
has 'dsp_loads_created_by'        => ('is' => 'rw', 'isa' => 'ArrayObjDspLoad',                 'coerce' => '1', 'required' => '0');
has 'dsp_loads_destinations_docs' => ('is' => 'rw', 'isa' => 'ArrayObjDspLoadsDestinationsDoc', 'coerce' => '1', 'required' => '0');
has 'dsp_loads_dispatched'        => ('is' => 'rw', 'isa' => 'ArrayObjDspLoadDispatched',       'coerce' => '1', 'required' => '0');
has 'dsp_loads_docs'              => ('is' => 'rw', 'isa' => 'ArrayObjDspLoadsDoc',             'coerce' => '1', 'required' => '0');
has 'dsp_trips'                   => ('is' => 'rw', 'isa' => 'ArrayObjDspTrip',                 'coerce' => '1', 'required' => '0');
has 'dsp_trips_loads'             => ('is' => 'rw', 'isa' => 'ArrayObjDspTripsLoad',            'coerce' => '1', 'required' => '0');
has 'ent_blacklists'              => ('is' => 'rw', 'isa' => 'ArrayObjEntBlacklist',            'coerce' => '1', 'required' => '0');
has 'fin_billing_tags'            => ('is' => 'rw', 'isa' => 'ArrayObjFinBillingTag',           'coerce' => '1', 'required' => '0');
has 'fin_cheques_authorizeds_by'  => ('is' => 'rw', 'isa' => 'ArrayObjFinCheque',               'coerce' => '1', 'required' => '0');
has 'fin_cheques_created_by'      => ('is' => 'rw', 'isa' => 'ArrayObjFinCheque',               'coerce' => '1', 'required' => '0');
has 'fin_cheques_prints'          => ('is' => 'rw', 'isa' => 'ArrayObjFinChequesPrint',         'coerce' => '1', 'required' => '0');
has 'fin_cheques_voided_by'       => ('is' => 'rw', 'isa' => 'ArrayObjFinCheque',               'coerce' => '1', 'required' => '0');
has 'fin_invoice_payments'        => ('is' => 'rw', 'isa' => 'ArrayObjFinInvoicePayment',       'coerce' => '1', 'required' => '0');
has 'fin_invoices_items'          => ('is' => 'rw', 'isa' => 'ArrayObjFinInvoicesItem',         'coerce' => '1', 'required' => '0');
has 'fin_item_templates_created_by' => ('is' => 'rw', 'isa' => 'ArrayObjFinItemTemplate',       'coerce' => '1', 'required' => '0');
has 'fin_item_templates_deleted_by' => ('is' => 'rw', 'isa' => 'ArrayObjFinItemTemplate',       'coerce' => '1', 'required' => '0');
has 'fin_item_templates_updated_by' => ('is' => 'rw', 'isa' => 'ArrayObjFinItemTemplate',       'coerce' => '1', 'required' => '0');
has 'fin_journal_entries'           => ('is' => 'rw', 'isa' => 'ArrayObjFinJournalEntry',       'coerce' => '1', 'required' => '0');
has 'fin_scheduled_deductions'      => ('is' => 'rw', 'isa' => 'ArrayObjFinScheduledDeduction', 'coerce' => '1', 'required' => '0');
has 'fin_transactions'              => ('is' => 'rw', 'isa' => 'ArrayObjFinTransaction',        'coerce' => '1', 'required' => '0');
has 'hr_confidential'               => ('is' => 'rw', 'isa' => 'ObjHrConfidential',             'coerce' => '1', 'required' => '0');
has 'hr_emrgency_contacts'          => ('is' => 'rw', 'isa' => 'ArrayObjHrEmrgencyContact',     'coerce' => '1', 'required' => '0');
has 'hr_govidcards'                 => ('is' => 'rw', 'isa' => 'ArrayObjHrGovidcard',           'coerce' => '1', 'required' => '0');
has 'hr_govidcards_addeds_by'       => ('is' => 'rw', 'isa' => 'ArrayObjHrGovidcard',           'coerce' => '1', 'required' => '0');
has 'hr_hire_records'               => ('is' => 'rw', 'isa' => 'ArrayObjHrHireRecord',          'coerce' => '1', 'required' => '0');
has 'hr_payrates'                   => ('is' => 'rw', 'isa' => 'ArrayObjHrPayrate',             'coerce' => '1', 'required' => '0');
has 'hr_references_received_by'     => ('is' => 'rw', 'isa' => 'ArrayObjHrReference',           'coerce' => '1', 'required' => '0');
has 'hr_references_references_for'  => ('is' => 'rw', 'isa' => 'ArrayObjHrReference',           'coerce' => '1', 'required' => '0');
has 'hr_residences'                 => ('is' => 'rw', 'isa' => 'ArrayObjHrResidence',           'coerce' => '1', 'required' => '0');
has 'ins_policies'                  => ('is' => 'rw', 'isa' => 'ArrayObjInsPolicy',             'coerce' => '1', 'required' => '0');
has 'ins_to_entities_addeds_by'     => ('is' => 'rw', 'isa' => 'ArrayObjInsToEntity',           'coerce' => '1', 'required' => '0');
has 'ins_to_entities_removed_by'    => ('is' => 'rw', 'isa' => 'ArrayObjInsToEntity',           'coerce' => '1', 'required' => '0');
has 'ins_to_vehicles'               => ('is' => 'rw', 'isa' => 'ArrayObjInsToVehicle',          'coerce' => '1', 'required' => '0');
has 'ins_to_vehicles_removed_by'    => ('is' => 'rw', 'isa' => 'ArrayObjInsToVehicle',          'coerce' => '1', 'required' => '0');
has 'inv_equipments'                => ('is' => 'rw', 'isa' => 'ArrayObjInvEquipment',          'coerce' => '1', 'required' => '0');
has 'inv_notes'                     => ('is' => 'rw', 'isa' => 'ArrayObjInvNote',               'coerce' => '1', 'required' => '0');
has 'inv_support_vendors'           => ('is' => 'rw', 'isa' => 'ArrayObjInvSupportVendor',      'coerce' => '1', 'required' => '0');
has 'inv_unit_reservations_created_by' => ('is' => 'rw', 'isa' => 'ArrayObjInvUnitReservation', 'coerce' => '1', 'required' => '0');
has 'inv_unit_reservations_prsns'      => ('is' => 'rw', 'isa' => 'ArrayObjInvUnitReservation', 'coerce' => '1', 'required' => '0');
has 'inv_units_to_equipment_addeds_by' =>
    ('is' => 'rw', 'isa' => 'ArrayObjInvUnitsToEquipment', 'coerce' => '1', 'required' => '0');
has 'inv_units_to_equipments_removed_by' =>
    ('is' => 'rw', 'isa' => 'ArrayObjInvUnitsToEquipment', 'coerce' => '1', 'required' => '0');
has 'msg_notes'               => ('is' => 'rw', 'isa' => 'ArrayObjMsgNote',              'coerce' => '1', 'required' => '0');
has 'node'                    => ('is' => 'rw', 'isa' => 'ObjBizCompanyNode',            'coerce' => '1', 'required' => '0');
has 'sft_vehicle_inspections' => ('is' => 'rw', 'isa' => 'ArrayObjSftVehicleInspection', 'coerce' => '1', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'HrAssociate');

1;
