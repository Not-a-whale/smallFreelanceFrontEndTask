use utf8;

package TMS::Schema::Result::FinPaymentMethod;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::FinPaymentMethod

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<fin_payment_methods>

=cut

__PACKAGE__->table("fin_payment_methods");

=head1 ACCESSORS

=head2 PaymentMethodId

  accessor: 'payment_method_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 PaymentMethodName

  accessor: 'payment_method_name'
  data_type: 'varchar'
  is_nullable: 0
  size: 64

=cut

__PACKAGE__->add_columns(
    "PaymentMethodId",
    {   accessor    => "payment_method_id",
        data_type   => "bigint",
        extra       => {unsigned => 1},
        is_nullable => 0,
    },
    "PaymentMethodName",
    {   accessor    => "payment_method_name",
        data_type   => "varchar",
        is_nullable => 0,
        size        => 64,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</PaymentMethodId>

=back

=cut

__PACKAGE__->set_primary_key("PaymentMethodId");

=head1 UNIQUE CONSTRAINTS

=head2 C<PaymentMethodName_UNIQUE>

=over 4

=item * L</PaymentMethodName>

=back

=cut

__PACKAGE__->add_unique_constraint("PaymentMethodName_UNIQUE", ["PaymentMethodName"]);

=head1 RELATIONS

=head2 fin_invoice_payments

Type: has_many

Related object: L<TMS::Schema::Result::FinInvoicePayment>

=cut

__PACKAGE__->has_many(
    "fin_invoice_payments",
    "TMS::Schema::Result::FinInvoicePayment",
    {"foreign.PaymentMethodId" => "self.PaymentMethodId"},
    {cascade_copy              => 0, cascade_delete => 0},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-06-02 20:08:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/McgF5K54PLT77kM0eGoLA

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
