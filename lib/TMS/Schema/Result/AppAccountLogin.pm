use utf8;
package TMS::Schema::Result::AppAccountLogin;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::AppAccountLogin - tracks when the account logged in and logged out

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<app_account_logins>

=cut

__PACKAGE__->table("app_account_logins");

=head1 ACCESSORS

=head2 AccLoginId

  accessor: 'acc_login_id'
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

=head2 IPAddress

  accessor: 'ipaddress'
  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 DateLogin

  accessor: 'date_login'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 0

=head2 Type

  accessor: 'type'
  data_type: 'enum'
  default_value: 'Login'
  extra: {list => ["Login","Logout"]}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "AccLoginId",
  {
    accessor => "acc_login_id",
    data_type => "bigint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
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
  {
    accessor    => "ipaddress",
    data_type   => "integer",
    extra       => { unsigned => 1 },
    is_nullable => 0,
  },
  "DateLogin",
  {
    accessor => "date_login",
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
  },
  "Type",
  {
    accessor      => "type",
    data_type     => "enum",
    default_value => "Login",
    extra         => { list => ["Login", "Logout"] },
    is_nullable   => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</AccLoginId>

=back

=cut

__PACKAGE__->set_primary_key("AccLoginId");

=head1 RELATIONS

=head2 app_account

Type: belongs_to

Related object: L<TMS::Schema::Result::AppAccount>

=cut

__PACKAGE__->belongs_to(
  "app_account",
  "TMS::Schema::Result::AppAccount",
  { AppAccountId => "AppAccountId" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-13 13:28:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:zNMfi6qqvGnkJ1R6zD0n1w


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;