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
  {
    accessor => "bill_rule_id",
    data_type => "bigint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "BankAccount",
  {
    accessor       => "bank_account",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "Rule",
  {
    accessor      => "rule",
    data_type     => "enum",
    default_value => "percentage",
    extra         => { list => ["percentage", "fixed amount"] },
    is_nullable   => 0,
  },
  "Amount",
  {
    accessor => "amount",
    data_type => "decimal",
    default_value => "100.00",
    is_nullable => 0,
    size => [12, 2],
  },
  "Notes",
  { accessor => "notes", data_type => "text", is_nullable => 1 },
  "Active",
  { accessor => "active", data_type => "tinyint", is_nullable => 1 },
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
  { BankId => "BankAccount" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-10 15:38:49
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:CXAldxvlWI8QR+e7ezONyA
# These lines were loaded from '/home/cpeter/temp/lib/TMS/Schema/Result/FinBillingRule.pm' found in @INC.
# They are now part of the custom portion of this file
# for you to hand-edit.  If you do not either delete
# this section or remove that file from @INC, this section
# will be repeated redundantly when you re-create this
# file again via Loader!  See skip_load_external to disable
# this feature.

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
  {
    accessor    => "bill_rule_id",
    data_type   => "bigint",
    extra       => { unsigned => 1 },
    is_nullable => 0,
  },
  "BankAccount",
  {
    accessor       => "bank_account",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "Rule",
  {
    accessor      => "rule",
    data_type     => "enum",
    default_value => "percentage",
    extra         => { list => ["percentage", "fixed amount"] },
    is_nullable   => 0,
  },
  "Amount",
  {
    accessor => "amount",
    data_type => "decimal",
    default_value => "100.00",
    is_nullable => 0,
    size => [12, 2],
  },
  "Notes",
  { accessor => "notes", data_type => "text", is_nullable => 1 },
  "Active",
  { accessor => "active", data_type => "tinyint", is_nullable => 1 },
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
  { BankId => "BankAccount" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-10 12:29:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:MLVI3pfA2rrMgkBCQcqUew


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;