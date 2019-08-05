use utf8;
package TMS::Schema::Result::InvTrailer;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::InvTrailer - All trailers that can be attached to trucks

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<inv_trailers>

=cut

__PACKAGE__->table("inv_trailers");

=head1 ACCESSORS

=head2 TrailerId

  accessor: 'trailer_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 Type

  accessor: 'type'
  data_type: 'varchar'
  default_value: 'Van'
  is_foreign_key: 1
  is_nullable: 0
  size: 24

=head2 HazMat

  accessor: 'haz_mat'
  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 LoadLength

  accessor: 'load_length'
  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

In inches

=head2 LoadWidth

  accessor: 'load_width'
  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

In inches

=head2 LoadHeight

  accessor: 'load_height'
  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

In inches


=head2 DoorWidth

  accessor: 'door_width'
  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 DoorHeight

  accessor: 'door_height'
  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 LoadCapactiy

  accessor: 'load_capactiy'
  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 HasLiftGate

  accessor: 'has_lift_gate'
  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 HasPalletJack

  accessor: 'has_pallet_jack'
  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 HasRamps

  accessor: 'has_ramps'
  data_type: 'tinyint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 LoadVolume

  accessor: 'load_volume'
  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "TrailerId",
  {
    accessor       => "trailer_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "Type",
  {
    accessor => "type",
    data_type => "varchar",
    default_value => "Van",
    is_foreign_key => 1,
    is_nullable => 0,
    size => 24,
  },
  "HazMat",
  {
    accessor      => "haz_mat",
    data_type     => "tinyint",
    default_value => 0,
    extra         => { unsigned => 1 },
    is_nullable   => 0,
  },
  "LoadLength",
  {
    accessor    => "load_length",
    data_type   => "integer",
    extra       => { unsigned => 1 },
    is_nullable => 1,
  },
  "LoadWidth",
  {
    accessor    => "load_width",
    data_type   => "integer",
    extra       => { unsigned => 1 },
    is_nullable => 1,
  },
  "LoadHeight",
  {
    accessor    => "load_height",
    data_type   => "integer",
    extra       => { unsigned => 1 },
    is_nullable => 1,
  },
  "DoorWidth",
  {
    accessor    => "door_width",
    data_type   => "integer",
    extra       => { unsigned => 1 },
    is_nullable => 1,
  },
  "DoorHeight",
  {
    accessor    => "door_height",
    data_type   => "integer",
    extra       => { unsigned => 1 },
    is_nullable => 1,
  },
  "LoadCapactiy",
  {
    accessor    => "load_capactiy",
    data_type   => "integer",
    extra       => { unsigned => 1 },
    is_nullable => 1,
  },
  "HasLiftGate",
  {
    accessor    => "has_lift_gate",
    data_type   => "tinyint",
    extra       => { unsigned => 1 },
    is_nullable => 1,
  },
  "HasPalletJack",
  {
    accessor    => "has_pallet_jack",
    data_type   => "tinyint",
    extra       => { unsigned => 1 },
    is_nullable => 1,
  },
  "HasRamps",
  {
    accessor    => "has_ramps",
    data_type   => "tinyint",
    extra       => { unsigned => 1 },
    is_nullable => 1,
  },
  "LoadVolume",
  { accessor => "load_volume", data_type => "integer", is_nullable => 1 },
);

=head1 RELATIONS

=head2 trailer

Type: belongs_to

Related object: L<TMS::Schema::Result::InvVehicle>

=cut

__PACKAGE__->belongs_to(
  "trailer",
  "TMS::Schema::Result::InvVehicle",
  { VehicleId => "TrailerId" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);

=head2 type

Type: belongs_to

Related object: L<TMS::Schema::Result::InvTrailerType>

=cut

__PACKAGE__->belongs_to(
  "type",
  "TMS::Schema::Result::InvTrailerType",
  { Name => "Type" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-05 15:51:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ZdUIgP7sr4ekcLCaHKwmhw


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;