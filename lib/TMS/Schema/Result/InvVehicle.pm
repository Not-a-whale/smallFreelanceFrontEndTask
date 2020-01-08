use utf8;

package TMS::Schema::Result::InvVehicle;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::InvVehicle

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<inv_vehicles>

=cut

__PACKAGE__->table("inv_vehicles");

=head1 ACCESSORS

=head2 VehicleId

  accessor: 'vehicle_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 CarrierId

  accessor: 'carrier_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 Make

  accessor: 'make'
  data_type: 'varchar'
  is_nullable: 1
  size: 24

=head2 Model

  accessor: 'model'
  data_type: 'varchar'
  is_nullable: 1
  size: 24

=head2 Color

  accessor: 'color'
  data_type: 'varchar'
  is_nullable: 1
  size: 24

=head2 VIN

  accessor: 'vin'
  data_type: 'varchar'
  is_nullable: 0
  size: 19

=head2 TireSize

  accessor: 'tire_size'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 Year

  accessor: 'year'
  data_type: 'year'
  is_nullable: 1

=head2 Axels

  accessor: 'axels'
  data_type: 'integer'
  is_nullable: 1

=head2 Length

  accessor: 'length'
  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 Height

  accessor: 'height'
  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 Width

  accessor: 'width'
  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 UnladenWeight

  accessor: 'unladen_weight'
  data_type: 'integer'
  is_nullable: 1

=head2 Fuel

  accessor: 'fuel'
  data_type: 'enum'
  default_value: 'none'
  extra: {list => ["none","deisel","unleaded"]}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "VehicleId",
    {   accessor       => "vehicle_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "CarrierId",
    {   accessor       => "carrier_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "Make",
    {accessor => "make", data_type => "varchar", is_nullable => 1, size => 24},
    "Model",
    {accessor => "model", data_type => "varchar", is_nullable => 1, size => 24},
    "Color",
    {accessor => "color", data_type => "varchar", is_nullable => 1, size => 24},
    "VIN",
    {accessor => "vin", data_type => "varchar", is_nullable => 0, size => 19},
    "TireSize",
    {   accessor       => "tire_size",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "Year",
    {accessor => "year", data_type => "year", is_nullable => 1},
    "Axels",
    {accessor => "axels", data_type => "integer", is_nullable => 1},
    "Length",
    {   accessor    => "length",
        data_type   => "integer",
        extra       => {unsigned => 1},
        is_nullable => 1,
    },
    "Height",
    {   accessor    => "height",
        data_type   => "integer",
        extra       => {unsigned => 1},
        is_nullable => 1,
    },
    "Width",
    {   accessor    => "width",
        data_type   => "integer",
        extra       => {unsigned => 1},
        is_nullable => 1,
    },
    "UnladenWeight",
    {accessor => "unladen_weight", data_type => "integer", is_nullable => 1},
    "Fuel",
    {   accessor      => "fuel",
        data_type     => "enum",
        default_value => "none",
        extra         => {list => ["none", "deisel", "unleaded"]},
        is_nullable   => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</VehicleId>

=back

=cut

__PACKAGE__->set_primary_key("VehicleId");

=head1 UNIQUE CONSTRAINTS

=head2 C<VIN_UNIQUE>

=over 4

=item * L</VIN>

=back

=cut

__PACKAGE__->add_unique_constraint("VIN_UNIQUE", ["VIN"]);

=head1 RELATIONS

=head2 carrier

Type: belongs_to

Related object: L<TMS::Schema::Result::EntCarrier>

=cut

__PACKAGE__->belongs_to(
    "carrier",
    "TMS::Schema::Result::EntCarrier",
    {CarrierId     => "CarrierId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 crr_ifta_decals

Type: has_many

Related object: L<TMS::Schema::Result::CrrIftaDecal>

=cut

__PACKAGE__->has_many(
    "crr_ifta_decals",
    "TMS::Schema::Result::CrrIftaDecal",
    {"foreign.VehicleId" => "self.VehicleId"},
    {cascade_copy        => 0, cascade_delete => 0},
);

=head2 crr_state_permits

Type: has_many

Related object: L<TMS::Schema::Result::CrrStatePermit>

=cut

__PACKAGE__->has_many(
    "crr_state_permits", "TMS::Schema::Result::CrrStatePermit",
    {"foreign.VehicleId" => "self.VehicleId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 ins_to_vehicles

Type: has_many

Related object: L<TMS::Schema::Result::InsToVehicle>

=cut

__PACKAGE__->has_many(
    "ins_to_vehicles",
    "TMS::Schema::Result::InsToVehicle",
    {"foreign.VehicleId" => "self.VehicleId"},
    {cascade_copy        => 0, cascade_delete => 0},
);

=head2 inv_semitruck

Type: might_have

Related object: L<TMS::Schema::Result::InvSemitruck>

=cut

__PACKAGE__->might_have(
    "inv_semitruck",
    "TMS::Schema::Result::InvSemitruck",
    {"foreign.SemitruckId" => "self.VehicleId"},
    {cascade_copy          => 0, cascade_delete => 0},
);

=head2 inv_sprinter

Type: might_have

Related object: L<TMS::Schema::Result::InvSprinter>

=cut

__PACKAGE__->might_have(
    "inv_sprinter",
    "TMS::Schema::Result::InvSprinter",
    {"foreign.SprinterId" => "self.VehicleId"},
    {cascade_copy         => 0, cascade_delete => 0},
);

=head2 inv_trailer

Type: might_have

Related object: L<TMS::Schema::Result::InvTrailer>

=cut

__PACKAGE__->might_have(
    "inv_trailer",
    "TMS::Schema::Result::InvTrailer",
    {"foreign.TrailerId" => "self.VehicleId"},
    {cascade_copy        => 0, cascade_delete => 0},
);

=head2 sft_inspection_schedules

Type: has_many

Related object: L<TMS::Schema::Result::SftInspectionSchedule>

=cut

__PACKAGE__->has_many(
    "sft_inspection_schedules", "TMS::Schema::Result::SftInspectionSchedule",
    {"foreign.VehicleId" => "self.VehicleId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 sft_vehicle_registrations

Type: has_many

Related object: L<TMS::Schema::Result::SftVehicleRegistration>

=cut

__PACKAGE__->has_many(
    "sft_vehicle_registrations", "TMS::Schema::Result::SftVehicleRegistration",
    {"foreign.VehicleId" => "self.VehicleId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 tire_size

Type: belongs_to

Related object: L<TMS::Schema::Result::InvTiresize>

=cut

__PACKAGE__->belongs_to(
    "tire_size",
    "TMS::Schema::Result::InvTiresize",
    {TireId => "TireSize"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

=head2 vehicle

Type: belongs_to

Related object: L<TMS::Schema::Result::InvEquipment>

=cut

__PACKAGE__->belongs_to(
    "vehicle",
    "TMS::Schema::Result::InvEquipment",
    {EquipmentId   => "VehicleId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-01-08 10:28:18
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:8Pmu804H5qPonRb40Vskkg

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
