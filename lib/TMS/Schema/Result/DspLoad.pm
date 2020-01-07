use utf8;

package TMS::Schema::Result::DspLoad;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::DspLoad - tables of all loads in our system

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<dsp_loads>

=cut

__PACKAGE__->table("dsp_loads");

=head1 ACCESSORS

=head2 LoadId

  accessor: 'load_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 CreatedBy

  accessor: 'created_by'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 BrokerId

  accessor: 'broker_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 ShipperId

  accessor: 'shipper_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 BookedBy

  accessor: 'booked_by'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 DateCreated

  accessor: 'date_created'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 0

=head2 DateBooked

  accessor: 'date_booked'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 LoadNumber

  accessor: 'load_number'
  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 ProNumber

  accessor: 'pro_number'
  data_type: 'varchar'
  is_nullable: 1
  size: 16

=head2 LoadType

  accessor: 'load_type'
  data_type: 'enum'
  extra: {list => ["FTL","LTL","Partial"]}
  is_nullable: 1

=head2 TruckType

  accessor: 'truck_type'
  data_type: 'varchar'
  is_foreign_key: 1
  is_nullable: 1
  size: 24

This is technically the trailer type for the load but will be called TruckType due to nomenclature used in office

=head2 ReeferTempLow

  accessor: 'reefer_temp_low'
  data_type: 'decimal'
  is_nullable: 1
  size: [5,2]

=head2 ReeferTempHigh

  accessor: 'reefer_temp_high'
  data_type: 'decimal'
  is_nullable: 1
  size: [5,2]

=head2 Precooling

  accessor: 'precooling'
  data_type: 'decimal'
  is_nullable: 1
  size: [5,2]

=head2 TempMode

  accessor: 'temp_mode'
  data_type: 'enum'
  extra: {list => ["continuous","start/stop"]}
  is_nullable: 1

=head2 TeamRequired

  accessor: 'team_required'
  data_type: 'enum'
  extra: {list => ["yes","no"]}
  is_nullable: 1

=head2 DispatchNote

  accessor: 'dispatch_note'
  data_type: 'text'
  is_nullable: 1

=head2 Job

  accessor: 'job'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 GoogleRoute

  accessor: 'google_route'
  data_type: 'text'
  is_nullable: 1

=head2 Status

  accessor: 'status'
  data_type: 'varchar'
  is_nullable: 1
  size: 45

Internal status for load, cancelled, tonu, etc.

=head2 LoadRate

  accessor: 'load_rate'
  data_type: 'decimal'
  is_nullable: 0
  size: [12,2]

=cut

__PACKAGE__->add_columns(
    "LoadId",
    {   accessor          => "load_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "CreatedBy",
    {   accessor       => "created_by",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "BrokerId",
    {   accessor       => "broker_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "ShipperId",
    {   accessor       => "shipper_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "BookedBy",
    {   accessor       => "booked_by",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "DateCreated",
    {   accessor                  => "date_created",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        default_value             => "CURRENT_TIMESTAMP",
        is_nullable               => 0,
    },
    "DateBooked",
    {   accessor                  => "date_booked",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
    },
    "LoadNumber",
    {   accessor    => "load_number",
        data_type   => "varchar",
        is_nullable => 1,
        size        => 64,
    },
    "ProNumber",
    {   accessor    => "pro_number",
        data_type   => "varchar",
        is_nullable => 1,
        size        => 16,
    },
    "LoadType",
    {   accessor    => "load_type",
        data_type   => "enum",
        extra       => {list => ["FTL", "LTL", "Partial"]},
        is_nullable => 1,
    },
    "TruckType",
    {   accessor       => "truck_type",
        data_type      => "varchar",
        is_foreign_key => 1,
        is_nullable    => 1,
        size           => 24,
    },
    "ReeferTempLow",
    {   accessor    => "reefer_temp_low",
        data_type   => "decimal",
        is_nullable => 1,
        size        => [5, 2],
    },
    "ReeferTempHigh",
    {   accessor    => "reefer_temp_high",
        data_type   => "decimal",
        is_nullable => 1,
        size        => [5, 2],
    },
    "Precooling",
    {   accessor    => "precooling",
        data_type   => "decimal",
        is_nullable => 1,
        size        => [5, 2],
    },
    "TempMode",
    {   accessor    => "temp_mode",
        data_type   => "enum",
        extra       => {list => ["continuous", "start/stop"]},
        is_nullable => 1,
    },
    "TeamRequired",
    {   accessor    => "team_required",
        data_type   => "enum",
        extra       => {list => ["yes", "no"]},
        is_nullable => 1,
    },
    "DispatchNote",
    {accessor => "dispatch_note", data_type => "text", is_nullable => 1},
    "Job",
    {   accessor       => "job",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "GoogleRoute",
    {accessor => "google_route", data_type => "text", is_nullable => 1},
    "Status",
    {accessor => "status", data_type => "varchar", is_nullable => 1, size => 45},
    "LoadRate",
    {   accessor    => "load_rate",
        data_type   => "decimal",
        is_nullable => 0,
        size        => [12, 2],
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</LoadId>

=back

=cut

__PACKAGE__->set_primary_key("LoadId");

=head1 RELATIONS

=head2 booked_by

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
    "booked_by",
    "TMS::Schema::Result::HrAssociate",
    {AstId => "BookedBy"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

=head2 broker

Type: belongs_to

Related object: L<TMS::Schema::Result::EntCustomer>

=cut

__PACKAGE__->belongs_to(
    "broker",
    "TMS::Schema::Result::EntCustomer",
    {CstmrId       => "BrokerId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 created_by

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
    "created_by",
    "TMS::Schema::Result::HrAssociate",
    {AstId         => "CreatedBy"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 dsp_loads_destinations

Type: has_many

Related object: L<TMS::Schema::Result::DspLoadsDestination>

=cut

__PACKAGE__->has_many(
    "dsp_loads_destinations", "TMS::Schema::Result::DspLoadsDestination",
    {"foreign.LoadId" => "self.LoadId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 dsp_loads_dispatched

Type: has_many

Related object: L<TMS::Schema::Result::DspLoadDispatched>

=cut

__PACKAGE__->has_many(
    "dsp_loads_dispatched", "TMS::Schema::Result::DspLoadDispatched",
    {"foreign.LoadId" => "self.LoadId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 dsp_loads_docs

Type: has_many

Related object: L<TMS::Schema::Result::DspLoadsDoc>

=cut

__PACKAGE__->has_many(
    "dsp_loads_docs",
    "TMS::Schema::Result::DspLoadsDoc",
    {"foreign.LoadId" => "self.LoadId"},
    {cascade_copy     => 0, cascade_delete => 0},
);

=head2 dsp_loads_required_equipments

Type: has_many

Related object: L<TMS::Schema::Result::DspLoadsRequiredEquipment>

=cut

__PACKAGE__->has_many(
    "dsp_loads_required_equipments", "TMS::Schema::Result::DspLoadsRequiredEquipment",
    {"foreign.LoadId" => "self.LoadId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 dsp_trips_loads

Type: has_many

Related object: L<TMS::Schema::Result::DspTripsLoad>

=cut

__PACKAGE__->has_many(
    "dsp_trips_loads", "TMS::Schema::Result::DspTripsLoad",
    {"foreign.LoadId" => "self.LoadId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 job

Type: belongs_to

Related object: L<TMS::Schema::Result::FinJob>

=cut

__PACKAGE__->belongs_to(
    "job",
    "TMS::Schema::Result::FinJob",
    {JobId => "Job"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

=head2 shipper

Type: belongs_to

Related object: L<TMS::Schema::Result::EntShipper>

=cut

__PACKAGE__->belongs_to(
    "shipper",
    "TMS::Schema::Result::EntShipper",
    {ShipperId => "ShipperId"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

=head2 truck_type

Type: belongs_to

Related object: L<TMS::Schema::Result::InvTrailerType>

=cut

__PACKAGE__->belongs_to(
    "truck_type",
    "TMS::Schema::Result::InvTrailerType",
    {Name => "TruckType"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-01-07 08:47:05
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/S9JdXj6GE8VvBiHdqDZsQ

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
