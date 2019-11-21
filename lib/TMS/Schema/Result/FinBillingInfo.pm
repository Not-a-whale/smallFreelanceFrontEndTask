use utf8;
package TMS::Schema::Result::FinBillingInfo;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::FinBillingInfo

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<fin_billing_infos>

=cut

__PACKAGE__->table("fin_billing_infos");

=head1 ACCESSORS

=head2 BillingId

  accessor: 'billing_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 EntityId

  accessor: 'entity_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 PayToTheOrderOf

  accessor: 'pay_to_the_order_of'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 ContactName

  accessor: 'contact_name'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 Phone

  accessor: 'phone'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 Fax

  accessor: 'fax'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 Address

  accessor: 'address'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 EMail

  accessor: 'email'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 BillingTagId

  accessor: 'billing_tag_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 DateIn

  accessor: 'date_in'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 0

=head2 DateOut

  accessor: 'date_out'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 Notes

  accessor: 'notes'
  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "BillingId",
  {
    accessor => "billing_id",
    data_type => "bigint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "EntityId",
  {
    accessor       => "entity_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "PayToTheOrderOf",
  {
    accessor => "pay_to_the_order_of",
    data_type => "varchar",
    is_nullable => 0,
    size => 255,
  },
  "ContactName",
  {
    accessor => "contact_name",
    data_type => "varchar",
    is_nullable => 1,
    size => 255,
  },
  "Phone",
  {
    accessor       => "phone",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "Fax",
  {
    accessor       => "fax",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 1,
  },
  "Address",
  {
    accessor       => "address",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "EMail",
  { accessor => "email", data_type => "varchar", is_nullable => 1, size => 255 },
  "BillingTagId",
  {
    accessor       => "billing_tag_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "DateIn",
  {
    accessor => "date_in",
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
  },
  "DateOut",
  {
    accessor => "date_out",
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "Notes",
  { accessor => "notes", data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</BillingId>

=back

=cut

__PACKAGE__->set_primary_key("BillingId");

=head1 RELATIONS

=head2 address

Type: belongs_to

Related object: L<TMS::Schema::Result::CntAddress>

=cut

__PACKAGE__->belongs_to(
  "address",
  "TMS::Schema::Result::CntAddress",
  { AddrId => "Address" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);

=head2 billing_tag

Type: belongs_to

Related object: L<TMS::Schema::Result::FinBillingTag>

=cut

__PACKAGE__->belongs_to(
  "billing_tag",
  "TMS::Schema::Result::FinBillingTag",
  { BillingTagId => "BillingTagId" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);

=head2 entity

Type: belongs_to

Related object: L<TMS::Schema::Result::Entity>

=cut

__PACKAGE__->belongs_to(
  "entity",
  "TMS::Schema::Result::Entity",
  { EntityId => "EntityId" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);

=head2 fax

Type: belongs_to

Related object: L<TMS::Schema::Result::CntPhonesfax>

=cut

__PACKAGE__->belongs_to(
  "fax",
  "TMS::Schema::Result::CntPhonesfax",
  { PhnFaxId => "Fax" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "CASCADE",
  },
);

=head2 fin_billing_banks

Type: has_many

Related object: L<TMS::Schema::Result::FinBillingBank>

=cut

__PACKAGE__->has_many(
  "fin_billing_banks",
  "TMS::Schema::Result::FinBillingBank",
  { "foreign.BillingId" => "self.BillingId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 phone

Type: belongs_to

Related object: L<TMS::Schema::Result::CntPhonesfax>

=cut

__PACKAGE__->belongs_to(
  "phone",
  "TMS::Schema::Result::CntPhonesfax",
  { PhnFaxId => "Phone" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-11-21 08:33:44
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Q/ZWj2iylgrXtGOLthNpfg


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;