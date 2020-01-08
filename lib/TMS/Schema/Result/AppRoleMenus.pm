use utf8;

package TMS::Schema::Result::AppRoleMenus;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::AppRoleMenus

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<app_role_menus>

=cut

__PACKAGE__->table("app_role_menus");

=head1 ACCESSORS

=head2 RoleMenuBranchId

  accessor: 'role_menu_branch_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 RoleId

  accessor: 'role_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 MenuItemId

  accessor: 'menu_item_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "RoleMenuBranchId",
    {   accessor          => "role_menu_branch_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "RoleId",
    {   accessor       => "role_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "MenuItemId",
    {   accessor       => "menu_item_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</RoleMenuBranchId>

=back

=cut

__PACKAGE__->set_primary_key("RoleMenuBranchId");

=head1 UNIQUE CONSTRAINTS

=head2 C<UniqMenuRole>

=over 4

=item * L</RoleId>

=item * L</MenuItemId>

=back

=cut

__PACKAGE__->add_unique_constraint("UniqMenuRole", ["RoleId", "MenuItemId"]);

=head1 RELATIONS

=head2 menu_item

Type: belongs_to

Related object: L<TMS::Schema::Result::AppMenuItem>

=cut

__PACKAGE__->belongs_to(
    "menu_item",
    "TMS::Schema::Result::AppMenuItem",
    {MenuItemId    => "MenuItemId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 role

Type: belongs_to

Related object: L<TMS::Schema::Result::AppRole>

=cut

__PACKAGE__->belongs_to(
    "role",
    "TMS::Schema::Result::AppRole",
    {RoleId        => "RoleId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-01-08 09:43:54
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:JVIArzETXMi6MIIy0qstPA

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
