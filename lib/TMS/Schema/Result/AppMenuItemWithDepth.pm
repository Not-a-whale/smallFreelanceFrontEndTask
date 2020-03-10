use utf8;

package TMS::Schema::Result::AppMenuItemWithDepth;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::AppMenuItemWithDepth - VIEW

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';
__PACKAGE__->table_class("DBIx::Class::ResultSource::View");

=head1 TABLE: C<app_menu_items_with_depth>

=cut

__PACKAGE__->table("app_menu_items_with_depth");
__PACKAGE__->result_source_instance->view_definition(
    "select `items`.`MenuItemId` AS `MenuItemId`,`items`.`ParentId` AS `ParentId`,`items`.`Label` AS `Label`,`items`.`Title` AS `Title`,`items`.`Icon` AS `Icon`,`items`.`Route` AS `Route`,`items`.`Help` AS `Help`,`items`.`SortIndex` AS `SortIndex`,`items`.`Enabled` AS `Enabled`,group_concat(`cl2`.`AncestorId` order by `cl2`.`Depth` DESC separator '.') AS `Path`,max(`cl2`.`Depth`) AS `Depth` from ((`tms`.`app_menu_items` `items` left join `tms`.`app_menu_items_trees` `cl1` on((`items`.`MenuItemId` = `cl1`.`DescendantId`))) left join `tms`.`app_menu_items_trees` `cl2` on((`cl1`.`DescendantId` = `cl2`.`DescendantId`))) where `cl1`.`AncestorId` in (select `tms`.`app_menu_items`.`MenuItemId` from `tms`.`app_menu_items` where isnull(`tms`.`app_menu_items`.`ParentId`)) group by `items`.`MenuItemId` order by `Path`"
);

=head1 ACCESSORS

=head2 MenuItemId

  accessor: 'menu_item_id'
  data_type: 'bigint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 ParentId

  accessor: 'parent_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 Label

  accessor: 'label'
  data_type: 'varchar'
  is_nullable: 0
  size: 32

=head2 Title

  accessor: 'title'
  data_type: 'varchar'
  is_nullable: 1
  size: 1024

=head2 Icon

  accessor: 'icon'
  data_type: 'varchar'
  is_nullable: 1
  size: 1024

=head2 Route

  accessor: 'route'
  data_type: 'varchar'
  default_value: 'tms.app.error'
  is_nullable: 0
  size: 1024

=head2 Help

  accessor: 'help'
  data_type: 'text'
  is_nullable: 1

=head2 SortIndex

  accessor: 'sort_index'
  data_type: 'decimal'
  default_value: 0.000
  is_nullable: 1
  size: [6,3]

=head2 Enabled

  accessor: 'enabled'
  data_type: 'tinyint'
  default_value: 1
  extra: {unsigned => 1}
  is_nullable: 1

=head2 Path

  accessor: 'path'
  data_type: 'text'
  is_nullable: 1

=head2 Depth

  accessor: 'depth'
  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
    "MenuItemId",
    {   accessor      => "menu_item_id",
        data_type     => "bigint",
        default_value => 0,
        extra         => {unsigned => 1},
        is_nullable   => 0,
    },
    "ParentId",
    {   accessor    => "parent_id",
        data_type   => "bigint",
        extra       => {unsigned => 1},
        is_nullable => 1,
    },
    "Label",
    {accessor => "label", data_type => "varchar", is_nullable => 0, size => 32},
    "Title",
    {accessor => "title", data_type => "varchar", is_nullable => 1, size => 1024},
    "Icon",
    {accessor => "icon", data_type => "varchar", is_nullable => 1, size => 1024},
    "Route",
    {   accessor      => "route",
        data_type     => "varchar",
        default_value => "tms.app.error",
        is_nullable   => 0,
        size          => 1024,
    },
    "Help",
    {accessor => "help", data_type => "text", is_nullable => 1},
    "SortIndex",
    {   accessor      => "sort_index",
        data_type     => "decimal",
        default_value => "0.000",
        is_nullable   => 1,
        size          => [6, 3],
    },
    "Enabled",
    {   accessor      => "enabled",
        data_type     => "tinyint",
        default_value => 1,
        extra         => {unsigned => 1},
        is_nullable   => 1,
    },
    "Path",
    {accessor => "path", data_type => "text", is_nullable => 1},
    "Depth",
    {   accessor    => "depth",
        data_type   => "integer",
        extra       => {unsigned => 1},
        is_nullable => 1,
    },
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-03-10 16:28:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:sc633BeCnntudK+ay9nf2Q

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
