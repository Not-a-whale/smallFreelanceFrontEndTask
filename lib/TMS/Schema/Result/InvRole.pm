use utf8;
package TMS::Schema::Result::InvRole;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::InvRole

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<inv_roles>

=cut

__PACKAGE__->table("inv_roles");

=head1 ACCESSORS

=head2 InvRoleId

  accessor: 'inv_role_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 RoleName

  accessor: 'role_name'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 Notes

  accessor: 'notes'
  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "InvRoleId",
  {
    accessor => "inv_role_id",
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
  "Notes",
  { accessor => "notes", data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</InvRoleId>

=back

=cut

__PACKAGE__->set_primary_key("InvRoleId");

=head1 UNIQUE CONSTRAINTS

=head2 C<RoleName_UNIQUE>

=over 4

=item * L</RoleName>

=back

=cut

__PACKAGE__->add_unique_constraint("RoleName_UNIQUE", ["RoleName"]);

=head1 RELATIONS

=head2 inv_unit_reservations

Type: has_many

Related object: L<TMS::Schema::Result::InvUnitReservation>

=cut

__PACKAGE__->has_many(
  "inv_unit_reservations",
  "TMS::Schema::Result::InvUnitReservation",
  { "foreign.InvRoleId" => "self.InvRoleId" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-05 15:51:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:icWMQpPC9I+R0R7s5H5iXA


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;