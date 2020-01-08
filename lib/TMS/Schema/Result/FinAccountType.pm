use utf8;

package TMS::Schema::Result::FinAccountType;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::FinAccountType

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<fin_account_types>

=cut

__PACKAGE__->table("fin_account_types");

=head1 ACCESSORS

=head2 AccountTypeId

  accessor: 'account_type_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 Name

  accessor: 'name'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 ParentId

  accessor: 'parent_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 Editable

  accessor: 'editable'
  data_type: 'tinyint'
  default_value: 1
  extra: {unsigned => 1}
  is_nullable: 1

=head2 Valid

  accessor: 'valid'
  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 UserDefined

  accessor: 'user_defined'
  data_type: 'tinyint'
  default_value: 1
  extra: {unsigned => 1}
  is_nullable: 1

=head2 Debit

  accessor: 'debit'
  data_type: 'decimal'
  default_value: 1.00
  is_nullable: 0
  size: [12,2]

=head2 Credit

  accessor: 'credit'
  data_type: 'decimal'
  default_value: -1.00
  is_nullable: 0
  size: [12,2]

=head2 Temp

  accessor: 'temp'
  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 1

=head2 DisplayOrder

  accessor: 'display_order'
  data_type: 'integer'
  is_nullable: 1

=head2 BalanceSheet

  accessor: 'balance_sheet'
  data_type: 'tinyint'
  default_value: 1
  extra: {unsigned => 1}
  is_nullable: 0

=head2 IncomeSheet

  accessor: 'income_sheet'
  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "AccountTypeId",
    {   accessor          => "account_type_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "Name",
    {accessor => "name", data_type => "varchar", is_nullable => 0, size => 255},
    "ParentId",
    {   accessor       => "parent_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "Editable",
    {   accessor      => "editable",
        data_type     => "tinyint",
        default_value => 1,
        extra         => {unsigned => 1},
        is_nullable   => 1,
    },
    "Valid",
    {   accessor      => "valid",
        data_type     => "tinyint",
        default_value => 0,
        extra         => {unsigned => 1},
        is_nullable   => 0,
    },
    "UserDefined",
    {   accessor      => "user_defined",
        data_type     => "tinyint",
        default_value => 1,
        extra         => {unsigned => 1},
        is_nullable   => 1,
    },
    "Debit",
    {   accessor      => "debit",
        data_type     => "decimal",
        default_value => "1.00",
        is_nullable   => 0,
        size          => [12, 2],
    },
    "Credit",
    {   accessor      => "credit",
        data_type     => "decimal",
        default_value => "-1.00",
        is_nullable   => 0,
        size          => [12, 2],
    },
    "Temp",
    {   accessor      => "temp",
        data_type     => "tinyint",
        default_value => 0,
        extra         => {unsigned => 1},
        is_nullable   => 1,
    },
    "DisplayOrder",
    {accessor => "display_order", data_type => "integer", is_nullable => 1},
    "BalanceSheet",
    {   accessor      => "balance_sheet",
        data_type     => "tinyint",
        default_value => 1,
        extra         => {unsigned => 1},
        is_nullable   => 0,
    },
    "IncomeSheet",
    {   accessor      => "income_sheet",
        data_type     => "tinyint",
        default_value => 0,
        extra         => {unsigned => 1},
        is_nullable   => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</AccountTypeId>

=back

=cut

__PACKAGE__->set_primary_key("AccountTypeId");

=head1 UNIQUE CONSTRAINTS

=head2 C<Name_UNIQUE>

=over 4

=item * L</Name>

=back

=cut

__PACKAGE__->add_unique_constraint("Name_UNIQUE", ["Name"]);

=head1 RELATIONS

=head2 fin_account_types

Type: has_many

Related object: L<TMS::Schema::Result::FinAccountType>

=cut

__PACKAGE__->has_many(
    "fin_account_types",
    "TMS::Schema::Result::FinAccountType",
    {"foreign.ParentId" => "self.AccountTypeId"},
    {cascade_copy       => 0, cascade_delete => 0},
);

=head2 fin_account_types_trees_ancestors

Type: has_many

Related object: L<TMS::Schema::Result::FinAccountTypesTree>

=cut

__PACKAGE__->has_many(
    "fin_account_types_trees_ancestors", "TMS::Schema::Result::FinAccountTypesTree",
    {"foreign.AncestorId" => "self.AccountTypeId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 fin_account_types_trees_descendants

Type: has_many

Related object: L<TMS::Schema::Result::FinAccountTypesTree>

=cut

__PACKAGE__->has_many(
    "fin_account_types_trees_descendants", "TMS::Schema::Result::FinAccountTypesTree",
    {"foreign.DescendantId" => "self.AccountTypeId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 fin_accounts

Type: has_many

Related object: L<TMS::Schema::Result::FinAccount>

=cut

__PACKAGE__->has_many(
    "fin_accounts",
    "TMS::Schema::Result::FinAccount",
    {"foreign.AccountTypeId" => "self.AccountTypeId"},
    {cascade_copy            => 0, cascade_delete => 0},
);

=head2 parent

Type: belongs_to

Related object: L<TMS::Schema::Result::FinAccountType>

=cut

__PACKAGE__->belongs_to(
    "parent",
    "TMS::Schema::Result::FinAccountType",
    {AccountTypeId => "ParentId"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-01-08 08:23:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:tkjS8cvcbTaqHGAnDuGHxg

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
