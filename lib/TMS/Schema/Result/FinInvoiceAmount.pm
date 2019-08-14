use utf8;
package TMS::Schema::Result::FinInvoiceAmount;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::FinInvoiceAmount - VIEW

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';
__PACKAGE__->table_class("DBIx::Class::ResultSource::View");

=head1 TABLE: C<fin_invoice_amounts>

=cut

__PACKAGE__->table("fin_invoice_amounts");
__PACKAGE__->result_source_instance->view_definition("select `inv`.`InvoiceId` AS `InvoiceId`,`inv`.`EntityId` AS `EntityId`,`inv`.`PaymentTermsId` AS `PaymentTermsId`,`inv`.`DateCreated` AS `DateCreated`,`inv`.`RefNumber` AS `RefNumber`,`inv`.`Notes` AS `Notes`,`inv`.`Comments` AS `Comments`,`inv`.`PONumber` AS `PONumber`,`inv`.`Status` AS `Status`,`inv`.`DateInvoiced` AS `DateInvoiced`,`inv`.`FactoredParent` AS `FactoredParent`,sum(`inv_i`.`Amount`) AS `Amount` from (`tms`.`fin_invoices` `inv` left join `tms`.`fin_invoices_items` `inv_i` on((`inv`.`InvoiceId` = `inv_i`.`InvoiceId`))) group by `inv`.`InvoiceId`");

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
  is_nullable: 0

=head2 PaymentTermsId

  accessor: 'payment_terms_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 DateCreated

  accessor: 'date_created'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: '0000-00-00 00:00:00'
  is_nullable: 0

=head2 RefNumber

  accessor: 'ref_number'
  data_type: 'varchar'
  is_nullable: 1
  size: 20

=head2 Notes

  accessor: 'notes'
  data_type: 'text'
  is_nullable: 1

=head2 Comments

  accessor: 'comments'
  data_type: 'text'
  is_nullable: 1

=head2 PONumber

  accessor: 'ponumber'
  data_type: 'varchar'
  is_nullable: 1
  size: 32

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
  is_nullable: 1

=head2 Amount

  accessor: 'amount'
  data_type: 'decimal'
  is_nullable: 1
  size: [34,2]

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
    accessor    => "entity_id",
    data_type   => "bigint",
    extra       => { unsigned => 1 },
    is_nullable => 0,
  },
  "PaymentTermsId",
  {
    accessor    => "payment_terms_id",
    data_type   => "bigint",
    extra       => { unsigned => 1 },
    is_nullable => 0,
  },
  "DateCreated",
  {
    accessor => "date_created",
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    default_value => "0000-00-00 00:00:00",
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
  { accessor => "notes", data_type => "text", is_nullable => 1 },
  "Comments",
  { accessor => "comments", data_type => "text", is_nullable => 1 },
  "PONumber",
  {
    accessor => "ponumber",
    data_type => "varchar",
    is_nullable => 1,
    size => 32,
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
    accessor    => "factored_parent",
    data_type   => "bigint",
    extra       => { unsigned => 1 },
    is_nullable => 1,
  },
  "Amount",
  {
    accessor => "amount",
    data_type => "decimal",
    is_nullable => 1,
    size => [34, 2],
  },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-13 13:28:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:9aX6q8T7Zoddf24y1llSAA


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;