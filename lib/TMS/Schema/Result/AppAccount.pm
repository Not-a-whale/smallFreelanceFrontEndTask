use utf8;

package TMS::Schema::Result::AppAccount;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::AppAccount

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<app_accounts>

=cut

__PACKAGE__->table("app_accounts");

=head1 ACCESSORS

=head2 AppAccountId

  accessor: 'app_account_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 UserId

  accessor: 'user_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 PasswordHash

  accessor: 'password_hash'
  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 Salt

  accessor: 'salt'
  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 Username

  accessor: 'username'
  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 DateCreated

  accessor: 'date_created'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 0

=head2 Locked

  accessor: 'locked'
  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "AppAccountId",
    {   accessor          => "app_account_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "UserId",
    {   accessor       => "user_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "PasswordHash",
    {   accessor    => "password_hash",
        data_type   => "varchar",
        is_nullable => 0,
        size        => 64,
    },
    "Salt",
    {accessor => "salt", data_type => "varchar", is_nullable => 0, size => 64},
    "Username",
    {   accessor    => "username",
        data_type   => "varchar",
        is_nullable => 0,
        size        => 64,
    },
    "DateCreated",
    {   accessor                  => "date_created",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        default_value             => "CURRENT_TIMESTAMP",
        is_nullable               => 0,
    },
    "Locked",
    {   accessor      => "locked",
        data_type     => "tinyint",
        default_value => 0,
        extra         => {unsigned => 1},
        is_nullable   => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</AppAccountId>

=back

=cut

__PACKAGE__->set_primary_key("AppAccountId");

=head1 UNIQUE CONSTRAINTS

=head2 C<Username_UNIQUE>

=over 4

=item * L</Username>

=back

=cut

__PACKAGE__->add_unique_constraint("Username_UNIQUE", ["Username"]);

=head1 RELATIONS

=head2 app_account_locks

Type: has_many

Related object: L<TMS::Schema::Result::AppAccountLock>

=cut

__PACKAGE__->has_many(
    "app_account_locks",
    "TMS::Schema::Result::AppAccountLock",
    {"foreign.AppAccountId" => "self.AppAccountId"},
    {cascade_copy           => 0, cascade_delete => 0},
);

=head2 app_account_logins

Type: has_many

Related object: L<TMS::Schema::Result::AppAccountLogin>

=cut

__PACKAGE__->has_many(
    "app_account_logins",
    "TMS::Schema::Result::AppAccountLogin",
    {"foreign.AppAccountId" => "self.AppAccountId"},
    {cascade_copy           => 0, cascade_delete => 0},
);

=head2 app_roles_assigned

Type: has_many

Related object: L<TMS::Schema::Result::AppRoleAssigned>

=cut

__PACKAGE__->has_many(
    "app_roles_assigned",
    "TMS::Schema::Result::AppRoleAssigned",
    {"foreign.AppAccountId" => "self.AppAccountId"},
    {cascade_copy           => 0, cascade_delete => 0},
);

=head2 user

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
    "user",
    "TMS::Schema::Result::HrAssociate",
    {AstId         => "UserId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-01-08 10:28:18
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:2WCeno2pWuUQ1rUMBz7xWA

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
