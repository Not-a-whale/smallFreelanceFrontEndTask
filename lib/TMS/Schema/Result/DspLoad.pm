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

=head2 CustomerId

  accessor: 'customer_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 CustomerAgentId

  accessor: 'customer_agent_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 VendorId

  accessor: 'vendor_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 VendorAgentId

  accessor: 'vendor_agent_id'
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

=head2 CustomerRefNumber

  accessor: 'customer_ref_number'
  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 LoadType

  accessor: 'load_type'
  data_type: 'enum'
  extra: {list => ["full","partial"]}
  is_nullable: 1

=head2 Comodotiy

  accessor: 'comodotiy'
  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 Weight

  accessor: 'weight'
  data_type: 'float'
  is_nullable: 1

=head2 WeightUnit

  accessor: 'weight_unit'
  data_type: 'enum'
  default_value: 'lbs'
  extra: {list => ["lbs","kg"]}
  is_nullable: 0

=head2 Pieces

  accessor: 'pieces'
  data_type: 'integer'
  is_nullable: 1

=head2 Pallets

  accessor: 'pallets'
  data_type: 'integer'
  is_nullable: 1

=head2 Distance

  accessor: 'distance'
  data_type: 'decimal'
  is_nullable: 1
  size: [12,2]

=head2 DistanceUnit

  accessor: 'distance_unit'
  data_type: 'enum'
  default_value: 'mi'
  extra: {list => ["mi","km"]}
  is_nullable: 0

=head2 ProductTemp

  accessor: 'product_temp'
  data_type: 'decimal'
  is_nullable: 1
  size: [5,2]

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

=head2 TemperatureMode

  accessor: 'temperature_mode'
  data_type: 'enum'
  extra: {list => ["continuous","cycle-sentry","na"]}
  is_nullable: 1

=head2 TemperatureUnit

  accessor: 'temperature_unit'
  data_type: 'enum'
  default_value: 'F'
  extra: {list => ["F","C","K"]}
  is_nullable: 0

=head2 TeamRequired

  accessor: 'team_required'
  data_type: 'enum'
  extra: {list => ["yes","no"]}
  is_nullable: 1

=head2 LoadTerms

  accessor: 'load_terms'
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
    "CustomerId",
    {   accessor       => "customer_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "CustomerAgentId",
    {   accessor       => "customer_agent_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "VendorId",
    {   accessor       => "vendor_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "VendorAgentId",
    {   accessor       => "vendor_agent_id",
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
    "CustomerRefNumber",
    {   accessor    => "customer_ref_number",
        data_type   => "varchar",
        is_nullable => 1,
        size        => 64,
    },
    "LoadType",
    {   accessor    => "load_type",
        data_type   => "enum",
        extra       => {list => ["full", "partial"]},
        is_nullable => 1,
    },
    "Comodotiy",
    {   accessor    => "comodotiy",
        data_type   => "varchar",
        is_nullable => 0,
        size        => 64,
    },
    "Weight",
    {accessor => "weight", data_type => "float", is_nullable => 1},
    "WeightUnit",
    {   accessor      => "weight_unit",
        data_type     => "enum",
        default_value => "lbs",
        extra         => {list => ["lbs", "kg"]},
        is_nullable   => 0,
    },
    "Pieces",
    {accessor => "pieces", data_type => "integer", is_nullable => 1},
    "Pallets",
    {accessor => "pallets", data_type => "integer", is_nullable => 1},
    "Distance",
    {   accessor    => "distance",
        data_type   => "decimal",
        is_nullable => 1,
        size        => [12, 2],
    },
    "DistanceUnit",
    {   accessor      => "distance_unit",
        data_type     => "enum",
        default_value => "mi",
        extra         => {list => ["mi", "km"]},
        is_nullable   => 0,
    },
    "ProductTemp",
    {   accessor    => "product_temp",
        data_type   => "decimal",
        is_nullable => 1,
        size        => [5, 2],
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
    "TemperatureMode",
    {   accessor    => "temperature_mode",
        data_type   => "enum",
        extra       => {list => ["continuous", "cycle-sentry", "na"]},
        is_nullable => 1,
    },
    "TemperatureUnit",
    {   accessor      => "temperature_unit",
        data_type     => "enum",
        default_value => "F",
        extra         => {list => ["F", "C", "K"]},
        is_nullable   => 0,
    },
    "TeamRequired",
    {   accessor    => "team_required",
        data_type   => "enum",
        extra       => {list => ["yes", "no"]},
        is_nullable => 1,
    },
    "LoadTerms",
    {accessor => "load_terms", data_type => "text", is_nullable => 1},
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

=head2 brk_loadstatuses

Type: has_many

Related object: L<TMS::Schema::Result::BrkLoadstatus>

=cut

__PACKAGE__->has_many(
    "brk_loadstatuses", "TMS::Schema::Result::BrkLoadstatus",
    {"foreign.LoadId" => "self.LoadId"}, {cascade_copy => 0, cascade_delete => 0},
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

=head2 customer

Type: belongs_to

Related object: L<TMS::Schema::Result::EntBusiness>

=cut

__PACKAGE__->belongs_to(
    "customer",
    "TMS::Schema::Result::EntBusiness",
    {BizId         => "CustomerId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 customer_agent

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
    "customer_agent",
    "TMS::Schema::Result::HrAssociate",
    {AstId => "CustomerAgentId"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
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

=head2 vendor

Type: belongs_to

Related object: L<TMS::Schema::Result::EntBusiness>

=cut

__PACKAGE__->belongs_to(
    "vendor",
    "TMS::Schema::Result::EntBusiness",
    {BizId => "VendorId"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

=head2 vendor_agent

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
    "vendor_agent",
    "TMS::Schema::Result::HrAssociate",
    {AstId => "VendorAgentId"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-05-25 15:45:37
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:LUduAt8yF2hHYC5gqI+76g

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
