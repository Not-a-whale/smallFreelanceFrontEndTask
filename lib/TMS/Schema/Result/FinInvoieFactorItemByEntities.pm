use utf8;
package TMS::Schema::Result::FinInvoieFactorItemByEntities;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::FinInvoieFactorItemByEntities - VIEW

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';
__PACKAGE__->table_class("DBIx::Class::ResultSource::View");

=head1 TABLE: C<fin_invoie_factor_item_by_entities>

=cut

__PACKAGE__->table("fin_invoie_factor_item_by_entities");
__PACKAGE__->result_source_instance->view_definition("select `inv_fi`.`InvoiceId` AS `InvoiceId`,`inv_fi`.`InvoiceItemId` AS `InvoiceItemId`,`inv_fi`.`BaseInvoiceId` AS `BaseInvoiceId`,`inv_fi`.`ItemTemplateId` AS `InvoiceItemTemplateId`,`inv_fi`.`Amount` AS `InvoiceAmount`,`inv_fi`.`Quantity` AS `InvoiceQuantity`,`inv_fi`.`CreatedBy` AS `InvoiceCreatedBy`,`inv_fi`.`DateCreated` AS `InvoiceDateCreated`,`inv_fi`.`Notes` AS `InvoiceNotes`,`inv_fi`.`Comments` AS `InvoiceComments`,`inv_fi`.`CreditJournalEntryId` AS `CreditJournalEntryId`,`inv_fi`.`DebitJournalEntryId` AS `DebitJournalEntryId`,`inv_fi`.`JobId` AS `InvoiceJobId`,`jrl`.`JrlEntryId` AS `JrlEntryId`,`jrl`.`TransactionId` AS `JrlTransactionId`,`jrl`.`AccountId` AS `JrlAccountId`,`jrl`.`EntityId` AS `JrlEntityId`,`jrl`.`CreatedBy` AS `JrlCreatedBy`,`jrl`.`DateCreated` AS `JrlDateCreated`,`jrl`.`DebitCredit` AS `JrlDebitCredit`,`jrl`.`Amount` AS `JrlAmount`,`jrl`.`Classification` AS `JrlClassification`,`jrl`.`JobId` AS `JrlJobId` from (`tms`.`fin_invoice_factored_items` `inv_fi` left join `tms`.`fin_journal_entries` `jrl` on(((`inv_fi`.`CreditJournalEntryId` = `jrl`.`JrlEntryId`) or (`inv_fi`.`DebitJournalEntryId` = `jrl`.`JrlEntryId`))))");

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

=head2 InvoiceItemTemplateId

  accessor: 'invoice_item_template_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 InvoiceAmount

  accessor: 'invoice_amount'
  data_type: 'decimal'
  is_nullable: 1
  size: [12,2]

=head2 InvoiceQuantity

  accessor: 'invoice_quantity'
  data_type: 'bigint'
  default_value: 1
  extra: {unsigned => 1}
  is_nullable: 1

=head2 InvoiceCreatedBy

  accessor: 'invoice_created_by'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 InvoiceDateCreated

  accessor: 'invoice_date_created'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: '0000-00-00 00:00:00'
  is_nullable: 1

=head2 InvoiceNotes

  accessor: 'invoice_notes'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 InvoiceComments

  accessor: 'invoice_comments'
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

=head2 InvoiceJobId

  accessor: 'invoice_job_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 JrlEntryId

  accessor: 'jrl_entry_id'
  data_type: 'bigint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 1

=head2 JrlTransactionId

  accessor: 'jrl_transaction_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 JrlAccountId

  accessor: 'jrl_account_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 JrlEntityId

  accessor: 'jrl_entity_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 JrlCreatedBy

  accessor: 'jrl_created_by'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 JrlDateCreated

  accessor: 'jrl_date_created'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: '0000-00-00 00:00:00'
  is_nullable: 1

=head2 JrlDebitCredit

  accessor: 'jrl_debit_credit'
  data_type: 'enum'
  default_value: 'debit'
  extra: {list => ["debit","credit"]}
  is_nullable: 1

=head2 JrlAmount

  accessor: 'jrl_amount'
  data_type: 'decimal'
  is_nullable: 1
  size: [12,2]

=head2 JrlClassification

  accessor: 'jrl_classification'
  data_type: 'enum'
  default_value: 'customer'
  extra: {list => ["customer","vendor"]}
  is_nullable: 1

=head2 JrlJobId

  accessor: 'jrl_job_id'
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
  "InvoiceItemTemplateId",
  {
    accessor    => "invoice_item_template_id",
    data_type   => "bigint",
    extra       => { unsigned => 1 },
    is_nullable => 1,
  },
  "InvoiceAmount",
  {
    accessor => "invoice_amount",
    data_type => "decimal",
    is_nullable => 1,
    size => [12, 2],
  },
  "InvoiceQuantity",
  {
    accessor      => "invoice_quantity",
    data_type     => "bigint",
    default_value => 1,
    extra         => { unsigned => 1 },
    is_nullable   => 1,
  },
  "InvoiceCreatedBy",
  {
    accessor    => "invoice_created_by",
    data_type   => "bigint",
    extra       => { unsigned => 1 },
    is_nullable => 1,
  },
  "InvoiceDateCreated",
  {
    accessor => "invoice_date_created",
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    default_value => "0000-00-00 00:00:00",
    is_nullable => 1,
  },
  "InvoiceNotes",
  {
    accessor => "invoice_notes",
    data_type => "varchar",
    is_nullable => 1,
    size => 255,
  },
  "InvoiceComments",
  {
    accessor => "invoice_comments",
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
  "InvoiceJobId",
  {
    accessor    => "invoice_job_id",
    data_type   => "bigint",
    extra       => { unsigned => 1 },
    is_nullable => 1,
  },
  "JrlEntryId",
  {
    accessor      => "jrl_entry_id",
    data_type     => "bigint",
    default_value => 0,
    extra         => { unsigned => 1 },
    is_nullable   => 1,
  },
  "JrlTransactionId",
  {
    accessor    => "jrl_transaction_id",
    data_type   => "bigint",
    extra       => { unsigned => 1 },
    is_nullable => 1,
  },
  "JrlAccountId",
  {
    accessor    => "jrl_account_id",
    data_type   => "bigint",
    extra       => { unsigned => 1 },
    is_nullable => 1,
  },
  "JrlEntityId",
  {
    accessor    => "jrl_entity_id",
    data_type   => "bigint",
    extra       => { unsigned => 1 },
    is_nullable => 1,
  },
  "JrlCreatedBy",
  {
    accessor    => "jrl_created_by",
    data_type   => "bigint",
    extra       => { unsigned => 1 },
    is_nullable => 1,
  },
  "JrlDateCreated",
  {
    accessor => "jrl_date_created",
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    default_value => "0000-00-00 00:00:00",
    is_nullable => 1,
  },
  "JrlDebitCredit",
  {
    accessor      => "jrl_debit_credit",
    data_type     => "enum",
    default_value => "debit",
    extra         => { list => ["debit", "credit"] },
    is_nullable   => 1,
  },
  "JrlAmount",
  {
    accessor => "jrl_amount",
    data_type => "decimal",
    is_nullable => 1,
    size => [12, 2],
  },
  "JrlClassification",
  {
    accessor      => "jrl_classification",
    data_type     => "enum",
    default_value => "customer",
    extra         => { list => ["customer", "vendor"] },
    is_nullable   => 1,
  },
  "JrlJobId",
  {
    accessor    => "jrl_job_id",
    data_type   => "bigint",
    extra       => { unsigned => 1 },
    is_nullable => 1,
  },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-05 15:51:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:UjlL+99FDSA4IrGtnkIlUg


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;