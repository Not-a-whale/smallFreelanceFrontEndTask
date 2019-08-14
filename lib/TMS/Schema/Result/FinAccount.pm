use utf8;
package TMS::Schema::Result::FinAccount;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::FinAccount

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<fin_accounts>

=cut

__PACKAGE__->table("fin_accounts");

=head1 ACCESSORS

=head2 AccountId

  accessor: 'account_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 AccountTypeId

  accessor: 'account_type_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 ParentId

  accessor: 'parent_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 UserDefined

  accessor: 'user_defined'
  data_type: 'tinyint'
  default_value: 1
  extra: {unsigned => 1}
  is_nullable: 0

=head2 Code

  accessor: 'code'
  data_type: 'varchar'
  is_nullable: 1
  size: 12

=head2 Active

  accessor: 'active'
  data_type: 'tinyint'
  default_value: 1
  extra: {unsigned => 1}
  is_nullable: 0

=head2 Valid

  accessor: 'valid'
  data_type: 'tinyint'
  default_value: 1
  extra: {unsigned => 1}
  is_nullable: 0

=head2 DateCreated

  accessor: 'date_created'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 0

=head2 Name

  accessor: 'name'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 Description

  accessor: 'description'
  data_type: 'varchar'
  is_nullable: 1
  size: 1024

=head2 ExternalName

  accessor: 'external_name'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 Balance

  accessor: 'balance'
  data_type: 'decimal'
  default_value: 0.00
  is_nullable: 0
  size: [12,2]

=cut

__PACKAGE__->add_columns(
  "AccountId",
  {
    accessor => "account_id",
    data_type => "bigint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "AccountTypeId",
  {
    accessor       => "account_type_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "ParentId",
  {
    accessor       => "parent_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 1,
  },
  "UserDefined",
  {
    accessor      => "user_defined",
    data_type     => "tinyint",
    default_value => 1,
    extra         => { unsigned => 1 },
    is_nullable   => 0,
  },
  "Code",
  { accessor => "code", data_type => "varchar", is_nullable => 1, size => 12 },
  "Active",
  {
    accessor      => "active",
    data_type     => "tinyint",
    default_value => 1,
    extra         => { unsigned => 1 },
    is_nullable   => 0,
  },
  "Valid",
  {
    accessor      => "valid",
    data_type     => "tinyint",
    default_value => 1,
    extra         => { unsigned => 1 },
    is_nullable   => 0,
  },
  "DateCreated",
  {
    accessor => "date_created",
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
  },
  "Name",
  { accessor => "name", data_type => "varchar", is_nullable => 0, size => 255 },
  "Description",
  {
    accessor => "description",
    data_type => "varchar",
    is_nullable => 1,
    size => 1024,
  },
  "ExternalName",
  {
    accessor => "external_name",
    data_type => "varchar",
    is_nullable => 1,
    size => 255,
  },
  "Balance",
  {
    accessor => "balance",
    data_type => "decimal",
    default_value => "0.00",
    is_nullable => 0,
    size => [12, 2],
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</AccountId>

=back

=cut

__PACKAGE__->set_primary_key("AccountId");

=head1 UNIQUE CONSTRAINTS

=head2 C<Name_UNIQUE>

=over 4

=item * L</Name>

=back

=cut

__PACKAGE__->add_unique_constraint("Name_UNIQUE", ["Name"]);

=head1 RELATIONS

=head2 account_type

Type: belongs_to

Related object: L<TMS::Schema::Result::FinAccountType>

=cut

__PACKAGE__->belongs_to(
  "account_type",
  "TMS::Schema::Result::FinAccountType",
  { AccountTypeId => "AccountTypeId" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);

=head2 fin_accounts

Type: has_many

Related object: L<TMS::Schema::Result::FinAccount>

=cut

__PACKAGE__->has_many(
  "fin_accounts",
  "TMS::Schema::Result::FinAccount",
  { "foreign.ParentId" => "self.AccountId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 fin_accounts_trees_ancestors

Type: has_many

Related object: L<TMS::Schema::Result::FinAccountsTree>

=cut

__PACKAGE__->has_many(
  "fin_accounts_trees_ancestors",
  "TMS::Schema::Result::FinAccountsTree",
  { "foreign.AncestorId" => "self.AccountId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 fin_accounts_trees_descendants

Type: has_many

Related object: L<TMS::Schema::Result::FinAccountsTree>

=cut

__PACKAGE__->has_many(
  "fin_accounts_trees_descendants",
  "TMS::Schema::Result::FinAccountsTree",
  { "foreign.DescendantId" => "self.AccountId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 fin_item_template_credit_accounts

Type: has_many

Related object: L<TMS::Schema::Result::FinItemTemplate>

=cut

__PACKAGE__->has_many(
  "fin_item_template_credit_accounts",
  "TMS::Schema::Result::FinItemTemplate",
  { "foreign.CreditAccountId" => "self.AccountId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 fin_item_template_debit_accounts

Type: has_many

Related object: L<TMS::Schema::Result::FinItemTemplate>

=cut

__PACKAGE__->has_many(
  "fin_item_template_debit_accounts",
  "TMS::Schema::Result::FinItemTemplate",
  { "foreign.DebitAccountId" => "self.AccountId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 fin_journal_entries

Type: has_many

Related object: L<TMS::Schema::Result::FinJournalEntry>

=cut

__PACKAGE__->has_many(
  "fin_journal_entries",
  "TMS::Schema::Result::FinJournalEntry",
  { "foreign.AccountId" => "self.AccountId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 parent

Type: belongs_to

Related object: L<TMS::Schema::Result::FinAccount>

=cut

__PACKAGE__->belongs_to(
  "parent",
  "TMS::Schema::Result::FinAccount",
  { AccountId => "ParentId" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-13 13:28:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:0WumvVd/93bxBGBaK+MmnA


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;