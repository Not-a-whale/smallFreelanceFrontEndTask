use utf8;

package TMS::Schema::Result::FinJournalEntry;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::FinJournalEntry

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<fin_journal_entries>

=cut

__PACKAGE__->table("fin_journal_entries");

=head1 ACCESSORS

=head2 JrlEntryId

  accessor: 'jrl_entry_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 TransactionId

  accessor: 'transaction_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 AccountId

  accessor: 'account_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 EntityId

  accessor: 'entity_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
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

=head2 DebitCredit

  accessor: 'debit_credit'
  data_type: 'enum'
  default_value: 'debit'
  extra: {list => ["debit","credit"]}
  is_nullable: 0

=head2 Amount

  accessor: 'amount'
  data_type: 'decimal'
  is_nullable: 0
  size: [12,2]

=head2 Classification

  accessor: 'classification'
  data_type: 'enum'
  default_value: 'customer'
  extra: {list => ["customer","vendor"]}
  is_nullable: 0

=head2 JobId

  accessor: 'job_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 VendorAmount

  accessor: 'vendor_amount'
  data_type: 'decimal'
  is_nullable: 1
  size: [12,2]

The amount to show for customer invoices

=head2 ReportAmount

  accessor: 'report_amount'
  data_type: 'decimal'
  is_nullable: 1
  size: [12,2]

The amount to show on reports.

=cut

__PACKAGE__->add_columns(
    "JrlEntryId",
    {   accessor          => "jrl_entry_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "TransactionId",
    {   accessor       => "transaction_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "AccountId",
    {   accessor       => "account_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "EntityId",
    {   accessor       => "entity_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
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
    "DebitCredit",
    {   accessor      => "debit_credit",
        data_type     => "enum",
        default_value => "debit",
        extra         => {list => ["debit", "credit"]},
        is_nullable   => 0,
    },
    "Amount",
    {   accessor    => "amount",
        data_type   => "decimal",
        is_nullable => 0,
        size        => [12, 2],
    },
    "Classification",
    {   accessor      => "classification",
        data_type     => "enum",
        default_value => "customer",
        extra         => {list => ["customer", "vendor"]},
        is_nullable   => 0,
    },
    "JobId",
    {   accessor       => "job_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "VendorAmount",
    {   accessor    => "vendor_amount",
        data_type   => "decimal",
        is_nullable => 1,
        size        => [12, 2],
    },
    "ReportAmount",
    {   accessor    => "report_amount",
        data_type   => "decimal",
        is_nullable => 1,
        size        => [12, 2],
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</JrlEntryId>

=back

=cut

__PACKAGE__->set_primary_key("JrlEntryId");

=head1 RELATIONS

=head2 account

Type: belongs_to

Related object: L<TMS::Schema::Result::FinAccount>

=cut

__PACKAGE__->belongs_to(
    "account",
    "TMS::Schema::Result::FinAccount",
    {AccountId     => "AccountId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

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

=head2 entity

Type: belongs_to

Related object: L<TMS::Schema::Result::Entity>

=cut

__PACKAGE__->belongs_to(
    "entity", "TMS::Schema::Result::Entity",
    {EntityId      => "EntityId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 fin_invoices_items_credit_journal_entries

Type: has_many

Related object: L<TMS::Schema::Result::FinInvoicesItem>

=cut

__PACKAGE__->has_many(
    "fin_invoices_items_credit_journal_entries", "TMS::Schema::Result::FinInvoicesItem",
    {"foreign.CreditJournalEntryId" => "self.JrlEntryId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 fin_invoices_items_debit_journal_entries

Type: has_many

Related object: L<TMS::Schema::Result::FinInvoicesItem>

=cut

__PACKAGE__->has_many(
    "fin_invoices_items_debit_journal_entries", "TMS::Schema::Result::FinInvoicesItem",
    {"foreign.DebitJournalEntryId" => "self.JrlEntryId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 job

Type: belongs_to

Related object: L<TMS::Schema::Result::FinJob>

=cut

__PACKAGE__->belongs_to(
    "job",
    "TMS::Schema::Result::FinJob",
    {JobId => "JobId"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

=head2 transaction

Type: belongs_to

Related object: L<TMS::Schema::Result::FinTransaction>

=cut

__PACKAGE__->belongs_to(
    "transaction",
    "TMS::Schema::Result::FinTransaction",
    {TransactionId => "TransactionId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-01-08 09:43:54
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:vRrNVGshe5R6MFHVQs8APw

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
