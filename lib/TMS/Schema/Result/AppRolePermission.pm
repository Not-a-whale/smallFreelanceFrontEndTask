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

=head2 RoleVsFeatureId

  accessor: 'role_vs_feature_id'
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

=head2 AppFeatureId

  accessor: 'app_feature_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "RoleVsFeatureId",
    {   accessor          => "role_vs_feature_id",
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
    "AppFeatureId",
    {   accessor       => "app_feature_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</RoleVsFeatureId>

=back

=cut

__PACKAGE__->set_primary_key("RoleVsFeatureId");

=head1 UNIQUE CONSTRAINTS

=head2 C<RoleVsPermUnq>

=over 4

=item * L</RoleId>

=item * L</AppFeatureId>

=back

=cut

__PACKAGE__->add_unique_constraint("RoleVsPermUnq", ["RoleId", "AppFeatureId"]);

=head1 RELATIONS

=head2 app_feature

Type: belongs_to

Related object: L<TMS::Schema::Result::AppFeature>

=cut

__PACKAGE__->belongs_to(
    "app_feature",
    "TMS::Schema::Result::AppFeature",
    {AppFeatureId  => "AppFeatureId"},
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

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-06-02 20:08:30
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:h8P8dxSIPR7z4WUFIYpH6w

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
