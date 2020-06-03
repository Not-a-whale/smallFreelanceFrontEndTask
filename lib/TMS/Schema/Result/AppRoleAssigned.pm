use utf8;

package TMS::Schema::Result::AppRoleAssigned;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::AppRoleAssigned - Roles permitted or assigned to the user

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<app_roles_assigned>

=cut

__PACKAGE__->table("app_roles_assigned");

=head1 ACCESSORS

=head2 RolePermitId

  accessor: 'role_permit_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 AppAccountId

  accessor: 'app_account_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 RoleId

  accessor: 'role_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 ValidFrom

  accessor: 'valid_from'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 ValidUntill

  accessor: 'valid_untill'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 RoleAssignedBy

  accessor: 'role_assigned_by'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 RoleAssignedDate

  accessor: 'role_assigned_date'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "RolePermitId",
    {   accessor          => "role_permit_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "AppAccountId",
    {   accessor       => "app_account_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "RoleId",
    {   accessor       => "role_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "ValidFrom",
    {   accessor                  => "valid_from",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        is_nullable               => 0,
    },
    "ValidUntill",
    {   accessor                  => "valid_untill",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
    },
    "RoleAssignedBy",
    {   accessor       => "role_assigned_by",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "RoleAssignedDate",
    {   accessor                  => "role_assigned_date",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        default_value             => "CURRENT_TIMESTAMP",
        is_nullable               => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</RolePermitId>

=back

=cut

__PACKAGE__->set_primary_key("RolePermitId");

=head1 RELATIONS

=head2 app_account

Type: belongs_to

Related object: L<TMS::Schema::Result::AppAccount>

=cut

__PACKAGE__->belongs_to(
    "app_account",
    "TMS::Schema::Result::AppAccount",
    {AppAccountId  => "AppAccountId"},
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

=head2 role_assigned_by

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
    "role_assigned_by",
    "TMS::Schema::Result::HrAssociate",
    {AstId         => "RoleAssignedBy"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-06-02 20:08:30
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:oknL7nkuXcKWTzMj3F8StA

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
