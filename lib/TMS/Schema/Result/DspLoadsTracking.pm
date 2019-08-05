use utf8;
package TMS::Schema::Result::DspLoadsTracking;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::DspLoadsTracking - Entries of loads being delivered or recieved

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<dsp_loads_tracking>

=cut

__PACKAGE__->table("dsp_loads_tracking");

=head1 ACCESSORS

=head2 DestinationId

  accessor: 'destination_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 DriverId

  accessor: 'driver_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 DateArrived

  accessor: 'date_arrived'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 DateDeparted

  accessor: 'date_departed'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 Pallets

  accessor: 'pallets'
  data_type: 'integer'
  is_nullable: 1

=head2 Weight

  accessor: 'weight'
  data_type: 'float'
  is_nullable: 1

=head2 Pieces

  accessor: 'pieces'
  data_type: 'integer'
  is_nullable: 1

=head2 BolPod

  accessor: 'bol_pod'
  data_type: 'enum'
  default_value: 'na'
  extra: {list => ["yes","no","na"]}
  is_nullable: 0

=head2 BolPodNumber

  accessor: 'bol_pod_number'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 SealNumber

  accessor: 'seal_number'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 Notes

  accessor: 'notes'
  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "DestinationId",
  {
    accessor       => "destination_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "DriverId",
  {
    accessor       => "driver_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "DateArrived",
  {
    accessor => "date_arrived",
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "DateDeparted",
  {
    accessor => "date_departed",
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "Pallets",
  { accessor => "pallets", data_type => "integer", is_nullable => 1 },
  "Weight",
  { accessor => "weight", data_type => "float", is_nullable => 1 },
  "Pieces",
  { accessor => "pieces", data_type => "integer", is_nullable => 1 },
  "BolPod",
  {
    accessor      => "bol_pod",
    data_type     => "enum",
    default_value => "na",
    extra         => { list => ["yes", "no", "na"] },
    is_nullable   => 0,
  },
  "BolPodNumber",
  {
    accessor => "bol_pod_number",
    data_type => "varchar",
    is_nullable => 1,
    size => 255,
  },
  "SealNumber",
  {
    accessor => "seal_number",
    data_type => "varchar",
    is_nullable => 1,
    size => 255,
  },
  "Notes",
  { accessor => "notes", data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</DestinationId>

=back

=cut

__PACKAGE__->set_primary_key("DestinationId");

=head1 RELATIONS

=head2 destination

Type: belongs_to

Related object: L<TMS::Schema::Result::DspLoadsDestination>

=cut

__PACKAGE__->belongs_to(
  "destination",
  "TMS::Schema::Result::DspLoadsDestination",
  { DestinationId => "DestinationId" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);

=head2 driver

Type: belongs_to

Related object: L<TMS::Schema::Result::DrvDriver>

=cut

__PACKAGE__->belongs_to(
  "driver",
  "TMS::Schema::Result::DrvDriver",
  { DriverId => "DriverId" },
  { is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-05 10:27:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:tF6PFZvCacIr3vNgk7MF5w


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;