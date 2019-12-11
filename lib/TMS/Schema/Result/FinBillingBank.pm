use utf8;
package TMS::Schema::Result::FinBillingBank;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::FinBillingBank

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<fin_billing_banks>

=cut

__PACKAGE__->table("fin_billing_banks");

=head1 ACCESSORS

=head2 BankId

  accessor: 'bank_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 BillingId

  accessor: 'billing_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 Institution

  accessor: 'institution'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 AccountNickname

  accessor: 'account_nickname'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 AccountNumber

  accessor: 'account_number'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 RoutingNumber

  accessor: 'routing_number'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 AccountType

  accessor: 'account_type'
  data_type: 'enum'
  default_value: 'checking'
  extra: {list => ["checking","savings"]}
  is_nullable: 0

=head2 Purpose

  accessor: 'purpose'
  data_type: 'enum'
  default_value: 'billing and payment'
  extra: {list => ["payment","billing","billing and payment","other"]}
  is_nullable: 0

=head2 Active

  accessor: 'active'
  data_type: 'tinyint'
  default_value: 1
  is_nullable: 0

=head2 VoidCheck

  accessor: 'void_check'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 Notes

  accessor: 'notes'
  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "BankId",
  {
    accessor => "bank_id",
    data_type => "bigint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "BillingId",
  {
    accessor       => "billing_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "Institution",
  {
    accessor       => "institution",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "AccountNickname",
  {
    accessor => "account_nickname",
    data_type => "varchar",
    is_nullable => 1,
    size => 255,
  },
  "AccountNumber",
  {
    accessor => "account_number",
    data_type => "varchar",
    is_nullable => 0,
    size => 255,
  },
  "RoutingNumber",
  {
    accessor => "routing_number",
    data_type => "varchar",
    is_nullable => 0,
    size => 255,
  },
  "AccountType",
  {
    accessor      => "account_type",
    data_type     => "enum",
    default_value => "checking",
    extra         => { list => ["checking", "savings"] },
    is_nullable   => 0,
  },
  "Purpose",
  {
    accessor      => "purpose",
    data_type     => "enum",
    default_value => "billing and payment",
    extra         => { list => ["payment", "billing", "billing and payment", "other"] },
    is_nullable   => 0,
  },
  "Active",
  {
    accessor      => "active",
    data_type     => "tinyint",
    default_value => 1,
    is_nullable   => 0,
  },
  "VoidCheck",
  {
    accessor       => "void_check",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 1,
  },
  "Notes",
  { accessor => "notes", data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</BankId>

=back

=cut

__PACKAGE__->set_primary_key("BankId");

=head1 RELATIONS

=head2 billing

Type: belongs_to

Related object: L<TMS::Schema::Result::FinBillingInfo>

=cut

__PACKAGE__->belongs_to(
  "billing",
  "TMS::Schema::Result::FinBillingInfo",
  { BillingId => "BillingId" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);

=head2 fin_billing_rules

Type: has_many

Related object: L<TMS::Schema::Result::FinBillingRule>

=cut

__PACKAGE__->has_many(
  "fin_billing_rules",
  "TMS::Schema::Result::FinBillingRule",
  { "foreign.BankAccount" => "self.BankId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 institution

Type: belongs_to

Related object: L<TMS::Schema::Result::BizBranch>

=cut

__PACKAGE__->belongs_to(
  "institution",
  "TMS::Schema::Result::BizBranch",
  { BrnchId => "Institution" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);

=head2 void_check

Type: belongs_to

Related object: L<TMS::Schema::Result::GenFile>

=cut

__PACKAGE__->belongs_to(
  "void_check",
  "TMS::Schema::Result::GenFile",
  { FileId => "VoidCheck" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-10 15:38:49
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:mFlWL6oWAviz29ewrsnpow
# These lines were loaded from '/home/cpeter/temp/lib/TMS/Schema/Result/FinBillingBank.pm' found in @INC.
# They are now part of the custom portion of this file
# for you to hand-edit.  If you do not either delete
# this section or remove that file from @INC, this section
# will be repeated redundantly when you re-create this
# file again via Loader!  See skip_load_external to disable
# this feature.

use utf8;
package TMS::Schema::Result::FinBillingBank;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::FinBillingBank

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<fin_billing_banks>

=cut

__PACKAGE__->table("fin_billing_banks");

=head1 ACCESSORS

=head2 BankId

  accessor: 'bank_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 BillingId

  accessor: 'billing_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 Institution

  accessor: 'institution'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 AccountNickname

  accessor: 'account_nickname'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 AccountNumber

  accessor: 'account_number'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 RoutingNumber

  accessor: 'routing_number'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 AccountType

  accessor: 'account_type'
  data_type: 'enum'
  default_value: 'checking'
  extra: {list => ["checking","savings"]}
  is_nullable: 0

=head2 Purpose

  accessor: 'purpose'
  data_type: 'enum'
  default_value: 'billing and payment'
  extra: {list => ["payment","billing","billing and payment","other"]}
  is_nullable: 0

=head2 Active

  accessor: 'active'
  data_type: 'tinyint'
  default_value: 1
  is_nullable: 0

=head2 VoidCheck

  accessor: 'void_check'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 Notes

  accessor: 'notes'
  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "BankId",
  {
    accessor => "bank_id",
    data_type => "bigint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "BillingId",
  {
    accessor       => "billing_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "Institution",
  {
    accessor       => "institution",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "AccountNickname",
  {
    accessor => "account_nickname",
    data_type => "varchar",
    is_nullable => 1,
    size => 255,
  },
  "AccountNumber",
  {
    accessor => "account_number",
    data_type => "varchar",
    is_nullable => 0,
    size => 255,
  },
  "RoutingNumber",
  {
    accessor => "routing_number",
    data_type => "varchar",
    is_nullable => 0,
    size => 255,
  },
  "AccountType",
  {
    accessor      => "account_type",
    data_type     => "enum",
    default_value => "checking",
    extra         => { list => ["checking", "savings"] },
    is_nullable   => 0,
  },
  "Purpose",
  {
    accessor      => "purpose",
    data_type     => "enum",
    default_value => "billing and payment",
    extra         => { list => ["payment", "billing", "billing and payment", "other"] },
    is_nullable   => 0,
  },
  "Active",
  {
    accessor      => "active",
    data_type     => "tinyint",
    default_value => 1,
    is_nullable   => 0,
  },
  "VoidCheck",
  {
    accessor       => "void_check",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 1,
  },
  "Notes",
  { accessor => "notes", data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</BankId>

=back

=cut

__PACKAGE__->set_primary_key("BankId");

=head1 RELATIONS

=head2 billing

Type: belongs_to

Related object: L<TMS::Schema::Result::FinBillingInfo>

=cut

__PACKAGE__->belongs_to(
  "billing",
  "TMS::Schema::Result::FinBillingInfo",
  { BillingId => "BillingId" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);

=head2 fin_billing_rules

Type: has_many

Related object: L<TMS::Schema::Result::FinBillingRule>

=cut

__PACKAGE__->has_many(
  "fin_billing_rules",
  "TMS::Schema::Result::FinBillingRule",
  { "foreign.BankAccount" => "self.BankId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 institution

Type: belongs_to

Related object: L<TMS::Schema::Result::BizBranch>

=cut

__PACKAGE__->belongs_to(
  "institution",
  "TMS::Schema::Result::BizBranch",
  { BrnchId => "Institution" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);

=head2 void_check

Type: belongs_to

Related object: L<TMS::Schema::Result::GenFile>

=cut

__PACKAGE__->belongs_to(
  "void_check",
  "TMS::Schema::Result::GenFile",
  { FileId => "VoidCheck" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-10 12:29:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:zM9Y3jcd+sHt58TdMk1RwA


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;