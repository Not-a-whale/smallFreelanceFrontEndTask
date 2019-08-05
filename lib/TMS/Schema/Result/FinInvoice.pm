use utf8;
package TMS::Schema::Result::FinInvoice;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::FinInvoice

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<fin_invoices>

=cut

__PACKAGE__->table("fin_invoices");

=head1 ACCESSORS

=head2 InvoiceId

  accessor: 'invoice_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 EntityId

  accessor: 'entity_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 PaymentTermsId

  accessor: 'payment_terms_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 DateCreated

  accessor: 'date_created'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 0

=head2 RefNumber

  accessor: 'ref_number'
  data_type: 'varchar'
  is_nullable: 1
  size: 20

=head2 Notes

  accessor: 'notes'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 Comments

  accessor: 'comments'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 PONumber

  accessor: 'ponumber'
  data_type: 'varchar'
  is_nullable: 1
  size: 16

=head2 Status

  accessor: 'status'
  data_type: 'enum'
  default_value: 'pending'
  extra: {list => ["invalid","pending","invoiced","paid"]}
  is_nullable: 0

=head2 DateInvoiced

  accessor: 'date_invoiced'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 FactoredParent

  accessor: 'factored_parent'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "InvoiceId",
  {
    accessor    => "invoice_id",
    data_type   => "bigint",
    extra       => { unsigned => 1 },
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
  "PaymentTermsId",
  {
    accessor       => "payment_terms_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "DateCreated",
  {
    accessor => "date_created",
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
  },
  "RefNumber",
  {
    accessor => "ref_number",
    data_type => "varchar",
    is_nullable => 1,
    size => 20,
  },
  "Notes",
  { accessor => "notes", data_type => "varchar", is_nullable => 1, size => 255 },
  "Comments",
  {
    accessor => "comments",
    data_type => "varchar",
    is_nullable => 1,
    size => 255,
  },
  "PONumber",
  {
    accessor => "ponumber",
    data_type => "varchar",
    is_nullable => 1,
    size => 16,
  },
  "Status",
  {
    accessor      => "status",
    data_type     => "enum",
    default_value => "pending",
    extra         => { list => ["invalid", "pending", "invoiced", "paid"] },
    is_nullable   => 0,
  },
  "DateInvoiced",
  {
    accessor => "date_invoiced",
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "FactoredParent",
  {
    accessor       => "factored_parent",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 1,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</InvoiceId>

=back

=cut

__PACKAGE__->set_primary_key("InvoiceId");

=head1 RELATIONS

=head2 entity

Type: belongs_to

Related object: L<TMS::Schema::Result::Entity>

=cut

__PACKAGE__->belongs_to(
  "entity",
  "TMS::Schema::Result::Entity",
  { EntityId => "EntityId" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 factored_parent

Type: belongs_to

Related object: L<TMS::Schema::Result::FinInvoice>

=cut

__PACKAGE__->belongs_to(
  "factored_parent",
  "TMS::Schema::Result::FinInvoice",
  { InvoiceId => "FactoredParent" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 fin_invoice_factor_trees_ancestors

Type: has_many

Related object: L<TMS::Schema::Result::FinInvoiceFactorTree>

=cut

__PACKAGE__->has_many(
  "fin_invoice_factor_trees_ancestors",
  "TMS::Schema::Result::FinInvoiceFactorTree",
  { "foreign.AncestorId" => "self.InvoiceId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 fin_invoice_factor_trees_descendants

Type: has_many

Related object: L<TMS::Schema::Result::FinInvoiceFactorTree>

=cut

__PACKAGE__->has_many(
  "fin_invoice_factor_trees_descendants",
  "TMS::Schema::Result::FinInvoiceFactorTree",
  { "foreign.DescendantId" => "self.InvoiceId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 fin_invoice_payments

Type: has_many

Related object: L<TMS::Schema::Result::FinInvoicePayment>

=cut

__PACKAGE__->has_many(
  "fin_invoice_payments",
  "TMS::Schema::Result::FinInvoicePayment",
  { "foreign.InvoiceId" => "self.InvoiceId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 fin_invoices

Type: has_many

Related object: L<TMS::Schema::Result::FinInvoice>

=cut

__PACKAGE__->has_many(
  "fin_invoices",
  "TMS::Schema::Result::FinInvoice",
  { "foreign.FactoredParent" => "self.InvoiceId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 fin_invoices_items

Type: has_many

Related object: L<TMS::Schema::Result::FinInvoicesItem>

=cut

__PACKAGE__->has_many(
  "fin_invoices_items",
  "TMS::Schema::Result::FinInvoicesItem",
  { "foreign.InvoiceId" => "self.InvoiceId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 payment_term

Type: belongs_to

Related object: L<TMS::Schema::Result::FinPaymentTerm>

=cut

__PACKAGE__->belongs_to(
  "payment_term",
  "TMS::Schema::Result::FinPaymentTerm",
  { PaymentTermId => "PaymentTermsId" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-05 10:27:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:2bVlTuuJfmQWF1yg/cyNOw


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;