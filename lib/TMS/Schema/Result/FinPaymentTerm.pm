use utf8;
package TMS::Schema::Result::FinPaymentTerm;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::FinPaymentTerm

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<fin_payment_terms>

=cut

__PACKAGE__->table("fin_payment_terms");

=head1 ACCESSORS

=head2 PaymentTermId

  accessor: 'payment_term_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 Name

  accessor: 'name'
  data_type: 'varchar'
  is_nullable: 0
  size: 45

=head2 DueNext

  accessor: 'due_next'
  data_type: 'integer'
  is_nullable: 1

=head2 DueInDays

  accessor: 'due_in_days'
  data_type: 'integer'
  is_nullable: 1

=head2 DiscountAmount

  accessor: 'discount_amount'
  data_type: 'integer'
  is_nullable: 1

=head2 DiscountPercent

  accessor: 'discount_percent'
  data_type: 'decimal'
  is_nullable: 1
  size: [12,2]

=head2 DiscountInDays

  accessor: 'discount_in_days'
  data_type: 'decimal'
  is_nullable: 1
  size: [4,2]

=head2 Type

  accessor: 'type'
  data_type: 'enum'
  extra: {list => ["STANDARD","BY DATE","CASH"]}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "PaymentTermId",
  {
    accessor => "payment_term_id",
    data_type => "bigint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "Name",
  { accessor => "name", data_type => "varchar", is_nullable => 0, size => 45 },
  "DueNext",
  { accessor => "due_next", data_type => "integer", is_nullable => 1 },
  "DueInDays",
  { accessor => "due_in_days", data_type => "integer", is_nullable => 1 },
  "DiscountAmount",
  { accessor => "discount_amount", data_type => "integer", is_nullable => 1 },
  "DiscountPercent",
  {
    accessor => "discount_percent",
    data_type => "decimal",
    is_nullable => 1,
    size => [12, 2],
  },
  "DiscountInDays",
  {
    accessor => "discount_in_days",
    data_type => "decimal",
    is_nullable => 1,
    size => [4, 2],
  },
  "Type",
  {
    accessor    => "type",
    data_type   => "enum",
    extra       => { list => ["STANDARD", "BY DATE", "CASH"] },
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</PaymentTermId>

=back

=cut

__PACKAGE__->set_primary_key("PaymentTermId");

=head1 RELATIONS

=head2 fin_invoices

Type: has_many

Related object: L<TMS::Schema::Result::FinInvoice>

=cut

__PACKAGE__->has_many(
  "fin_invoices",
  "TMS::Schema::Result::FinInvoice",
  { "foreign.PaymentTermsId" => "self.PaymentTermId" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-05 15:51:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:C4Eu9BEHfXxDGTs6SpOuCg


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;