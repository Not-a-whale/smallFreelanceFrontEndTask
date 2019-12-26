use utf8;

package TMS::Schema::Result::AppPermission;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::AppPermission

=head1 DESCRIPTION

Table that holds different permissions for features offered by the application

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<app_permissions>

=cut

__PACKAGE__->table("app_permissions");

=head1 ACCESSORS

=head2 PermissionId

  accessor: 'permission_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 Feature

  accessor: 'feature'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 AccessName

  accessor: 'access_name'
  data_type: 'varchar'
  is_nullable: 0
  size: 64

=cut

__PACKAGE__->add_columns(
    "PermissionId",
    {   accessor          => "permission_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "Feature",
    {   accessor       => "feature",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "AccessName",
    {   accessor    => "access_name",
        data_type   => "varchar",
        is_nullable => 0,
        size        => 64,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</PermissionId>

=back

=cut

__PACKAGE__->set_primary_key("PermissionId");

=head1 RELATIONS

=head2 app_role_permissions

Type: has_many

Related object: L<TMS::Schema::Result::AppRolePermission>

=cut

__PACKAGE__->has_many(
    "app_role_permissions", "TMS::Schema::Result::AppRolePermission",
    {"foreign.Permission" => "self.PermissionId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 feature

Type: belongs_to

Related object: L<TMS::Schema::Result::AppFeature>

=cut

__PACKAGE__->belongs_to(
    "feature",
    "TMS::Schema::Result::AppFeature",
    {AppFeatureId  => "Feature"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-26 15:33:20
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:XKxu00iG6jMgznw3Q3kK2w

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
