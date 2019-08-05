use utf8;
package TMS::Schema::Result::FinInvoiceFactoredItem;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::FinInvoiceFactoredItem - VIEW

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';
__PACKAGE__->table_class("DBIx::Class::ResultSource::View");

=head1 TABLE: C<fin_invoice_factored_items>

=cut

__PACKAGE__->table("fin_invoice_factored_items");
__PACKAGE__->result_source_instance->view_definition("select `inv_r`.`RootInvoiceId` AS `InvoiceId`,`inv_i`.`InvoiceItemId` AS `InvoiceItemId`,`inv_i`.`InvoiceId` AS `BaseInvoiceId`,`inv_i`.`ItemTemplateId` AS `ItemTemplateId`,`inv_i`.`Amount` AS `Amount`,`inv_i`.`Quantity` AS `Quantity`,`inv_i`.`CreatedBy` AS `CreatedBy`,`inv_i`.`DateCreated` AS `DateCreated`,`inv_i`.`Notes` AS `Notes`,`inv_i`.`Comments` AS `Comments`,`inv_i`.`CreditJournalEntryId` AS `CreditJournalEntryId`,`inv_i`.`DebitJournalEntryId` AS `DebitJournalEntryId`,`inv_i`.`JobId` AS `JobId` from (((select `root`.`AncestorId` AS `RootInvoiceId`,`root`.`DescendantId` AS `BaseInvoiceId` from (`tms`.`fin_invoice_factor_trees` `root` join `tms`.`fin_invoice_factor_trees` `base`) where ((`root`.`DescendantId` = `base`.`AncestorId`) and (`base`.`AncestorId` = `base`.`DescendantId`) and (not(exists(select 1 from `tms`.`fin_invoice_factor_trees` `d` where (`d`.`DescendantId` = `root`.`AncestorId`))))))) `inv_r` left join `tms`.`fin_invoices_items` `inv_i` on((`inv_i`.`InvoiceId` = `inv_r`.`BaseInvoiceId`))) where (not(exists(select 1 from `tms`.`fin_invoice_factor_trees` `b` where ((`b`.`AncestorId` = `inv_r`.`BaseInvoiceId`) and (`b`.`Depth` > 1))))) order by `inv_r`.`RootInvoiceId`");

=head1 ACCESSORS

=head2 InvoiceId

  accessor: 'invoice_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 InvoiceItemId

  accessor: 'invoice_item_id'
  data_type: 'bigint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 1

=head2 BaseInvoiceId

  accessor: 'base_invoice_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 ItemTemplateId

  accessor: 'item_template_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 Amount

  accessor: 'amount'
  data_type: 'decimal'
  is_nullable: 1
  size: [12,2]

=head2 Quantity

  accessor: 'quantity'
  data_type: 'bigint'
  default_value: 1
  extra: {unsigned => 1}
  is_nullable: 1

=head2 CreatedBy

  accessor: 'created_by'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 DateCreated

  accessor: 'date_created'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: '0000-00-00 00:00:00'
  is_nullable: 1

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

=head2 CreditJournalEntryId

  accessor: 'credit_journal_entry_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 DebitJournalEntryId

  accessor: 'debit_journal_entry_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 JobId

  accessor: 'job_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
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
  "InvoiceItemId",
  {
    accessor      => "invoice_item_id",
    data_type     => "bigint",
    default_value => 0,
    extra         => { unsigned => 1 },
    is_nullable   => 1,
  },
  "BaseInvoiceId",
  {
    accessor    => "base_invoice_id",
    data_type   => "bigint",
    extra       => { unsigned => 1 },
    is_nullable => 1,
  },
  "ItemTemplateId",
  {
    accessor    => "item_template_id",
    data_type   => "bigint",
    extra       => { unsigned => 1 },
    is_nullable => 1,
  },
  "Amount",
  {
    accessor => "amount",
    data_type => "decimal",
    is_nullable => 1,
    size => [12, 2],
  },
  "Quantity",
  {
    accessor      => "quantity",
    data_type     => "bigint",
    default_value => 1,
    extra         => { unsigned => 1 },
    is_nullable   => 1,
  },
  "CreatedBy",
  {
    accessor    => "created_by",
    data_type   => "bigint",
    extra       => { unsigned => 1 },
    is_nullable => 1,
  },
  "DateCreated",
  {
    accessor => "date_created",
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    default_value => "0000-00-00 00:00:00",
    is_nullable => 1,
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
  "CreditJournalEntryId",
  {
    accessor    => "credit_journal_entry_id",
    data_type   => "bigint",
    extra       => { unsigned => 1 },
    is_nullable => 1,
  },
  "DebitJournalEntryId",
  {
    accessor    => "debit_journal_entry_id",
    data_type   => "bigint",
    extra       => { unsigned => 1 },
    is_nullable => 1,
  },
  "JobId",
  {
    accessor    => "job_id",
    data_type   => "bigint",
    extra       => { unsigned => 1 },
    is_nullable => 1,
  },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-05 10:27:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:JvtcIUalIKuhrfULrJqSnA


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;