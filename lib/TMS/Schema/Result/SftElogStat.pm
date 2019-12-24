use utf8;

package TMS::Schema::Result::SftElogStat;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::SftElogStat

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<sft_elog_stats>

=cut

__PACKAGE__->table("sft_elog_stats");

=head1 ACCESSORS

=head2 GpsReqId

  accessor: 'gps_req_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 EquipmentId

  accessor: 'equipment_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 Longitude

  accessor: 'longitude'
  data_type: 'double precision'
  is_nullable: 0

=head2 Latitude

  accessor: 'latitude'
  data_type: 'double precision'
  is_nullable: 0

=head2 Bearings

  accessor: 'bearings'
  data_type: 'double precision'
  is_nullable: 1

=head2 Speed

  accessor: 'speed'
  data_type: 'double precision'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 Fuel

  accessor: 'fuel'
  data_type: 'double precision'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 Odometer

  accessor: 'odometer'
  data_type: 'double precision'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 LocationProviderId

  accessor: 'location_provider_id'
  data_type: 'varchar'
  is_nullable: 0
  size: 1024

=head2 EngineHours

  accessor: 'engine_hours'
  data_type: 'double precision'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 VehicleState

  accessor: 'vehicle_state'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 Acquired

  accessor: 'acquired'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 Posted

  accessor: 'posted'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "GpsReqId",
    {   accessor          => "gps_req_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "EquipmentId",
    {   accessor       => "equipment_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "Longitude",
    {   accessor    => "longitude",
        data_type   => "double precision",
        is_nullable => 0,
    },
    "Latitude",
    {   accessor    => "latitude",
        data_type   => "double precision",
        is_nullable => 0,
    },
    "Bearings",
    {   accessor    => "bearings",
        data_type   => "double precision",
        is_nullable => 1,
    },
    "Speed",
    {   accessor    => "speed",
        data_type   => "double precision",
        extra       => {unsigned => 1},
        is_nullable => 1,
    },
    "Fuel",
    {   accessor    => "fuel",
        data_type   => "double precision",
        extra       => {unsigned => 1},
        is_nullable => 1,
    },
    "Odometer",
    {   accessor    => "odometer",
        data_type   => "double precision",
        extra       => {unsigned => 1},
        is_nullable => 1,
    },
    "LocationProviderId",
    {   accessor    => "location_provider_id",
        data_type   => "varchar",
        is_nullable => 0,
        size        => 1024,
    },
    "EngineHours",
    {   accessor    => "engine_hours",
        data_type   => "double precision",
        extra       => {unsigned => 1},
        is_nullable => 1,
    },
    "VehicleState",
    {   accessor    => "vehicle_state",
        data_type   => "varchar",
        is_nullable => 1,
        size        => 255,
    },
    "Acquired",
    {   accessor                  => "acquired",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
    },
    "Posted",
    {   accessor                  => "posted",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        default_value             => "CURRENT_TIMESTAMP",
        is_nullable               => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</GpsReqId>

=back

=cut

__PACKAGE__->set_primary_key("GpsReqId");

=head1 UNIQUE CONSTRAINTS

=head2 C<LocationProviderId_UNIQUE>

=over 4

=item * L</LocationProviderId>

=back

=cut

__PACKAGE__->add_unique_constraint("LocationProviderId_UNIQUE", ["LocationProviderId"]);

=head1 RELATIONS

=head2 equipment

Type: belongs_to

Related object: L<TMS::Schema::Result::InvEquipment>

=cut

__PACKAGE__->belongs_to(
    "equipment",
    "TMS::Schema::Result::InvEquipment",
    {EquipmentId   => "EquipmentId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 sft_log_entries

Type: has_many

Related object: L<TMS::Schema::Result::SftLogEntry>

=cut

__PACKAGE__->has_many(
    "sft_log_entries",
    "TMS::Schema::Result::SftLogEntry",
    {"foreign.Location" => "self.GpsReqId"},
    {cascade_copy       => 0, cascade_delete => 0},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-24 07:43:32
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:LMWYpg3l/ZKPSv6gPVdbzg

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
