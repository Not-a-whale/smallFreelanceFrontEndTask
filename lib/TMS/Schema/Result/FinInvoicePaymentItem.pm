use utf8;

package TMS::Schema::Result::FinInvoicePaymentItem;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::FinInvoicePaymentItem - Which items have been paid for

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<fin_invoice_payment_items>

=cut

__PACKAGE__->table("fin_invoice_payment_items");

=head1 ACCESSORS

=head2 InvoicePaymentItemId

  accessor: 'invoice_payment_item_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 InvoicePaymentId

  accessor: 'invoice_payment_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 InvoiceItemId

  accessor: 'invoice_item_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "InvoicePaymentItemId",
    {   accessor          => "invoice_payment_item_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "InvoicePaymentId",
    {   accessor       => "invoice_payment_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "InvoiceItemId",
    {   accessor       => "invoice_item_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</InvoicePaymentItemId>

=back

=cut

__PACKAGE__->set_primary_key("InvoicePaymentItemId");

=head1 RELATIONS

=head2 invoice_item

Type: belongs_to

Related object: L<TMS::Schema::Result::FinInvoicesItem>

=cut

__PACKAGE__->belongs_to(
    "invoice_item",
    "TMS::Schema::Result::FinInvoicesItem",
    {InvoiceItemId => "InvoiceItemId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 invoice_payment

Type: belongs_to

Related object: L<TMS::Schema::Result::FinInvoicePayment>

=cut

__PACKAGE__->belongs_to(
    "invoice_payment",
    "TMS::Schema::Result::FinInvoicePayment",
    {InvoicePaymentId => "InvoicePaymentId"},
    {is_deferrable    => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-01-08 15:30:12
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:bmDLkvawh2X2P758f9aZYw

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
