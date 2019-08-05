use utf8;
package TMS::Schema::Result::EntPerson;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::EntPerson

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<ent_people>

=cut

__PACKAGE__->table("ent_people");

=head1 ACCESSORS

=head2 PrsnId

  accessor: 'prsn_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 NickName

  accessor: 'nick_name'
  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 512

=head2 Prefix

  accessor: 'prefix'
  data_type: 'enum'
  default_value: (empty string)
  extra: {list => ["","Mr.","Mrs.","Ms.","Dr.","Sir","Madam"]}
  is_nullable: 0

=head2 FirstName

  accessor: 'first_name'
  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 MiddleName

  accessor: 'middle_name'
  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 LastName

  accessor: 'last_name'
  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 Suffix

  accessor: 'suffix'
  data_type: 'enum'
  default_value: (empty string)
  extra: {list => ["","Sr","Jr","I","II","III","IV"]}
  is_nullable: 0

=head2 BrnchId

  accessor: 'brnch_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "PrsnId",
  {
    accessor => "prsn_id",
    data_type => "bigint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "NickName",
  {
    accessor => "nick_name",
    data_type => "varchar",
    default_value => "",
    is_nullable => 0,
    size => 512,
  },
  "Prefix",
  {
    accessor      => "prefix",
    data_type     => "enum",
    default_value => "",
    extra         => { list => ["", "Mr.", "Mrs.", "Ms.", "Dr.", "Sir", "Madam"] },
    is_nullable   => 0,
  },
  "FirstName",
  {
    accessor => "first_name",
    data_type => "varchar",
    is_nullable => 0,
    size => 64,
  },
  "MiddleName",
  {
    accessor => "middle_name",
    data_type => "varchar",
    default_value => "",
    is_nullable => 0,
    size => 64,
  },
  "LastName",
  {
    accessor => "last_name",
    data_type => "varchar",
    is_nullable => 0,
    size => 64,
  },
  "Suffix",
  {
    accessor      => "suffix",
    data_type     => "enum",
    default_value => "",
    extra         => { list => ["", "Sr", "Jr", "I", "II", "III", "IV"] },
    is_nullable   => 0,
  },
  "BrnchId",
  {
    accessor       => "brnch_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</PrsnId>

=back

=cut

__PACKAGE__->set_primary_key("PrsnId");

=head1 UNIQUE CONSTRAINTS

=head2 C<UniqFullName>

=over 4

=item * L</Prefix>

=item * L</FirstName>

=item * L</MiddleName>

=item * L</LastName>

=item * L</Suffix>

=item * L</BrnchId>

=item * L</NickName>

=back

=cut

__PACKAGE__->add_unique_constraint(
  "UniqFullName",
  [
    "Prefix",
    "FirstName",
    "MiddleName",
    "LastName",
    "Suffix",
    "BrnchId",
    "NickName",
  ],
);

=head1 RELATIONS

=head2 app_roles_created_by

Type: has_many

Related object: L<TMS::Schema::Result::AppRole>

=cut

__PACKAGE__->has_many(
  "app_roles_created_by",
  "TMS::Schema::Result::AppRole",
  { "foreign.CreatedBy" => "self.PrsnId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 app_roles_updated_by

Type: has_many

Related object: L<TMS::Schema::Result::AppRole>

=cut

__PACKAGE__->has_many(
  "app_roles_updated_by",
  "TMS::Schema::Result::AppRole",
  { "foreign.UpdatedBy" => "self.PrsnId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 brnch

Type: belongs_to

Related object: L<TMS::Schema::Result::BizBranch>

=cut

__PACKAGE__->belongs_to(
  "brnch",
  "TMS::Schema::Result::BizBranch",
  { BrnchId => "BrnchId" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);

=head2 cmm_assignments

Type: has_many

Related object: L<TMS::Schema::Result::CmmAssignment>

=cut

__PACKAGE__->has_many(
  "cmm_assignments",
  "TMS::Schema::Result::CmmAssignment",
  { "foreign.AddedBy" => "self.PrsnId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 cmm_assignments_customers

Type: has_many

Related object: L<TMS::Schema::Result::CmmAssignmentsCustomer>

=cut

__PACKAGE__->has_many(
  "cmm_assignments_customers",
  "TMS::Schema::Result::CmmAssignmentsCustomer",
  { "foreign.AddedBy" => "self.PrsnId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 cmm_assignments_groups

Type: has_many

Related object: L<TMS::Schema::Result::CmmAssignmentsGroup>

=cut

__PACKAGE__->has_many(
  "cmm_assignments_groups",
  "TMS::Schema::Result::CmmAssignmentsGroup",
  { "foreign.AddedBy" => "self.PrsnId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 dsp_blacklists

Type: has_many

Related object: L<TMS::Schema::Result::DspBlacklist>

=cut

__PACKAGE__->has_many(
  "dsp_blacklists",
  "TMS::Schema::Result::DspBlacklist",
  { "foreign.Creator" => "self.PrsnId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 dsp_loads

Type: has_many

Related object: L<TMS::Schema::Result::DspLoad>

=cut

__PACKAGE__->has_many(
  "dsp_loads",
  "TMS::Schema::Result::DspLoad",
  { "foreign.CreatedBy" => "self.PrsnId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 dsp_loads_destinations_docs

Type: has_many

Related object: L<TMS::Schema::Result::DspLoadsDestinationsDoc>

=cut

__PACKAGE__->has_many(
  "dsp_loads_destinations_docs",
  "TMS::Schema::Result::DspLoadsDestinationsDoc",
  { "foreign.ApprovedBy" => "self.PrsnId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 dsp_loads_docs

Type: has_many

Related object: L<TMS::Schema::Result::DspLoadsDoc>

=cut

__PACKAGE__->has_many(
  "dsp_loads_docs",
  "TMS::Schema::Result::DspLoadsDoc",
  { "foreign.AddedBy" => "self.PrsnId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 dsp_loads_to_units

Type: has_many

Related object: L<TMS::Schema::Result::DspLoadsToUnit>

=cut

__PACKAGE__->has_many(
  "dsp_loads_to_units",
  "TMS::Schema::Result::DspLoadsToUnit",
  { "foreign.AddedBy" => "self.PrsnId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 dsp_trips_loads

Type: has_many

Related object: L<TMS::Schema::Result::DspTripsLoad>

=cut

__PACKAGE__->has_many(
  "dsp_trips_loads",
  "TMS::Schema::Result::DspTripsLoad",
  { "foreign.AddedBy" => "self.PrsnId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 entities

Type: has_many

Related object: L<TMS::Schema::Result::Entity>

=cut

__PACKAGE__->has_many(
  "entities",
  "TMS::Schema::Result::Entity",
  { "foreign.PersonId" => "self.PrsnId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 fin_billing_tags

Type: has_many

Related object: L<TMS::Schema::Result::FinBillingTag>

=cut

__PACKAGE__->has_many(
  "fin_billing_tags",
  "TMS::Schema::Result::FinBillingTag",
  { "foreign.CreatedBy" => "self.PrsnId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 fin_cheques_authorizeds_by

Type: has_many

Related object: L<TMS::Schema::Result::FinCheque>

=cut

__PACKAGE__->has_many(
  "fin_cheques_authorizeds_by",
  "TMS::Schema::Result::FinCheque",
  { "foreign.AuthorizedBy" => "self.PrsnId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 fin_cheques_created_by

Type: has_many

Related object: L<TMS::Schema::Result::FinCheque>

=cut

__PACKAGE__->has_many(
  "fin_cheques_created_by",
  "TMS::Schema::Result::FinCheque",
  { "foreign.CreatedBy" => "self.PrsnId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 fin_cheques_prints

Type: has_many

Related object: L<TMS::Schema::Result::FinChequesPrint>

=cut

__PACKAGE__->has_many(
  "fin_cheques_prints",
  "TMS::Schema::Result::FinChequesPrint",
  { "foreign.PrintedBy" => "self.PrsnId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 fin_cheques_voided_by

Type: has_many

Related object: L<TMS::Schema::Result::FinCheque>

=cut

__PACKAGE__->has_many(
  "fin_cheques_voided_by",
  "TMS::Schema::Result::FinCheque",
  { "foreign.VoidedBy" => "self.PrsnId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 fin_invoice_payments

Type: has_many

Related object: L<TMS::Schema::Result::FinInvoicePayment>

=cut

__PACKAGE__->has_many(
  "fin_invoice_payments",
  "TMS::Schema::Result::FinInvoicePayment",
  { "foreign.CreatedBy" => "self.PrsnId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 fin_item_templates_created_by

Type: has_many

Related object: L<TMS::Schema::Result::FinItemTemplate>

=cut

__PACKAGE__->has_many(
  "fin_item_templates_created_by",
  "TMS::Schema::Result::FinItemTemplate",
  { "foreign.CreatedBy" => "self.PrsnId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 fin_item_templates_deleted_by

Type: has_many

Related object: L<TMS::Schema::Result::FinItemTemplate>

=cut

__PACKAGE__->has_many(
  "fin_item_templates_deleted_by",
  "TMS::Schema::Result::FinItemTemplate",
  { "foreign.DeletedBy" => "self.PrsnId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 fin_journal_entries

Type: has_many

Related object: L<TMS::Schema::Result::FinJournalEntry>

=cut

__PACKAGE__->has_many(
  "fin_journal_entries",
  "TMS::Schema::Result::FinJournalEntry",
  { "foreign.CreatedBy" => "self.PrsnId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 fin_scheduled_deductions

Type: has_many

Related object: L<TMS::Schema::Result::FinScheduledDeduction>

=cut

__PACKAGE__->has_many(
  "fin_scheduled_deductions",
  "TMS::Schema::Result::FinScheduledDeduction",
  { "foreign.CreatedBy" => "self.PrsnId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 fin_transactions

Type: has_many

Related object: L<TMS::Schema::Result::FinTransaction>

=cut

__PACKAGE__->has_many(
  "fin_transactions",
  "TMS::Schema::Result::FinTransaction",
  { "foreign.CreatedBy" => "self.PrsnId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 hr_associate

Type: might_have

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->might_have(
  "hr_associate",
  "TMS::Schema::Result::HrAssociate",
  { "foreign.AstId" => "self.PrsnId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ins_policies

Type: has_many

Related object: L<TMS::Schema::Result::InsPolicy>

=cut

__PACKAGE__->has_many(
  "ins_policies",
  "TMS::Schema::Result::InsPolicy",
  { "foreign.ProviderAgent" => "self.PrsnId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 sft_vehicle_inspections

Type: has_many

Related object: L<TMS::Schema::Result::SftVehicleInspection>

=cut

__PACKAGE__->has_many(
  "sft_vehicle_inspections",
  "TMS::Schema::Result::SftVehicleInspection",
  { "foreign.InspectorId" => "self.PrsnId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 tsk_actns

Type: has_many

Related object: L<TMS::Schema::Result::TskActn>

=cut

__PACKAGE__->has_many(
  "tsk_actns",
  "TMS::Schema::Result::TskActn",
  { "foreign.PrsnId" => "self.PrsnId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 tsk_ntfis

Type: has_many

Related object: L<TMS::Schema::Result::TskNtfi>

=cut

__PACKAGE__->has_many(
  "tsk_ntfis",
  "TMS::Schema::Result::TskNtfi",
  { "foreign.PrsnId" => "self.PrsnId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 tsk_resps

Type: has_many

Related object: L<TMS::Schema::Result::TskResp>

=cut

__PACKAGE__->has_many(
  "tsk_resps",
  "TMS::Schema::Result::TskResp",
  { "foreign.PrsnId" => "self.PrsnId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 tsk_tasks

Type: has_many

Related object: L<TMS::Schema::Result::TskTask>

=cut

__PACKAGE__->has_many(
  "tsk_tasks",
  "TMS::Schema::Result::TskTask",
  { "foreign.PrsnId" => "self.PrsnId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 tsk_times

Type: has_many

Related object: L<TMS::Schema::Result::TskTime>

=cut

__PACKAGE__->has_many(
  "tsk_times",
  "TMS::Schema::Result::TskTime",
  { "foreign.PrsnId" => "self.PrsnId" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-05 15:51:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:pVd1Sudd/yjuu6M33U3mSA


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;