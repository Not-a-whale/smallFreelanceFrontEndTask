use utf8;
package TMS::Schema::Result::AppMenuAction;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::AppMenuAction

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<app_menu_actions>

=cut

__PACKAGE__->table("app_menu_actions");

=head1 ACCESSORS

=head2 MenuActionId

  accessor: 'menu_action_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 ParentAction

  accessor: 'parent_action'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 MenuItemId

  accessor: 'menu_item_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 TargetNode

  accessor: 'target_node'
  data_type: 'varchar'
  is_nullable: 0
  size: 1024

=head2 TargetType

  accessor: 'target_type'
  data_type: 'enum'
  default_value: 'node'
  extra: {list => ["node","popup","window"]}
  is_nullable: 0

=head2 Route

  accessor: 'route'
  data_type: 'varchar'
  is_nullable: 0
  size: 1024

=head2 Comments

  accessor: 'comments'
  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "MenuActionId",
  {
    accessor => "menu_action_id",
    data_type => "bigint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "ParentAction",
  {
    accessor       => "parent_action",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 1,
  },
  "MenuItemId",
  {
    accessor       => "menu_item_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "TargetNode",
  {
    accessor => "target_node",
    data_type => "varchar",
    is_nullable => 0,
    size => 1024,
  },
  "TargetType",
  {
    accessor      => "target_type",
    data_type     => "enum",
    default_value => "node",
    extra         => { list => ["node", "popup", "window"] },
    is_nullable   => 0,
  },
  "Route",
  { accessor => "route", data_type => "varchar", is_nullable => 0, size => 1024 },
  "Comments",
  { accessor => "comments", data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</MenuActionId>

=back

=cut

__PACKAGE__->set_primary_key("MenuActionId");

=head1 RELATIONS

=head2 app_menu_action_trees_ancestors

Type: has_many

Related object: L<TMS::Schema::Result::AppMenuActionTree>

=cut

__PACKAGE__->has_many(
  "app_menu_action_trees_ancestors",
  "TMS::Schema::Result::AppMenuActionTree",
  { "foreign.AncestorId" => "self.MenuActionId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 app_menu_action_trees_descendants

Type: has_many

Related object: L<TMS::Schema::Result::AppMenuActionTree>

=cut

__PACKAGE__->has_many(
  "app_menu_action_trees_descendants",
  "TMS::Schema::Result::AppMenuActionTree",
  { "foreign.DescendantId" => "self.MenuActionId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 app_menu_actions

Type: has_many

Related object: L<TMS::Schema::Result::AppMenuAction>

=cut

__PACKAGE__->has_many(
  "app_menu_actions",
  "TMS::Schema::Result::AppMenuAction",
  { "foreign.ParentAction" => "self.MenuActionId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 menu_item

Type: belongs_to

Related object: L<TMS::Schema::Result::AppMenuItem>

=cut

__PACKAGE__->belongs_to(
  "menu_item",
  "TMS::Schema::Result::AppMenuItem",
  { MenuItemId => "MenuItemId" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);

=head2 parent_action

Type: belongs_to

Related object: L<TMS::Schema::Result::AppMenuAction>

=cut

__PACKAGE__->belongs_to(
  "parent_action",
  "TMS::Schema::Result::AppMenuAction",
  { MenuActionId => "ParentAction" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-05 15:51:52
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Hgxs446F4AvBYbAi3Lt8dw


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;