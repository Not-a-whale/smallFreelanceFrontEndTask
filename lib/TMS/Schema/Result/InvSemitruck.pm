use utf8;

package TMS::Schema::Result::InvSemitruck;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::InvSemitruck

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<inv_semitrucks>

=cut

__PACKAGE__->table("inv_semitrucks");

=head1 ACCESSORS

=head2 SemitruckId

  accessor: 'semitruck_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 FuelTankSize

  accessor: 'fuel_tank_size'
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

estimated mpg from trip distances and fuel usage or reported by driver

=head2 MilesPerGallonRated

  accessor: 'miles_per_gallon_rated'
  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

manufacturer's claimed mpg

=head2 TowCapacity

  accessor: 'tow_capacity'
  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

pounds

=cut

__PACKAGE__->add_columns(
    "SemitruckId",
    {   accessor       => "semitruck_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "FuelTankSize",
    {   accessor    => "fuel_tank_size",
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
    "TowCapacity",
    {   accessor    => "tow_capacity",
        data_type   => "integer",
        extra       => {unsigned => 1},
        is_nullable => 1,
    },
);

=head1 UNIQUE CONSTRAINTS

=head2 C<SemitruckId_UNIQUE>

=over 4

=item * L</SemitruckId>

=back

=cut

__PACKAGE__->add_unique_constraint("SemitruckId_UNIQUE", ["SemitruckId"]);

=head1 RELATIONS

=head2 semitruck

Type: belongs_to

Related object: L<TMS::Schema::Result::InvVehicle>

=cut

__PACKAGE__->belongs_to(
    "semitruck",
    "TMS::Schema::Result::InvVehicle",
    {VehicleId     => "SemitruckId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-01-08 10:28:18
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:o2BFM9ef3s59C/rBi8IZGQ

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
