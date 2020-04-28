use utf8;

package TMS::Schema::Result::FinTransaction;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::FinTransaction

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<fin_transactions>

=cut

__PACKAGE__->table("fin_transactions");

=head1 ACCESSORS

=head2 TransactionId

  accessor: 'transaction_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 TransactionType

  accessor: 'transaction_type'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 RefNumber

  accessor: 'ref_number'
  data_type: 'varchar'
  is_nullable: 1
  size: 20

=head2 JobId

  accessor: 'job_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

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

=head2 DateTransaction

  accessor: 'date_transaction'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 1

=head2 Status

  accessor: 'status'
  data_type: 'enum'
  extra: {list => ["pending","valid","invalid"]}
  is_nullable: 1

=head2 Class

  accessor: 'class'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 Memo

  accessor: 'memo'
  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
    "TransactionId",
    {   accessor          => "transaction_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "TransactionType",
    {   accessor       => "transaction_type",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "RefNumber",
    {   accessor    => "ref_number",
        data_type   => "varchar",
        is_nullable => 1,
        size        => 20,
    },
    "JobId",
    {   accessor       => "job_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
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
    "DateTransaction",
    {   accessor                  => "date_transaction",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        default_value             => "CURRENT_TIMESTAMP",
        is_nullable               => 1,
    },
    "Status",
    {   accessor    => "status",
        data_type   => "enum",
        extra       => {list => ["pending", "valid", "invalid"]},
        is_nullable => 1,
    },
    "Class",
    {   accessor       => "class",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "Memo",
    {accessor => "memo", data_type => "text", is_nullable => 1},
);

=head1 PRIMARY KEY

=over 4

=item * L</TransactionId>

=back

=cut

__PACKAGE__->set_primary_key("TransactionId");

=head1 RELATIONS

=head2 class

Type: belongs_to

Related object: L<TMS::Schema::Result::FinClass>

=cut

__PACKAGE__->belongs_to(
    "class",
    "TMS::Schema::Result::FinClass",
    {ClassId => "Class"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
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

=head2 fin_cheques

Type: has_many

Related object: L<TMS::Schema::Result::FinCheque>

=cut

__PACKAGE__->has_many(
    "fin_cheques",
    "TMS::Schema::Result::FinCheque",
    {"foreign.TransactionId" => "self.TransactionId"},
    {cascade_copy            => 0, cascade_delete => 0},
);

=head2 fin_invoice_payments

Type: has_many

Related object: L<TMS::Schema::Result::FinInvoicePayment>

=cut

__PACKAGE__->has_many(
    "fin_invoice_payments", "TMS::Schema::Result::FinInvoicePayment",
    {"foreign.TransactionId" => "self.TransactionId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 fin_journal_entries

Type: has_many

Related object: L<TMS::Schema::Result::FinJournalEntry>

=cut

__PACKAGE__->has_many(
    "fin_journal_entries",
    "TMS::Schema::Result::FinJournalEntry",
    {"foreign.TransactionId" => "self.TransactionId"},
    {cascade_copy            => 0, cascade_delete => 0},
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

=head2 transaction_type

Type: belongs_to

Related object: L<TMS::Schema::Result::FinTransactionType>

=cut

__PACKAGE__->belongs_to(
    "transaction_type",
    "TMS::Schema::Result::FinTransactionType",
    {TransTypeId   => "TransactionType"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-04-28 11:12:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Ek1xEncH01iT1ENqRCOCWw

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
