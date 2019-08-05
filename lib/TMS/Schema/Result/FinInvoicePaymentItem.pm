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
  "InvoicePaymentId",
  {
    accessor       => "invoice_payment_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "InvoiceItemId",
  {
    accessor       => "invoice_item_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</InvoicePaymentId>

=item * L</InvoiceItemId>

=back

=cut

__PACKAGE__->set_primary_key("InvoicePaymentId", "InvoiceItemId");

=head1 RELATIONS

=head2 invoice_item

Type: belongs_to

Related object: L<TMS::Schema::Result::FinInvoicesItem>

=cut

__PACKAGE__->belongs_to(
  "invoice_item",
  "TMS::Schema::Result::FinInvoicesItem",
  { InvoiceItemId => "InvoiceItemId" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 invoice_payment

Type: belongs_to

Related object: L<TMS::Schema::Result::FinInvoicePayment>

=cut

__PACKAGE__->belongs_to(
  "invoice_payment",
  "TMS::Schema::Result::FinInvoicePayment",
  { InvoicePaymentId => "InvoicePaymentId" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-05 15:51:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:fVp07jml2h/qzcmsQ36qwQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;