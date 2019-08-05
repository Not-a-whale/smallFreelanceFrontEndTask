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

=head2 DateCreated

  accessor: 'date_created'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

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

=cut

__PACKAGE__->add_columns(
  "AstId",
  {
    accessor       => "ast_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "CurrentTitle",
  {
    accessor => "current_title",
    data_type => "varchar",
    is_nullable => 1,
    size => 255,
  },
  "NodeId",
  {
    accessor       => "node_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 1,
  },
  "DateCreated",
  {
    accessor => "date_created",
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "DateRemoved",
  {
    accessor => "date_removed",
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "BizPhone",
  {
    accessor       => "biz_phone",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 1,
  },
  "BizFax",
  {
    accessor       => "biz_fax",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 1,
  },
  "BizEmail",
  {
    accessor => "biz_email",
    data_type => "varchar",
    is_nullable => 1,
    size => 255,
  },
  "Notes",
  { accessor => "notes", data_type => "text", is_nullable => 1 },
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
  { "foreign.UserId" => "self.AstId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 app_roles_assigned

Type: has_many

Related object: L<TMS::Schema::Result::AppRoleAssigned>

=cut

__PACKAGE__->has_many(
  "app_roles_assigned",
  "TMS::Schema::Result::AppRoleAssigned",
  { "foreign.RoleAssignedBy" => "self.AstId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ast

Type: belongs_to

Related object: L<TMS::Schema::Result::EntPerson>

=cut

__PACKAGE__->belongs_to(
  "ast",
  "TMS::Schema::Result::EntPerson",
  { PrsnId => "AstId" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);

=head2 biz_fax

Type: belongs_to

Related object: L<TMS::Schema::Result::CntPhonesfax>

=cut

__PACKAGE__->belongs_to(
  "biz_fax",
  "TMS::Schema::Result::CntPhonesfax",
  { PhnFaxId => "BizFax" },
  {
    is_deferrable => 1,
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
  { PhnFaxId => "BizPhone" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "CASCADE",
  },
);

=head2 cmm_assignments

Type: has_many

Related object: L<TMS::Schema::Result::CmmAssignment>

=cut

__PACKAGE__->has_many(
  "cmm_assignments",
  "TMS::Schema::Result::CmmAssignment",
  { "foreign.AssociateId" => "self.AstId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 cmm_assignments_customers

Type: has_many

Related object: L<TMS::Schema::Result::CmmAssignmentsCustomer>

=cut

__PACKAGE__->has_many(
  "cmm_assignments_customers",
  "TMS::Schema::Result::CmmAssignmentsCustomer",
  { "foreign.AssociateId" => "self.AstId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 cmm_assignments_groups

Type: has_many

Related object: L<TMS::Schema::Result::CmmAssignmentsGroup>

=cut

__PACKAGE__->has_many(
  "cmm_assignments_groups",
  "TMS::Schema::Result::CmmAssignmentsGroup",
  { "foreign.AssociateId" => "self.AstId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 drv_drivers

Type: has_many

Related object: L<TMS::Schema::Result::DrvDriver>

=cut

__PACKAGE__->has_many(
  "drv_drivers",
  "TMS::Schema::Result::DrvDriver",
  { "foreign.DriverId" => "self.AstId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 drv_schedules

Type: has_many

Related object: L<TMS::Schema::Result::DrvSchedule>

=cut

__PACKAGE__->has_many(
  "drv_schedules",
  "TMS::Schema::Result::DrvSchedule",
  { "foreign.PostedBy" => "self.AstId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 dsp_loads

Type: has_many

Related object: L<TMS::Schema::Result::DspLoad>

=cut

__PACKAGE__->has_many(
  "dsp_loads",
  "TMS::Schema::Result::DspLoad",
  { "foreign.BookedBy" => "self.AstId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 dsp_trips

Type: has_many

Related object: L<TMS::Schema::Result::DspTrip>

=cut

__PACKAGE__->has_many(
  "dsp_trips",
  "TMS::Schema::Result::DspTrip",
  { "foreign.CreatedBy" => "self.AstId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 fin_invoices_items

Type: has_many

Related object: L<TMS::Schema::Result::FinInvoicesItem>

=cut

__PACKAGE__->has_many(
  "fin_invoices_items",
  "TMS::Schema::Result::FinInvoicesItem",
  { "foreign.CreatedBy" => "self.AstId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 hr_emrgency_contacts

Type: has_many

Related object: L<TMS::Schema::Result::HrEmrgencyContact>

=cut

__PACKAGE__->has_many(
  "hr_emrgency_contacts",
  "TMS::Schema::Result::HrEmrgencyContact",
  { "foreign.AstId" => "self.AstId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 hr_govidcards

Type: has_many

Related object: L<TMS::Schema::Result::HrGovidcard>

=cut

__PACKAGE__->has_many(
  "hr_govidcards",
  "TMS::Schema::Result::HrGovidcard",
  { "foreign.AstId" => "self.AstId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 hr_hire_records

Type: has_many

Related object: L<TMS::Schema::Result::HrHireRecord>

=cut

__PACKAGE__->has_many(
  "hr_hire_records",
  "TMS::Schema::Result::HrHireRecord",
  { "foreign.AstId" => "self.AstId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 hr_payrates

Type: has_many

Related object: L<TMS::Schema::Result::HrPayrate>

=cut

__PACKAGE__->has_many(
  "hr_payrates",
  "TMS::Schema::Result::HrPayrate",
  { "foreign.AstId" => "self.AstId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 hr_references_received_by

Type: has_many

Related object: L<TMS::Schema::Result::HrReference>

=cut

__PACKAGE__->has_many(
  "hr_references_received_by",
  "TMS::Schema::Result::HrReference",
  { "foreign.ReceivedBy" => "self.AstId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 hr_references_references_for

Type: has_many

Related object: L<TMS::Schema::Result::HrReference>

=cut

__PACKAGE__->has_many(
  "hr_references_references_for",
  "TMS::Schema::Result::HrReference",
  { "foreign.ReferenceFor" => "self.AstId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 hr_residences

Type: has_many

Related object: L<TMS::Schema::Result::HrResidence>

=cut

__PACKAGE__->has_many(
  "hr_residences",
  "TMS::Schema::Result::HrResidence",
  { "foreign.AstId" => "self.AstId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 hr_workauthorizations

Type: has_many

Related object: L<TMS::Schema::Result::HrWorkauthorization>

=cut

__PACKAGE__->has_many(
  "hr_workauthorizations",
  "TMS::Schema::Result::HrWorkauthorization",
  { "foreign.AstId" => "self.AstId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ins_to_vehicles

Type: has_many

Related object: L<TMS::Schema::Result::InsToVehicle>

=cut

__PACKAGE__->has_many(
  "ins_to_vehicles",
  "TMS::Schema::Result::InsToVehicle",
  { "foreign.AddedBy" => "self.AstId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 inv_notes

Type: has_many

Related object: L<TMS::Schema::Result::InvNote>

=cut

__PACKAGE__->has_many(
  "inv_notes",
  "TMS::Schema::Result::InvNote",
  { "foreign.PostedBy" => "self.AstId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 inv_unit_reservations_created_by

Type: has_many

Related object: L<TMS::Schema::Result::InvUnitReservation>

=cut

__PACKAGE__->has_many(
  "inv_unit_reservations_created_by",
  "TMS::Schema::Result::InvUnitReservation",
  { "foreign.CreatedBy" => "self.AstId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 inv_unit_reservations_prsns

Type: has_many

Related object: L<TMS::Schema::Result::InvUnitReservation>

=cut

__PACKAGE__->has_many(
  "inv_unit_reservations_prsns",
  "TMS::Schema::Result::InvUnitReservation",
  { "foreign.PrsnId" => "self.AstId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 jobs_charges

Type: has_many

Related object: L<TMS::Schema::Result::JobsCharge>

=cut

__PACKAGE__->has_many(
  "jobs_charges",
  "TMS::Schema::Result::JobsCharge",
  { "foreign.AddedBy" => "self.AstId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 node

Type: belongs_to

Related object: L<TMS::Schema::Result::BizCompanyNode>

=cut

__PACKAGE__->belongs_to(
  "node",
  "TMS::Schema::Result::BizCompanyNode",
  { NodeId => "NodeId" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-05 15:51:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:XpUvh00scLG4AWdUrpxwNA


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;