use utf8;
package TMS::Schema::Result::AppMenuItem;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::AppMenuItem

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<app_menu_items>

=cut

__PACKAGE__->table("app_menu_items");

=head1 ACCESSORS

=head2 MenuItemId

  accessor: 'menu_item_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 ParentId

  accessor: 'parent_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 Label

  accessor: 'label'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 Title

  accessor: 'title'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 Icon

  accessor: 'icon'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 Enabled

  accessor: 'enabled'
  data_type: 'tinyint'
  default_value: 1
  is_nullable: 1

=head2 SortIndex

  accessor: 'sort_index'
  data_type: 'decimal'
  default_value: 0.00
  is_nullable: 1
  size: [10,2]

=cut

__PACKAGE__->add_columns(
  "MenuItemId",
  {
    accessor => "menu_item_id",
    data_type => "bigint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "ParentId",
  {
    accessor       => "parent_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 1,
  },
  "Label",
  { accessor => "label", data_type => "varchar", is_nullable => 0, size => 255 },
  "Title",
  { accessor => "title", data_type => "varchar", is_nullable => 1, size => 255 },
  "Icon",
  { accessor => "icon", data_type => "varchar", is_nullable => 1, size => 255 },
  "Enabled",
  {
    accessor      => "enabled",
    data_type     => "tinyint",
    default_value => 1,
    is_nullable   => 1,
  },
  "SortIndex",
  {
    accessor => "sort_index",
    data_type => "decimal",
    default_value => "0.00",
    is_nullable => 1,
    size => [10, 2],
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</MenuItemId>

=back

=cut

__PACKAGE__->set_primary_key("MenuItemId");

=head1 UNIQUE CONSTRAINTS

=head2 C<Label_UNIQUE>

=over 4

=item * L</Label>

=back

=cut

__PACKAGE__->add_unique_constraint("Label_UNIQUE", ["Label"]);

=head1 RELATIONS

=head2 app_menu_actions

Type: has_many

Related object: L<TMS::Schema::Result::AppMenuAction>

=cut

__PACKAGE__->has_many(
  "app_menu_actions",
  "TMS::Schema::Result::AppMenuAction",
  { "foreign.MenuItemId" => "self.MenuItemId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 app_menu_items

Type: has_many

Related object: L<TMS::Schema::Result::AppMenuItem>

=cut

__PACKAGE__->has_many(
  "app_menu_items",
  "TMS::Schema::Result::AppMenuItem",
  { "foreign.ParentId" => "self.MenuItemId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 app_menu_items_trees_ancestors

Type: has_many

Related object: L<TMS::Schema::Result::AppMenuItemsTree>

=cut

__PACKAGE__->has_many(
  "app_menu_items_trees_ancestors",
  "TMS::Schema::Result::AppMenuItemsTree",
  { "foreign.AncestorId" => "self.MenuItemId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 app_menu_items_trees_descendants

Type: has_many

Related object: L<TMS::Schema::Result::AppMenuItemsTree>

=cut

__PACKAGE__->has_many(
  "app_menu_items_trees_descendants",
  "TMS::Schema::Result::AppMenuItemsTree",
  { "foreign.DescendantId" => "self.MenuItemId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 app_role_menuses

Type: has_many

Related object: L<TMS::Schema::Result::AppRoleMenus>

=cut

__PACKAGE__->has_many(
  "app_role_menuses",
  "TMS::Schema::Result::AppRoleMenus",
  { "foreign.MenuItemId" => "self.MenuItemId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 parent

Type: belongs_to

Related object: L<TMS::Schema::Result::AppMenuItem>

=cut

__PACKAGE__->belongs_to(
  "parent",
  "TMS::Schema::Result::AppMenuItem",
  { MenuItemId => "ParentId" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-05 15:51:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:JR7hsx4jH74PZaVIRCoM9w


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;