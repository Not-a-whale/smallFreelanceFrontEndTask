use utf8;
package TMS::Schema::Result::AppRolePermission;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::AppRolePermission

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<app_role_permissions>

=cut

__PACKAGE__->table("app_role_permissions");

=head1 ACCESSORS

=head2 Role

  accessor: 'role'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 Permission

  accessor: 'permission'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "Role",
  {
    accessor       => "role",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "Permission",
  {
    accessor       => "permission",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</Role>

=item * L</Permission>

=back

=cut

__PACKAGE__->set_primary_key("Role", "Permission");

=head1 RELATIONS

=head2 permission

Type: belongs_to

Related object: L<TMS::Schema::Result::AppPermission>

=cut

__PACKAGE__->belongs_to(
  "permission",
  "TMS::Schema::Result::AppPermission",
  { PermissionId => "Permission" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);

=head2 role

Type: belongs_to

Related object: L<TMS::Schema::Result::AppRole>

=cut

__PACKAGE__->belongs_to(
  "role",
  "TMS::Schema::Result::AppRole",
  { RoleId => "Role" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-13 13:28:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:uxLGM3WDhL5jC++d0QIGZQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;