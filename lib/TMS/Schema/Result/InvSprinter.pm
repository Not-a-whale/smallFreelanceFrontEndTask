use utf8;

package TMS::Schema::Result::InvSprinter;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::InvSprinter

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<inv_sprinters>

=cut

__PACKAGE__->table("inv_sprinters");

=head1 ACCESSORS

=head2 SprinterId

  accessor: 'sprinter_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 FuelTankCapacity

  accessor: 'fuel_tank_capacity'
  data_type: 'decimal'
  extra: {unsigned => 1}
  is_nullable: 1
  size: [12,2]

gallons

=head2 MilesPerGallonEstimated

  accessor: 'miles_per_gallon_estimated'
  data_type: 'decimal'
  extra: {unsigned => 1}
  is_nullable: 1
  size: [12,2]

estimate from trip distances and fuel usage or reported from driver

=head2 MilesPerGallonRated

  accessor: 'miles_per_gallon_rated'
  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

manufacturer's claimed mpg

=head2 LoadLength

  accessor: 'load_length'
  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

inches

=head2 LoadWidth

  accessor: 'load_width'
  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

inches

=head2 RoofHeight

  accessor: 'roof_height'
  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

inches, top of bed floor to bottom of ceiling

=head2 DoorHeight

  accessor: 'door_height'
  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

inches

=head2 DoorWidth

  accessor: 'door_width'
  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

inches

=head2 TowCapacity

  accessor: 'tow_capacity'
  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

pounds

=head2 LoadCapacity

  accessor: 'load_capacity'
  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

pounds

=head2 LoadVolume

  accessor: 'load_volume'
  data_type: 'integer'
  is_nullable: 1

cubic inches

=cut

__PACKAGE__->add_columns(
    "SprinterId",
    {   accessor       => "sprinter_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "FuelTankCapacity",
    {   accessor    => "fuel_tank_capacity",
        data_type   => "decimal",
        extra       => {unsigned => 1},
        is_nullable => 1,
        size        => [12, 2],
    },
    "MilesPerGallonEstimated",
    {   accessor    => "miles_per_gallon_estimated",
        data_type   => "decimal",
        extra       => {unsigned => 1},
        is_nullable => 1,
        size        => [12, 2],
    },
    "MilesPerGallonRated",
    {   accessor    => "miles_per_gallon_rated",
        data_type   => "integer",
        extra       => {unsigned => 1},
        is_nullable => 1,
    },
    "LoadLength",
    {   accessor    => "load_length",
        data_type   => "integer",
        extra       => {unsigned => 1},
        is_nullable => 1,
    },
    "LoadWidth",
    {   accessor    => "load_width",
        data_type   => "integer",
        extra       => {unsigned => 1},
        is_nullable => 1,
    },
    "RoofHeight",
    {   accessor    => "roof_height",
        data_type   => "integer",
        extra       => {unsigned => 1},
        is_nullable => 1,
    },
    "DoorHeight",
    {   accessor    => "door_height",
        data_type   => "integer",
        extra       => {unsigned => 1},
        is_nullable => 1,
    },
    "DoorWidth",
    {   accessor    => "door_width",
        data_type   => "integer",
        extra       => {unsigned => 1},
        is_nullable => 1,
    },
    "TowCapacity",
    {   accessor    => "tow_capacity",
        data_type   => "integer",
        extra       => {unsigned => 1},
        is_nullable => 1,
    },
    "LoadCapacity",
    {   accessor    => "load_capacity",
        data_type   => "integer",
        extra       => {unsigned => 1},
        is_nullable => 1,
    },
    "LoadVolume",
    {accessor => "load_volume", data_type => "integer", is_nullable => 1},
);

=head1 UNIQUE CONSTRAINTS

=head2 C<SprinterId_UNIQUE>

=over 4

=item * L</SprinterId>

=back

=cut

__PACKAGE__->add_unique_constraint("SprinterId_UNIQUE", ["SprinterId"]);

=head1 RELATIONS

=head2 sprinter

Type: belongs_to

Related object: L<TMS::Schema::Result::InvVehicle>

=cut

__PACKAGE__->belongs_to(
    "sprinter",
    "TMS::Schema::Result::InvVehicle",
    {VehicleId     => "SprinterId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-01-08 08:23:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:rVz/TD626YcXHxa9pDwB3A

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
