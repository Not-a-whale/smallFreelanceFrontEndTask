use utf8;
package TMS::Schema::Result::FinBillingBank;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::FinBillingBank

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<fin_billing_banks>

=cut

__PACKAGE__->table("fin_billing_banks");

=head1 ACCESSORS

=head2 BankId

  accessor: 'bank_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 BillingId

  accessor: 'billing_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 Institution

  accessor: 'institution'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 AccountNumber

  accessor: 'account_number'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 RoutingNumber

  accessor: 'routing_number'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 AccountType

  accessor: 'account_type'
  data_type: 'enum'
  extra: {list => ["checking","savings"]}
  is_nullable: 0

=head2 Purpose

  accessor: 'purpose'
  data_type: 'enum'
  extra: {list => ["payment","billing","billing and payment","other"]}
  is_nullable: 0

=head2 Active

  accessor: 'active'
  data_type: 'tinyint'
  default_value: 1
  is_nullable: 0

=head2 Notes

  accessor: 'notes'
  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "BankId",
  {
    accessor    => "bank_id",
    data_type   => "bigint",
    extra       => { unsigned => 1 },
    is_nullable => 0,
  },
  "BillingId",
  {
    accessor       => "billing_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "Institution",
  {
    accessor       => "institution",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "AccountNumber",
  {
    accessor => "account_number",
    data_type => "varchar",
    is_nullable => 0,
    size => 255,
  },
  "RoutingNumber",
  {
    accessor => "routing_number",
    data_type => "varchar",
    is_nullable => 0,
    size => 255,
  },
  "AccountType",
  {
    accessor    => "account_type",
    data_type   => "enum",
    extra       => { list => ["checking", "savings"] },
    is_nullable => 0,
  },
  "Purpose",
  {
    accessor    => "purpose",
    data_type   => "enum",
    extra       => { list => ["payment", "billing", "billing and payment", "other"] },
    is_nullable => 0,
  },
  "Active",
  {
    accessor      => "active",
    data_type     => "tinyint",
    default_value => 1,
    is_nullable   => 0,
  },
  "Notes",
  { accessor => "notes", data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</BankId>

=back

=cut

__PACKAGE__->set_primary_key("BankId");

=head1 RELATIONS

=head2 billing

Type: belongs_to

Related object: L<TMS::Schema::Result::FinBillingInfo>

=cut

__PACKAGE__->belongs_to(
  "billing",
  "TMS::Schema::Result::FinBillingInfo",
  { BillingId => "BillingId" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);

=head2 fin_billing_rules

Type: has_many

Related object: L<TMS::Schema::Result::FinBillingRule>

=cut

__PACKAGE__->has_many(
  "fin_billing_rules",
  "TMS::Schema::Result::FinBillingRule",
  { "foreign.BankAccount" => "self.BankId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 institution

Type: belongs_to

Related object: L<TMS::Schema::Result::BizBranch>

=cut

__PACKAGE__->belongs_to(
  "institution",
  "TMS::Schema::Result::BizBranch",
  { BrnchId => "Institution" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-11-21 08:33:44
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/Jzrhh38LLxojQcMs/D5Rw


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;