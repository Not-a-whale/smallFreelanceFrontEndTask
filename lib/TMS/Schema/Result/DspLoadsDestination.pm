use utf8;

package TMS::Schema::Result::DspLoadsDestination;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::DspLoadsDestination

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<dsp_loads_destinations>

=cut

__PACKAGE__->table("dsp_loads_destinations");

=head1 ACCESSORS

=head2 DestinationId

  accessor: 'destination_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 LoadId

  accessor: 'load_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 PU_PO

  accessor: 'pu_po'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

PU#/PO# ????

=head2 Commodity

  accessor: 'commodity'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 Pallets

  accessor: 'pallets'
  data_type: 'integer'
  is_nullable: 1

=head2 Pieces

  accessor: 'pieces'
  data_type: 'integer'
  is_nullable: 1

=head2 Weight

  accessor: 'weight'
  data_type: 'float'
  is_nullable: 1

=head2 AppointmentStart

  accessor: 'appointment_start'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 AppointmentEnd

  accessor: 'appointment_end'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 AppointmentType

  accessor: 'appointment_type'
  data_type: 'enum'
  extra: {list => ["Appointment","Time Open"]}
  is_nullable: 0

=head2 StopOrder

  accessor: 'stop_order'
  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=head2 StopType

  accessor: 'stop_type'
  data_type: 'enum'
  extra: {list => ["PickUp","DropOff"]}
  is_nullable: 0

=head2 Branch

  accessor: 'branch'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 AppointmentNotes

  accessor: 'appointment_notes'
  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
    "DestinationId",
    {   accessor          => "destination_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "LoadId",
    {   accessor       => "load_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "PU_PO",
    {accessor => "pu_po", data_type => "varchar", is_nullable => 0, size => 255},
    "Commodity",
    {   accessor    => "commodity",
        data_type   => "varchar",
        is_nullable => 0,
        size        => 255,
    },
    "Pallets",
    {accessor => "pallets", data_type => "integer", is_nullable => 1},
    "Pieces",
    {accessor => "pieces", data_type => "integer", is_nullable => 1},
    "Weight",
    {accessor => "weight", data_type => "float", is_nullable => 1},
    "AppointmentStart",
    {   accessor                  => "appointment_start",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        is_nullable               => 0,
    },
    "AppointmentEnd",
    {   accessor                  => "appointment_end",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
    },
    "AppointmentType",
    {   accessor    => "appointment_type",
        data_type   => "enum",
        extra       => {list => ["Appointment", "Time Open"]},
        is_nullable => 0,
    },
    "StopOrder",
    {   accessor      => "stop_order",
        data_type     => "integer",
        default_value => 0,
        is_nullable   => 0,
    },
    "StopType",
    {   accessor    => "stop_type",
        data_type   => "enum",
        extra       => {list => ["PickUp", "DropOff"]},
        is_nullable => 0,
    },
    "Branch",
    {   accessor       => "branch",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "AppointmentNotes",
    {accessor => "appointment_notes", data_type => "text", is_nullable => 1},
);

=head1 PRIMARY KEY

=over 4

=item * L</DestinationId>

=back

=cut

__PACKAGE__->set_primary_key("DestinationId");

=head1 RELATIONS

=head2 branch

Type: belongs_to

Related object: L<TMS::Schema::Result::BizBranch>

=cut

__PACKAGE__->belongs_to(
    "branch",
    "TMS::Schema::Result::BizBranch",
    {BrnchId       => "Branch"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 dsp_loads_destinations_docs

Type: has_many

Related object: L<TMS::Schema::Result::DspLoadsDestinationsDoc>

=cut

__PACKAGE__->has_many(
    "dsp_loads_destinations_docs", "TMS::Schema::Result::DspLoadsDestinationsDoc",
    {"foreign.LoadDestinationId" => "self.DestinationId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 dsp_loads_tracking

Type: might_have

Related object: L<TMS::Schema::Result::DspLoadsTracking>

=cut

__PACKAGE__->might_have(
    "dsp_loads_tracking",
    "TMS::Schema::Result::DspLoadsTracking",
    {"foreign.DestinationId" => "self.DestinationId"},
    {cascade_copy            => 0, cascade_delete => 0},
);

=head2 load

Type: belongs_to

Related object: L<TMS::Schema::Result::DspLoad>

=cut

__PACKAGE__->belongs_to(
    "load",
    "TMS::Schema::Result::DspLoad",
    {LoadId        => "LoadId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-03-10 16:28:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:RM1Ald11ejpi6XbBLEHyoQ

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
