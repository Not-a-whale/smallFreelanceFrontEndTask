use utf8;

package TMS::Schema::Result::MsgAccess;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::MsgAccess

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<msg_access>

=cut

__PACKAGE__->table("msg_access");

=head1 ACCESSORS

=head2 macsid

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 PermissionName

  accessor: 'permission_name'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

=cut

__PACKAGE__->add_columns(
    "macsid",
    {   data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "PermissionName",
    {   accessor    => "permission_name",
        data_type   => "varchar",
        is_nullable => 0,
        size        => 255,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</macsid>

=back

=cut

__PACKAGE__->set_primary_key("macsid");

=head1 UNIQUE CONSTRAINTS

=head2 C<PermissionName_UNIQUE>

=over 4

=item * L</PermissionName>

=back

=cut

__PACKAGE__->add_unique_constraint("PermissionName_UNIQUE", ["PermissionName"]);

=head1 RELATIONS

=head2 msg_notes

Type: has_many

Related object: L<TMS::Schema::Result::MsgNote>

=cut

__PACKAGE__->has_many(
    "msg_notes",
    "TMS::Schema::Result::MsgNote",
    {"foreign.macsid" => "self.macsid"},
    {cascade_copy     => 0, cascade_delete => 0},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-25 21:12:39
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:7j9wq4QDYNyZS0ug4FLOfw

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
