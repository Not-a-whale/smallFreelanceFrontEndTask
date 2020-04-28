use utf8;

package TMS::Schema::Result::FinInvoicesItem;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::FinInvoicesItem

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<fin_invoices_items>

=cut

__PACKAGE__->table("fin_invoices_items");

=head1 ACCESSORS

=head2 InvoiceItemId

  accessor: 'invoice_item_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 InvoiceId

  accessor: 'invoice_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 ItemTemplateId

  accessor: 'item_template_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
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
  is_nullable: 0

=head2 CreatedBy

  accessor: 'created_by'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 DateCreated

  accessor: 'date_created'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 0

=head2 Notes

  accessor: 'notes'
  data_type: 'text'
  is_nullable: 1

=head2 Comments

  accessor: 'comments'
  data_type: 'text'
  is_nullable: 1

=head2 CreditJournalEntryId

  accessor: 'credit_journal_entry_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 DebitJournalEntryId

  accessor: 'debit_journal_entry_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 JobId

  accessor: 'job_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "InvoiceItemId",
    {   accessor          => "invoice_item_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "InvoiceId",
    {   accessor       => "invoice_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "ItemTemplateId",
    {   accessor       => "item_template_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "Amount",
    {   accessor    => "amount",
        data_type   => "decimal",
        is_nullable => 1,
        size        => [12, 2],
    },
    "Quantity",
    {   accessor      => "quantity",
        data_type     => "bigint",
        default_value => 1,
        extra         => {unsigned => 1},
        is_nullable   => 0,
    },
    "CreatedBy",
    {   accessor       => "created_by",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "DateCreated",
    {   accessor                  => "date_created",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        default_value             => "CURRENT_TIMESTAMP",
        is_nullable               => 0,
    },
    "Notes",
    {accessor => "notes", data_type => "text", is_nullable => 1},
    "Comments",
    {accessor => "comments", data_type => "text", is_nullable => 1},
    "CreditJournalEntryId",
    {   accessor       => "credit_journal_entry_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "DebitJournalEntryId",
    {   accessor       => "debit_journal_entry_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "JobId",
    {   accessor       => "job_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</InvoiceItemId>

=back

=cut

__PACKAGE__->set_primary_key("InvoiceItemId");

=head1 RELATIONS

=head2 created_by

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
    "created_by",
    "TMS::Schema::Result::HrAssociate",
    {AstId => "CreatedBy"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

=head2 credit_journal_entry

Type: belongs_to

Related object: L<TMS::Schema::Result::FinJournalEntry>

=cut

__PACKAGE__->belongs_to(
    "credit_journal_entry",
    "TMS::Schema::Result::FinJournalEntry",
    {JrlEntryId => "CreditJournalEntryId"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

=head2 debit_journal_entry

Type: belongs_to

Related object: L<TMS::Schema::Result::FinJournalEntry>

=cut

__PACKAGE__->belongs_to(
    "debit_journal_entry",
    "TMS::Schema::Result::FinJournalEntry",
    {JrlEntryId => "DebitJournalEntryId"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

=head2 fin_invoice_payment_items

Type: has_many

Related object: L<TMS::Schema::Result::FinInvoicePaymentItem>

=cut

__PACKAGE__->has_many(
    "fin_invoice_payment_items", "TMS::Schema::Result::FinInvoicePaymentItem",
    {"foreign.InvoiceItemId" => "self.InvoiceItemId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 invoice

Type: belongs_to

Related object: L<TMS::Schema::Result::FinInvoice>

=cut

__PACKAGE__->belongs_to(
    "invoice",
    "TMS::Schema::Result::FinInvoice",
    {InvoiceId => "InvoiceId"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

=head2 item_template

Type: belongs_to

Related object: L<TMS::Schema::Result::FinItemTemplate>

=cut

__PACKAGE__->belongs_to(
    "item_template",
    "TMS::Schema::Result::FinItemTemplate",
    {ItemTemplateId => "ItemTemplateId"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

=head2 job

Type: belongs_to

Related object: L<TMS::Schema::Result::FinJob>

=cut

__PACKAGE__->belongs_to(
    "job", "TMS::Schema::Result::FinJob",
    {JobId         => "JobId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-04-28 11:12:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:KHUzvxjJAtTI+UNsKqf42A

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
