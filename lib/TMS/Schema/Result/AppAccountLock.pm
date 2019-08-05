use utf8;
package TMS::Schema::Result::AppAccountLock;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::AppAccountLock

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<app_account_locks>

=cut

__PACKAGE__->table("app_account_locks");

=head1 ACCESSORS

=head2 AccLockId

  accessor: 'acc_lock_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 AppAccountId

  accessor: 'app_account_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 IPAddress

  accessor: 'ipaddress'
  data_type: 'integer'
  is_nullable: 0

=head2 LoginAttempts

  accessor: 'login_attempts'
  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 Logins

  accessor: 'logins'
  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 Locked

  accessor: 'locked'
  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 DateLastLogin

  accessor: 'date_last_login'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 DateLastAttempt

  accessor: 'date_last_attempt'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "AccLockId",
  {
    accessor    => "acc_lock_id",
    data_type   => "bigint",
    extra       => { unsigned => 1 },
    is_nullable => 0,
  },
  "AppAccountId",
  {
    accessor       => "app_account_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "IPAddress",
  { accessor => "ipaddress", data_type => "integer", is_nullable => 0 },
  "LoginAttempts",
  {
    accessor      => "login_attempts",
    data_type     => "integer",
    default_value => 0,
    extra         => { unsigned => 1 },
    is_nullable   => 0,
  },
  "Logins",
  {
    accessor      => "logins",
    data_type     => "integer",
    default_value => 0,
    extra         => { unsigned => 1 },
    is_nullable   => 0,
  },
  "Locked",
  {
    accessor      => "locked",
    data_type     => "tinyint",
    default_value => 0,
    extra         => { unsigned => 1 },
    is_nullable   => 0,
  },
  "DateLastLogin",
  {
    accessor => "date_last_login",
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "DateLastAttempt",
  {
    accessor => "date_last_attempt",
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</AccLockId>

=back

=cut

__PACKAGE__->set_primary_key("AccLockId");

=head1 RELATIONS

=head2 app_account

Type: belongs_to

Related object: L<TMS::Schema::Result::AppAccount>

=cut

__PACKAGE__->belongs_to(
  "app_account",
  "TMS::Schema::Result::AppAccount",
  { AppAccountId => "AppAccountId" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-05 10:27:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:riqKlj6yPMvFIrGkk5rcIQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;