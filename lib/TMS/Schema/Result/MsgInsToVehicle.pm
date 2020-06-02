use utf8;

package TMS::Schema::Result::MsgInsToVehicle;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::MsgInsToVehicle

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<msg_ins_to_vehicles>

=cut

__PACKAGE__->table("msg_ins_to_vehicles");

=head1 ACCESSORS

=head2 idmsg_ins_to_vehicles

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 mnoteid

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 VhlInsId

  accessor: 'vhl_ins_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "idmsg_ins_to_vehicles",
    {   data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "mnoteid",
    {   data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "VhlInsId",
    {   accessor       => "vhl_ins_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</idmsg_ins_to_vehicles>

=back

=cut

__PACKAGE__->set_primary_key("idmsg_ins_to_vehicles");

=head1 UNIQUE CONSTRAINTS

=head2 C<msg_ins_to_vehicles_unq>

=over 4

=item * L</mnoteid>

=item * L</VhlInsId>

=back

=cut

__PACKAGE__->add_unique_constraint("msg_ins_to_vehicles_unq", ["mnoteid", "VhlInsId"]);

=head1 RELATIONS

=head2 mnoteid

Type: belongs_to

Related object: L<TMS::Schema::Result::MsgNote>

=cut

__PACKAGE__->belongs_to(
    "mnoteid",
    "TMS::Schema::Result::MsgNote",
    {mnoteid       => "mnoteid"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 vhl_in

Type: belongs_to

Related object: L<TMS::Schema::Result::InsToVehicle>

=cut

__PACKAGE__->belongs_to(
    "vhl_in",
    "TMS::Schema::Result::InsToVehicle",
    {VhlInsId      => "VhlInsId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-06-02 13:19:17
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:YI/Bo7D8vdV4+wJ8Mg7x9A

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
