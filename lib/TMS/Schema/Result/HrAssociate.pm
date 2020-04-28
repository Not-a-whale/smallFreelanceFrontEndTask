use utf8;

package TMS::Schema::Result::HrAssociate;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::HrAssociate

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<hr_associates>

=cut

__PACKAGE__->table("hr_associates");

=head1 ACCESSORS

=head2 AstId

  accessor: 'ast_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 CurrentTitle

  accessor: 'current_title'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 NodeId

  accessor: 'node_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 AuthorityLevel

  accessor: 'authority_level'
  data_type: 'enum'
  default_value: 'member'
  extra: {list => ["member","vise","executive"]}
  is_nullable: 0

=head2 DateCreated

  accessor: 'date_created'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 0

=head2 DateRemoved

  accessor: 'date_removed'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 BizPhone

  accessor: 'biz_phone'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 BizFax

  accessor: 'biz_fax'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 BizEmail

  accessor: 'biz_email'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 Notes

  accessor: 'notes'
  data_type: 'text'
  is_nullable: 1

=head2 PrimaryContact

  accessor: 'primary_contact'
  data_type: 'tinyint'
  default_value: 0
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "AstId",
    {   accessor       => "ast_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "CurrentTitle",
    {   accessor    => "current_title",
        data_type   => "varchar",
        is_nullable => 1,
        size        => 255,
    },
    "NodeId",
    {   accessor       => "node_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "AuthorityLevel",
    {   accessor      => "authority_level",
        data_type     => "enum",
        default_value => "member",
        extra         => {list => ["member", "vise", "executive"]},
        is_nullable   => 0,
    },
    "DateCreated",
    {   accessor                  => "date_created",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        default_value             => "CURRENT_TIMESTAMP",
        is_nullable               => 0,
    },
    "DateRemoved",
    {   accessor                  => "date_removed",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
    },
    "BizPhone",
    {   accessor       => "biz_phone",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "BizFax",
    {   accessor       => "biz_fax",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "BizEmail",
    {   accessor    => "biz_email",
        data_type   => "varchar",
        is_nullable => 1,
        size        => 255,
    },
    "Notes",
    {accessor => "notes", data_type => "text", is_nullable => 1},
    "PrimaryContact",
    {   accessor      => "primary_contact",
        data_type     => "tinyint",
        default_value => 0,
        is_nullable   => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</AstId>

=back

=cut

__PACKAGE__->set_primary_key("AstId");

=head1 RELATIONS

=head2 app_accounts

Type: has_many

Related object: L<TMS::Schema::Result::AppAccount>

=cut

__PACKAGE__->has_many(
    "app_accounts",
    "TMS::Schema::Result::AppAccount",
    {"foreign.UserId" => "self.AstId"},
    {cascade_copy     => 0, cascade_delete => 0},
);

=head2 app_roles_assigned

Type: has_many

Related object: L<TMS::Schema::Result::AppRoleAssigned>

=cut

__PACKAGE__->has_many(
    "app_roles_assigned", "TMS::Schema::Result::AppRoleAssigned",
    {"foreign.RoleAssignedBy" => "self.AstId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 app_roles_created_by

Type: has_many

Related object: L<TMS::Schema::Result::AppRole>

=cut

__PACKAGE__->has_many(
    "app_roles_created_by",
    "TMS::Schema::Result::AppRole",
    {"foreign.CreatedBy" => "self.AstId"},
    {cascade_copy        => 0, cascade_delete => 0},
);

=head2 app_roles_updated_by

Type: has_many

Related object: L<TMS::Schema::Result::AppRole>

=cut

__PACKAGE__->has_many(
    "app_roles_updated_by",
    "TMS::Schema::Result::AppRole",
    {"foreign.UpdatedBy" => "self.AstId"},
    {cascade_copy        => 0, cascade_delete => 0},
);

=head2 ast

Type: belongs_to

Related object: L<TMS::Schema::Result::EntPerson>

=cut

__PACKAGE__->belongs_to(
    "ast",
    "TMS::Schema::Result::EntPerson",
    {PrsnId        => "AstId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 biz_fax

Type: belongs_to

Related object: L<TMS::Schema::Result::CntPhonesfax>

=cut

__PACKAGE__->belongs_to(
    "biz_fax",
    "TMS::Schema::Result::CntPhonesfax",
    {PhnFaxId => "BizFax"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

=head2 biz_phone

Type: belongs_to

Related object: L<TMS::Schema::Result::CntPhonesfax>

=cut

__PACKAGE__->belongs_to(
    "biz_phone",
    "TMS::Schema::Result::CntPhonesfax",
    {PhnFaxId => "BizPhone"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

=head2 cmm_assignments_addeds_by

Type: has_many

Related object: L<TMS::Schema::Result::CmmAssignment>

=cut

__PACKAGE__->has_many(
    "cmm_assignments_addeds_by", "TMS::Schema::Result::CmmAssignment",
    {"foreign.AddedBy" => "self.AstId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 cmm_assignments_associates

Type: has_many

Related object: L<TMS::Schema::Result::CmmAssignment>

=cut

__PACKAGE__->has_many(
    "cmm_assignments_associates", "TMS::Schema::Result::CmmAssignment",
    {"foreign.AssociateId" => "self.AstId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 cmm_assignments_customers_addeds_by

Type: has_many

Related object: L<TMS::Schema::Result::CmmAssignmentsCustomer>

=cut

__PACKAGE__->has_many(
    "cmm_assignments_customers_addeds_by", "TMS::Schema::Result::CmmAssignmentsCustomer",
    {"foreign.AddedBy" => "self.AstId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 cmm_assignments_customers_associates

Type: has_many

Related object: L<TMS::Schema::Result::CmmAssignmentsCustomer>

=cut

__PACKAGE__->has_many(
    "cmm_assignments_customers_associates", "TMS::Schema::Result::CmmAssignmentsCustomer",
    {"foreign.AssociateId" => "self.AstId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 cmm_assignments_groups_addeds_by

Type: has_many

Related object: L<TMS::Schema::Result::CmmAssignmentsGroup>

=cut

__PACKAGE__->has_many(
    "cmm_assignments_groups_addeds_by", "TMS::Schema::Result::CmmAssignmentsGroup",
    {"foreign.AddedBy" => "self.AstId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 cmm_assignments_groups_associates

Type: has_many

Related object: L<TMS::Schema::Result::CmmAssignmentsGroup>

=cut

__PACKAGE__->has_many(
    "cmm_assignments_groups_associates", "TMS::Schema::Result::CmmAssignmentsGroup",
    {"foreign.AssociateId" => "self.AstId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 crr_ifta_decals

Type: has_many

Related object: L<TMS::Schema::Result::CrrIftaDecal>

=cut

__PACKAGE__->has_many(
    "crr_ifta_decals",
    "TMS::Schema::Result::CrrIftaDecal",
    {"foreign.CreatedBy" => "self.AstId"},
    {cascade_copy        => 0, cascade_delete => 0},
);

=head2 drv_driver

Type: might_have

Related object: L<TMS::Schema::Result::DrvDriver>

=cut

__PACKAGE__->might_have(
    "drv_driver",
    "TMS::Schema::Result::DrvDriver",
    {"foreign.DriverId" => "self.AstId"},
    {cascade_copy       => 0, cascade_delete => 0},
);

=head2 drv_schedules

Type: has_many

Related object: L<TMS::Schema::Result::DrvSchedule>

=cut

__PACKAGE__->has_many(
    "drv_schedules",
    "TMS::Schema::Result::DrvSchedule",
    {"foreign.PostedBy" => "self.AstId"},
    {cascade_copy       => 0, cascade_delete => 0},
);

=head2 dsp_loads_booked_by

Type: has_many

Related object: L<TMS::Schema::Result::DspLoad>

=cut

__PACKAGE__->has_many(
    "dsp_loads_booked_by",
    "TMS::Schema::Result::DspLoad",
    {"foreign.BookedBy" => "self.AstId"},
    {cascade_copy       => 0, cascade_delete => 0},
);

=head2 dsp_loads_created_by

Type: has_many

Related object: L<TMS::Schema::Result::DspLoad>

=cut

__PACKAGE__->has_many(
    "dsp_loads_created_by",
    "TMS::Schema::Result::DspLoad",
    {"foreign.CreatedBy" => "self.AstId"},
    {cascade_copy        => 0, cascade_delete => 0},
);

=head2 dsp_loads_destinations_docs

Type: has_many

Related object: L<TMS::Schema::Result::DspLoadsDestinationsDoc>

=cut

__PACKAGE__->has_many(
    "dsp_loads_destinations_docs", "TMS::Schema::Result::DspLoadsDestinationsDoc",
    {"foreign.ApprovedBy" => "self.AstId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 dsp_loads_dispatched

Type: has_many

Related object: L<TMS::Schema::Result::DspLoadDispatched>

=cut

__PACKAGE__->has_many(
    "dsp_loads_dispatched", "TMS::Schema::Result::DspLoadDispatched",
    {"foreign.DispatchedBy" => "self.AstId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 dsp_loads_docs

Type: has_many

Related object: L<TMS::Schema::Result::DspLoadsDoc>

=cut

__PACKAGE__->has_many(
    "dsp_loads_docs",
    "TMS::Schema::Result::DspLoadsDoc",
    {"foreign.AddedBy" => "self.AstId"},
    {cascade_copy      => 0, cascade_delete => 0},
);

=head2 dsp_trips

Type: has_many

Related object: L<TMS::Schema::Result::DspTrip>

=cut

__PACKAGE__->has_many(
    "dsp_trips",
    "TMS::Schema::Result::DspTrip",
    {"foreign.CreatedBy" => "self.AstId"},
    {cascade_copy        => 0, cascade_delete => 0},
);

=head2 dsp_trips_loads

Type: has_many

Related object: L<TMS::Schema::Result::DspTripsLoad>

=cut

__PACKAGE__->has_many(
    "dsp_trips_loads",
    "TMS::Schema::Result::DspTripsLoad",
    {"foreign.LoadDispatcher" => "self.AstId"},
    {cascade_copy             => 0, cascade_delete => 0},
);

=head2 ent_blacklists

Type: has_many

Related object: L<TMS::Schema::Result::EntBlacklist>

=cut

__PACKAGE__->has_many(
    "ent_blacklists",
    "TMS::Schema::Result::EntBlacklist",
    {"foreign.Creator" => "self.AstId"},
    {cascade_copy      => 0, cascade_delete => 0},
);

=head2 fin_billing_tags

Type: has_many

Related object: L<TMS::Schema::Result::FinBillingTag>

=cut

__PACKAGE__->has_many(
    "fin_billing_tags", "TMS::Schema::Result::FinBillingTag",
    {"foreign.CreatedBy" => "self.AstId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 fin_cheques_authorizeds_by

Type: has_many

Related object: L<TMS::Schema::Result::FinCheque>

=cut

__PACKAGE__->has_many(
    "fin_cheques_authorizeds_by", "TMS::Schema::Result::FinCheque",
    {"foreign.AuthorizedBy" => "self.AstId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 fin_cheques_created_by

Type: has_many

Related object: L<TMS::Schema::Result::FinCheque>

=cut

__PACKAGE__->has_many(
    "fin_cheques_created_by", "TMS::Schema::Result::FinCheque",
    {"foreign.CreatedBy" => "self.AstId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 fin_cheques_prints

Type: has_many

Related object: L<TMS::Schema::Result::FinChequesPrint>

=cut

__PACKAGE__->has_many(
    "fin_cheques_prints", "TMS::Schema::Result::FinChequesPrint",
    {"foreign.PrintedBy" => "self.AstId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 fin_cheques_voided_by

Type: has_many

Related object: L<TMS::Schema::Result::FinCheque>

=cut

__PACKAGE__->has_many(
    "fin_cheques_voided_by", "TMS::Schema::Result::FinCheque",
    {"foreign.VoidedBy" => "self.AstId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 fin_invoice_payments

Type: has_many

Related object: L<TMS::Schema::Result::FinInvoicePayment>

=cut

__PACKAGE__->has_many(
    "fin_invoice_payments", "TMS::Schema::Result::FinInvoicePayment",
    {"foreign.CreatedBy" => "self.AstId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 fin_invoices_items

Type: has_many

Related object: L<TMS::Schema::Result::FinInvoicesItem>

=cut

__PACKAGE__->has_many(
    "fin_invoices_items", "TMS::Schema::Result::FinInvoicesItem",
    {"foreign.CreatedBy" => "self.AstId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 fin_item_templates_created_by

Type: has_many

Related object: L<TMS::Schema::Result::FinItemTemplate>

=cut

__PACKAGE__->has_many(
    "fin_item_templates_created_by", "TMS::Schema::Result::FinItemTemplate",
    {"foreign.CreatedBy" => "self.AstId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 fin_item_templates_deleted_by

Type: has_many

Related object: L<TMS::Schema::Result::FinItemTemplate>

=cut

__PACKAGE__->has_many(
    "fin_item_templates_deleted_by", "TMS::Schema::Result::FinItemTemplate",
    {"foreign.DeletedBy" => "self.AstId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 fin_item_templates_updated_by

Type: has_many

Related object: L<TMS::Schema::Result::FinItemTemplate>

=cut

__PACKAGE__->has_many(
    "fin_item_templates_updated_by", "TMS::Schema::Result::FinItemTemplate",
    {"foreign.UpdatedBy" => "self.AstId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 fin_journal_entries

Type: has_many

Related object: L<TMS::Schema::Result::FinJournalEntry>

=cut

__PACKAGE__->has_many(
    "fin_journal_entries", "TMS::Schema::Result::FinJournalEntry",
    {"foreign.CreatedBy" => "self.AstId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 fin_scheduled_deductions

Type: has_many

Related object: L<TMS::Schema::Result::FinScheduledDeduction>

=cut

__PACKAGE__->has_many(
    "fin_scheduled_deductions", "TMS::Schema::Result::FinScheduledDeduction",
    {"foreign.CreatedBy" => "self.AstId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 fin_transactions

Type: has_many

Related object: L<TMS::Schema::Result::FinTransaction>

=cut

__PACKAGE__->has_many(
    "fin_transactions", "TMS::Schema::Result::FinTransaction",
    {"foreign.CreatedBy" => "self.AstId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 hr_confidential

Type: might_have

Related object: L<TMS::Schema::Result::HrConfidential>

=cut

__PACKAGE__->might_have(
    "hr_confidential", "TMS::Schema::Result::HrConfidential",
    {"foreign.AstId" => "self.AstId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 hr_emrgency_contacts

Type: has_many

Related object: L<TMS::Schema::Result::HrEmrgencyContact>

=cut

__PACKAGE__->has_many(
    "hr_emrgency_contacts", "TMS::Schema::Result::HrEmrgencyContact",
    {"foreign.AstId" => "self.AstId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 hr_govidcards_addeds_by

Type: has_many

Related object: L<TMS::Schema::Result::HrGovidcard>

=cut

__PACKAGE__->has_many(
    "hr_govidcards_addeds_by", "TMS::Schema::Result::HrGovidcard",
    {"foreign.AddedBy" => "self.AstId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 hr_govidcards_asts

Type: has_many

Related object: L<TMS::Schema::Result::HrGovidcard>

=cut

__PACKAGE__->has_many(
    "hr_govidcards_asts", "TMS::Schema::Result::HrGovidcard",
    {"foreign.AstId" => "self.AstId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 hr_hire_records

Type: has_many

Related object: L<TMS::Schema::Result::HrHireRecord>

=cut

__PACKAGE__->has_many(
    "hr_hire_records", "TMS::Schema::Result::HrHireRecord",
    {"foreign.AstId" => "self.AstId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 hr_payrates

Type: has_many

Related object: L<TMS::Schema::Result::HrPayrate>

=cut

__PACKAGE__->has_many(
    "hr_payrates",
    "TMS::Schema::Result::HrPayrate",
    {"foreign.AstId" => "self.AstId"},
    {cascade_copy    => 0, cascade_delete => 0},
);

=head2 hr_references_received_by

Type: has_many

Related object: L<TMS::Schema::Result::HrReference>

=cut

__PACKAGE__->has_many(
    "hr_references_received_by", "TMS::Schema::Result::HrReference",
    {"foreign.ReceivedBy" => "self.AstId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 hr_references_references_for

Type: has_many

Related object: L<TMS::Schema::Result::HrReference>

=cut

__PACKAGE__->has_many(
    "hr_references_references_for", "TMS::Schema::Result::HrReference",
    {"foreign.ReferenceFor" => "self.AstId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 hr_residences

Type: has_many

Related object: L<TMS::Schema::Result::HrResidence>

=cut

__PACKAGE__->has_many(
    "hr_residences",
    "TMS::Schema::Result::HrResidence",
    {"foreign.AstId" => "self.AstId"},
    {cascade_copy    => 0, cascade_delete => 0},
);

=head2 ins_to_entities_addeds_by

Type: has_many

Related object: L<TMS::Schema::Result::InsToEntity>

=cut

__PACKAGE__->has_many(
    "ins_to_entities_addeds_by", "TMS::Schema::Result::InsToEntity",
    {"foreign.AddedBy" => "self.AstId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 ins_to_entities_removed_by

Type: has_many

Related object: L<TMS::Schema::Result::InsToEntity>

=cut

__PACKAGE__->has_many(
    "ins_to_entities_removed_by", "TMS::Schema::Result::InsToEntity",
    {"foreign.RemovedBy" => "self.AstId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 ins_to_vehicles_addeds_by

Type: has_many

Related object: L<TMS::Schema::Result::InsToVehicle>

=cut

__PACKAGE__->has_many(
    "ins_to_vehicles_addeds_by", "TMS::Schema::Result::InsToVehicle",
    {"foreign.AddedBy" => "self.AstId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 ins_to_vehicles_removed_by

Type: has_many

Related object: L<TMS::Schema::Result::InsToVehicle>

=cut

__PACKAGE__->has_many(
    "ins_to_vehicles_removed_by", "TMS::Schema::Result::InsToVehicle",
    {"foreign.RemovedBy" => "self.AstId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 inv_equipments

Type: has_many

Related object: L<TMS::Schema::Result::InvEquipment>

=cut

__PACKAGE__->has_many(
    "inv_equipments",
    "TMS::Schema::Result::InvEquipment",
    {"foreign.OwnerId" => "self.AstId"},
    {cascade_copy      => 0, cascade_delete => 0},
);

=head2 inv_notes

Type: has_many

Related object: L<TMS::Schema::Result::InvNote>

=cut

__PACKAGE__->has_many(
    "inv_notes",
    "TMS::Schema::Result::InvNote",
    {"foreign.PostedBy" => "self.AstId"},
    {cascade_copy       => 0, cascade_delete => 0},
);

=head2 inv_support_vendors

Type: has_many

Related object: L<TMS::Schema::Result::InvSupportVendor>

=cut

__PACKAGE__->has_many(
    "inv_support_vendors", "TMS::Schema::Result::InvSupportVendor",
    {"foreign.PrimaryContact" => "self.AstId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 inv_unit_reservations_created_by

Type: has_many

Related object: L<TMS::Schema::Result::InvUnitReservation>

=cut

__PACKAGE__->has_many(
    "inv_unit_reservations_created_by", "TMS::Schema::Result::InvUnitReservation",
    {"foreign.CreatedBy" => "self.AstId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 inv_unit_reservations_prsns

Type: has_many

Related object: L<TMS::Schema::Result::InvUnitReservation>

=cut

__PACKAGE__->has_many(
    "inv_unit_reservations_prsns", "TMS::Schema::Result::InvUnitReservation",
    {"foreign.PrsnId" => "self.AstId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 inv_units_to_equipment_addeds_by

Type: has_many

Related object: L<TMS::Schema::Result::InvUnitsToEquipment>

=cut

__PACKAGE__->has_many(
    "inv_units_to_equipment_addeds_by", "TMS::Schema::Result::InvUnitsToEquipment",
    {"foreign.AddedBy" => "self.AstId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 inv_units_to_equipments_removed_by

Type: has_many

Related object: L<TMS::Schema::Result::InvUnitsToEquipment>

=cut

__PACKAGE__->has_many(
    "inv_units_to_equipments_removed_by", "TMS::Schema::Result::InvUnitsToEquipment",
    {"foreign.RemovedBy" => "self.AstId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 msg_notes

Type: has_many

Related object: L<TMS::Schema::Result::MsgNote>

=cut

__PACKAGE__->has_many(
    "msg_notes",
    "TMS::Schema::Result::MsgNote",
    {"foreign.author" => "self.AstId"},
    {cascade_copy     => 0, cascade_delete => 0},
);

=head2 node

Type: belongs_to

Related object: L<TMS::Schema::Result::BizCompanyNode>

=cut

__PACKAGE__->belongs_to(
    "node",
    "TMS::Schema::Result::BizCompanyNode",
    {NodeId => "NodeId"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

=head2 sft_vehicle_inspections

Type: has_many

Related object: L<TMS::Schema::Result::SftVehicleInspection>

=cut

__PACKAGE__->has_many(
    "sft_vehicle_inspections", "TMS::Schema::Result::SftVehicleInspection",
    {"foreign.InspectorId" => "self.AstId"}, {cascade_copy => 0, cascade_delete => 0},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-04-28 11:12:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:62MbN+BwDr4qYQr9LpBMDA

foreach (qw( vendor dispatcher owner driver customer shipper )) {
    __PACKAGE__->belongs_to(
        "ast_$_",
        "TMS::Schema::Result::EntPerson",
        {PrsnId        => "AstId"},
        {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
    );

    __PACKAGE__->belongs_to(
        "biz_fax_$_",
        "TMS::Schema::Result::CntPhonesfax",
        {PhnFaxId => "BizFax"},
        {   is_deferrable => 1,
            join_type     => "LEFT",
            on_delete     => "RESTRICT",
            on_update     => "CASCADE",
        },
    );

    __PACKAGE__->belongs_to(
        "biz_phone_$_",
        "TMS::Schema::Result::CntPhonesfax",
        {PhnFaxId => "BizPhone"},
        {   is_deferrable => 1,
            join_type     => "LEFT",
            on_delete     => "RESTRICT",
            on_update     => "CASCADE",
        },
    );
}

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
