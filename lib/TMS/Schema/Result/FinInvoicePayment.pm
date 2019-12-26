use utf8;

package TMS::Schema::Result::FinInvoicePayment;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::FinInvoicePayment

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<fin_invoice_payments>

=cut

__PACKAGE__->table("fin_invoice_payments");

=head1 ACCESSORS

=head2 InvoicePaymentId

  accessor: 'invoice_payment_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 InvoiceId

  accessor: 'invoice_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 TransactionId

  accessor: 'transaction_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 PaymentMethodId

  accessor: 'payment_method_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 PayerId

  accessor: 'payer_id'
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

=head2 Amount

  accessor: 'amount'
  data_type: 'decimal'
  extra: {unsigned => 1}
  is_nullable: 0
  size: [12,2]

=head2 DateCreated

  accessor: 'date_created'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 0

=head2 DatePayment

  accessor: 'date_payment'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 0

=head2 Valid

  accessor: 'valid'
  data_type: 'tinyint'
  default_value: 1
  extra: {unsigned => 1}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "InvoicePaymentId",
    {   accessor          => "invoice_payment_id",
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
        is_nullable    => 0,
    },
    "TransactionId",
    {   accessor       => "transaction_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "PaymentMethodId",
    {   accessor       => "payment_method_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "PayerId",
    {   accessor       => "payer_id",
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
    "Amount",
    {   accessor    => "amount",
        data_type   => "decimal",
        extra       => {unsigned => 1},
        is_nullable => 0,
        size        => [12, 2],
    },
    "DateCreated",
    {   accessor                  => "date_created",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        default_value             => "CURRENT_TIMESTAMP",
        is_nullable               => 0,
    },
    "DatePayment",
    {   accessor                  => "date_payment",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        default_value             => "CURRENT_TIMESTAMP",
        is_nullable               => 0,
    },
    "Valid",
    {   accessor      => "valid",
        data_type     => "tinyint",
        default_value => 1,
        extra         => {unsigned => 1},
        is_nullable   => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</InvoicePaymentId>

=back

=cut

__PACKAGE__->set_primary_key("InvoicePaymentId");

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

=head2 fin_invoice_payment_items

Type: has_many

Related object: L<TMS::Schema::Result::FinInvoicePaymentItem>

=cut

__PACKAGE__->has_many(
    "fin_invoice_payment_items",
    "TMS::Schema::Result::FinInvoicePaymentItem",
    {"foreign.InvoicePaymentId" => "self.InvoicePaymentId"},
    {cascade_copy               => 0, cascade_delete => 0},
);

=head2 invoice

Type: belongs_to

Related object: L<TMS::Schema::Result::FinInvoice>

=cut

__PACKAGE__->belongs_to(
    "invoice",
    "TMS::Schema::Result::FinInvoice",
    {InvoiceId     => "InvoiceId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 payer

Type: belongs_to

Related object: L<TMS::Schema::Result::Entity>

=cut

__PACKAGE__->belongs_to(
    "payer", "TMS::Schema::Result::Entity",
    {EntityId      => "PayerId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 payment_method

Type: belongs_to

Related object: L<TMS::Schema::Result::FinPaymentMethod>

=cut

__PACKAGE__->belongs_to(
    "payment_method",
    "TMS::Schema::Result::FinPaymentMethod",
    {PaymentMethodId => "PaymentMethodId"},
    {is_deferrable   => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
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

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-25 21:12:39
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:eKr9nFSGNtMFdhu1+19w0g

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
