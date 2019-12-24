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

has 'AuthorityLevel' => ('is' => 'rw', 'isa' => 'Any',              'required' => '1', 'default' => 'member');
has 'BizEmail'       => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'BizFax'         => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'BizPhone'       => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'CurrentTitle'   => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'DateCreated'    => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'DateRemoved'    => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'NodeId'         => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'Notes'          => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

# relations
has 'ast' => ('is' => 'rw', 'isa' => 'ObjEntPerson', 'required' => '0');
has 'inv_unit_reservations_created_by' =>
    ('is' => 'rw', 'isa' => 'ArrayObjInvUnitReservation', 'required' => '0');
has 'fin_item_templates_created_by' => ('is' => 'rw', 'isa' => 'ArrayObjFinItemTemplate', 'required' => '0');
has 'dsp_loads_created_by'          => ('is' => 'rw', 'isa' => 'ArrayObjDspLoad',         'required' => '0');
has 'hr_payrates'                   => ('is' => 'rw', 'isa' => 'ArrayObjHrPayrate',       'required' => '0');
has 'hr_hire_records'               => ('is' => 'rw', 'isa' => 'ArrayObjHrHireRecord',    'required' => '0');
has 'hr_govidcards_addeds_by'       => ('is' => 'rw', 'isa' => 'ArrayObjHrGovidcard',     'required' => '0');
has 'cmm_assignments'               => ('is' => 'rw', 'isa' => 'ArrayObjCmmAssignment',   'required' => '0');
has 'hr_confidential'               => ('is' => 'rw', 'isa' => 'ObjHrConfidential',       'required' => '0');
has 'ent_blacklists'                => ('is' => 'rw', 'isa' => 'ArrayObjEntBlacklist',    'required' => '0');
has 'dsp_loads_docs'                => ('is' => 'rw', 'isa' => 'ArrayObjDspLoadsDoc',     'required' => '0');
has 'msg_notes'                     => ('is' => 'rw', 'isa' => 'ArrayObjMsgNote',         'required' => '0');
has 'biz_phone'                     => ('is' => 'rw', 'isa' => 'ObjCntPhonesfax',         'required' => '0');
has 'inv_notes'                     => ('is' => 'rw', 'isa' => 'ArrayObjInvNote',         'required' => '0');
has 'app_roles_assigned'            => ('is' => 'rw', 'isa' => 'ArrayObjAppRoleAssigned', 'required' => '0');
has 'ins_to_entities_removed_by'    => ('is' => 'rw', 'isa' => 'ArrayObjInsToEntity',     'required' => '0');
has 'cmm_assignments_groups'    => ('is' => 'rw', 'isa' => 'ArrayObjCmmAssignmentsGroup',    'required' => '0');
has 'ins_to_vehicles'           => ('is' => 'rw', 'isa' => 'ArrayObjInsToVehicle',           'required' => '0');
has 'app_accounts'              => ('is' => 'rw', 'isa' => 'ArrayObjAppAccount',             'required' => '0');
has 'hr_govidcards'             => ('is' => 'rw', 'isa' => 'ArrayObjHrGovidcard',            'required' => '0');
has 'cmm_assignments_customers' => ('is' => 'rw', 'isa' => 'ArrayObjCmmAssignmentsCustomer', 'required' => '0');
has 'fin_cheques_created_by'    => ('is' => 'rw', 'isa' => 'ArrayObjFinCheque',              'required' => '0');
has 'ins_to_entities_addeds_by' => ('is' => 'rw', 'isa' => 'ArrayObjInsToEntity',            'required' => '0');
has 'hr_emrgency_contacts'      => ('is' => 'rw', 'isa' => 'ArrayObjHrEmrgencyContact',      'required' => '0');
has 'dsp_loads_dispatched'      => ('is' => 'rw', 'isa' => 'ArrayObjDspLoadDispatched',      'required' => '0');
has 'ins_to_vehicles_removed_by' => ('is' => 'rw', 'isa' => 'ArrayObjInsToVehicle',   'required' => '0');
has 'fin_transactions'           => ('is' => 'rw', 'isa' => 'ArrayObjFinTransaction', 'required' => '0');
has 'node'                       => ('is' => 'rw', 'isa' => 'ObjBizCompanyNode',      'required' => '0');
has 'inv_units_to_equipments_removed_by' =>
    ('is' => 'rw', 'isa' => 'ArrayObjInvUnitsToEquipment', 'required' => '0');
has 'inv_equipments'                => ('is' => 'rw', 'isa' => 'ArrayObjInvEquipment',    'required' => '0');
has 'dsp_trips_loads'               => ('is' => 'rw', 'isa' => 'ArrayObjDspTripsLoad',    'required' => '0');
has 'hr_references_received_by'     => ('is' => 'rw', 'isa' => 'ArrayObjHrReference',     'required' => '0');
has 'fin_item_templates_deleted_by' => ('is' => 'rw', 'isa' => 'ArrayObjFinItemTemplate', 'required' => '0');
has 'fin_scheduled_deductions' => ('is' => 'rw', 'isa' => 'ArrayObjFinScheduledDeduction', 'required' => '0');
has 'fin_item_templates_updated_by' => ('is' => 'rw', 'isa' => 'ArrayObjFinItemTemplate', 'required' => '0');
has 'cmm_assignments_addeds_by'     => ('is' => 'rw', 'isa' => 'ArrayObjCmmAssignment',   'required' => '0');
has 'cmm_assignments_groups_addeds_by' =>
    ('is' => 'rw', 'isa' => 'ArrayObjCmmAssignmentsGroup', 'required' => '0');
has 'app_roles_created_by'         => ('is' => 'rw', 'isa' => 'ArrayObjAppRole',     'required' => '0');
has 'fin_cheques_authorizeds_by'   => ('is' => 'rw', 'isa' => 'ArrayObjFinCheque',   'required' => '0');
has 'drv_driver'                   => ('is' => 'rw', 'isa' => 'ObjDrvDriver',        'required' => '0');
has 'ins_policies'                 => ('is' => 'rw', 'isa' => 'ArrayObjInsPolicy',   'required' => '0');
has 'hr_references_references_for' => ('is' => 'rw', 'isa' => 'ArrayObjHrReference', 'required' => '0');
has 'cmm_assignments_customers_addeds_by' =>
    ('is' => 'rw', 'isa' => 'ArrayObjCmmAssignmentsCustomer', 'required' => '0');
has 'crr_ifta_decals'             => ('is' => 'rw', 'isa' => 'ArrayObjCrrIftaDecal',         'required' => '0');
has 'inv_unit_reservations_prsns' => ('is' => 'rw', 'isa' => 'ArrayObjInvUnitReservation',   'required' => '0');
has 'biz_fax'                     => ('is' => 'rw', 'isa' => 'ObjCntPhonesfax',              'required' => '0');
has 'fin_billing_tags'            => ('is' => 'rw', 'isa' => 'ArrayObjFinBillingTag',        'required' => '0');
has 'fin_invoice_payments'        => ('is' => 'rw', 'isa' => 'ArrayObjFinInvoicePayment',    'required' => '0');
has 'sft_vehicle_inspections'     => ('is' => 'rw', 'isa' => 'ArrayObjSftVehicleInspection', 'required' => '0');
has 'app_roles_updated_by'        => ('is' => 'rw', 'isa' => 'ArrayObjAppRole',              'required' => '0');
has 'dsp_trips'                   => ('is' => 'rw', 'isa' => 'ArrayObjDspTrip',              'required' => '0');
has 'fin_journal_entries'         => ('is' => 'rw', 'isa' => 'ArrayObjFinJournalEntry',      'required' => '0');
has 'dsp_loads'                   => ('is' => 'rw', 'isa' => 'ArrayObjDspLoad',              'required' => '0');
has 'drv_schedules'               => ('is' => 'rw', 'isa' => 'ArrayObjDrvSchedule',          'required' => '0');
has 'inv_support_vendors'         => ('is' => 'rw', 'isa' => 'ArrayObjInvSupportVendor',     'required' => '0');
has 'inv_units_to_equipment_addeds_by' =>
    ('is' => 'rw', 'isa' => 'ArrayObjInvUnitsToEquipment', 'required' => '0');
has 'fin_cheques_prints'    => ('is' => 'rw', 'isa' => 'ArrayObjFinChequesPrint', 'required' => '0');
has 'fin_invoices_items'    => ('is' => 'rw', 'isa' => 'ArrayObjFinInvoicesItem', 'required' => '0');
has 'fin_cheques_voided_by' => ('is' => 'rw', 'isa' => 'ArrayObjFinCheque',       'required' => '0');
has 'hr_residences'         => ('is' => 'rw', 'isa' => 'ArrayObjHrResidence',     'required' => '0');
has 'dsp_loads_destinations_docs' =>
    ('is' => 'rw', 'isa' => 'ArrayObjDspLoadsDestinationsDoc', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'HrAssociate');

1;
