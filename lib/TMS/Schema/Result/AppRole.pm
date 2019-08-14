use utf8;
package TMS::Schema::Result::AppRole;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::AppRole

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<app_roles>

=cut

__PACKAGE__->table("app_roles");

=head1 ACCESSORS

=head2 RoleId

  accessor: 'role_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 RoleName

  accessor: 'role_name'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 Description

  accessor: 'description'
  data_type: 'text'
  is_nullable: 1

Brief description of the purpose of the role

=head2 UserDefined

  accessor: 'user_defined'
  data_type: 'tinyint'
  default_value: 1
  extra: {unsigned => 1}
  is_nullable: 1

=head2 Editable

  accessor: 'editable'
  data_type: 'tinyint'
  default_value: 1
  extra: {unsigned => 1}
  is_nullable: 1

=head2 CreatedBy

  accessor: 'created_by'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 UpdatedBy

  accessor: 'updated_by'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 DateCreated

  accessor: 'date_created'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 0

=head2 DateUpdated

  accessor: 'date_updated'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "RoleId",
  {
    accessor => "role_id",
    data_type => "bigint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "RoleName",
  {
    accessor => "role_name",
    data_type => "varchar",
    is_nullable => 0,
    size => 255,
  },
  "Description",
  { accessor => "description", data_type => "text", is_nullable => 1 },
  "UserDefined",
  {
    accessor      => "user_defined",
    data_type     => "tinyint",
    default_value => 1,
    extra         => { unsigned => 1 },
    is_nullable   => 1,
  },
  "Editable",
  {
    accessor      => "editable",
    data_type     => "tinyint",
    default_value => 1,
    extra         => { unsigned => 1 },
    is_nullable   => 1,
  },
  "CreatedBy",
  {
    accessor       => "created_by",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 1,
  },
  "UpdatedBy",
  {
    accessor       => "updated_by",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 1,
  },
  "DateCreated",
  {
    accessor => "date_created",
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
  },
  "DateUpdated",
  {
    accessor => "date_updated",
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</RoleId>

=back

=cut

__PACKAGE__->set_primary_key("RoleId");

=head1 UNIQUE CONSTRAINTS

=head2 C<Name_UNIQUE>

=over 4

=item * L</RoleName>

=back

=cut

__PACKAGE__->add_unique_constraint("Name_UNIQUE", ["RoleName"]);

=head1 RELATIONS

=head2 app_role_menuses

Type: has_many

Related object: L<TMS::Schema::Result::AppRoleMenus>

=cut

__PACKAGE__->has_many(
  "app_role_menuses",
  "TMS::Schema::Result::AppRoleMenus",
  { "foreign.RoleId" => "self.RoleId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 app_role_permissions

Type: has_many

Related object: L<TMS::Schema::Result::AppRolePermission>

=cut

__PACKAGE__->has_many(
  "app_role_permissions",
  "TMS::Schema::Result::AppRolePermission",
  { "foreign.Role" => "self.RoleId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 app_roles_assigned

Type: has_many

Related object: L<TMS::Schema::Result::AppRoleAssigned>

=cut

__PACKAGE__->has_many(
  "app_roles_assigned",
  "TMS::Schema::Result::AppRoleAssigned",
  { "foreign.RoleId" => "self.RoleId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 created_by

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
  "created_by",
  "TMS::Schema::Result::HrAssociate",
  { AstId => "CreatedBy" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "CASCADE",
  },
);

=head2 updated_by

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
  "updated_by",
  "TMS::Schema::Result::HrAssociate",
  { AstId => "UpdatedBy" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "CASCADE",
  },
);

=head2 permissions

Type: many_to_many

Composing rels: L</app_role_permissions> -> permission

=cut

__PACKAGE__->many_to_many("permissions", "app_role_permissions", "permission");


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-13 13:28:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:YPbWoss6n2iiB9mRlP58nQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;