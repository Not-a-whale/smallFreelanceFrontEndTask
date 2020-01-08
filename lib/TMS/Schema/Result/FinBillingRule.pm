use utf8;

package TMS::Schema::Result::FinBillingRule;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::FinBillingRule

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<fin_billing_rules>

=cut

__PACKAGE__->table("fin_billing_rules");

=head1 ACCESSORS

=head2 BillRuleId

  accessor: 'bill_rule_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 BankAccount

  accessor: 'bank_account'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 Rule

  accessor: 'rule'
  data_type: 'enum'
  default_value: 'percentage'
  extra: {list => ["percentage","fixed amount"]}
  is_nullable: 0

=head2 Amount

  accessor: 'amount'
  data_type: 'decimal'
  default_value: 100.00
  is_nullable: 0
  size: [12,2]

=head2 Notes

  accessor: 'notes'
  data_type: 'text'
  is_nullable: 1

=head2 Active

  accessor: 'active'
  data_type: 'tinyint'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
    "BillRuleId",
    {   accessor          => "bill_rule_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "BankAccount",
    {   accessor       => "bank_account",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "Rule",
    {   accessor      => "rule",
        data_type     => "enum",
        default_value => "percentage",
        extra         => {list => ["percentage", "fixed amount"]},
        is_nullable   => 0,
    },
    "Amount",
    {   accessor      => "amount",
        data_type     => "decimal",
        default_value => "100.00",
        is_nullable   => 0,
        size          => [12, 2],
    },
    "Notes",
    {accessor => "notes", data_type => "text", is_nullable => 1},
    "Active",
    {accessor => "active", data_type => "tinyint", is_nullable => 1},
);

=head1 PRIMARY KEY

=over 4

=item * L</BillRuleId>

=back

=cut

__PACKAGE__->set_primary_key("BillRuleId");

=head1 RELATIONS

=head2 bank_account

Type: belongs_to

Related object: L<TMS::Schema::Result::FinBillingBank>

=cut

__PACKAGE__->belongs_to(
    "bank_account",
    "TMS::Schema::Result::FinBillingBank",
    {BankId        => "BankAccount"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-01-07 08:47:06
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:2I2kg2O0qUcr1/ziKhgENg

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
