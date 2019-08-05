use utf8;
package TMS::Schema::Result::CntAddress;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::CntAddress

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<cnt_addresses>

=cut

__PACKAGE__->table("cnt_addresses");

=head1 ACCESSORS

=head2 AddrId

  accessor: 'addr_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 Street1

  accessor: 'street1'
  data_type: 'varchar'
  is_nullable: 0
  size: 64

Street or P.O. Box

=head2 Street2

  accessor: 'street2'
  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

Street

=head2 Street3

  accessor: 'street3'
  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 64

=head2 City

  accessor: 'city'
  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 State

  accessor: 'state'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 Zip

  accessor: 'zip'
  data_type: 'char'
  is_nullable: 0
  size: 11

=head2 GpsLng

  accessor: 'gps_lng'
  data_type: 'double precision'
  is_nullable: 1

=head2 GpsLat

  accessor: 'gps_lat'
  data_type: 'double precision'
  is_nullable: 1

=head2 Notes

  accessor: 'notes'
  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "AddrId",
  {
    accessor => "addr_id",
    data_type => "bigint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "Street1",
  { accessor => "street1", data_type => "varchar", is_nullable => 0, size => 64 },
  "Street2",
  {
    accessor => "street2",
    data_type => "varchar",
    default_value => "",
    is_nullable => 0,
    size => 64,
  },
  "Street3",
  {
    accessor => "street3",
    data_type => "varchar",
    default_value => "",
    is_nullable => 0,
    size => 64,
  },
  "City",
  { accessor => "city", data_type => "varchar", is_nullable => 0, size => 64 },
  "State",
  {
    accessor       => "state",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "Zip",
  { accessor => "zip", data_type => "char", is_nullable => 0, size => 11 },
  "GpsLng",
  {
    accessor    => "gps_lng",
    data_type   => "double precision",
    is_nullable => 1,
  },
  "GpsLat",
  {
    accessor    => "gps_lat",
    data_type   => "double precision",
    is_nullable => 1,
  },
  "Notes",
  { accessor => "notes", data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</AddrId>

=back

=cut

__PACKAGE__->set_primary_key("AddrId");

=head1 UNIQUE CONSTRAINTS

=head2 C<UnqAddr>

=over 4

=item * L</Street1>

=item * L</Street2>

=item * L</City>

=item * L</State>

=item * L</Zip>

=item * L</Street3>

=back

=cut

__PACKAGE__->add_unique_constraint(
  "UnqAddr",
  ["Street1", "Street2", "City", "State", "Zip", "Street3"],
);

=head1 RELATIONS

=head2 biz_branches

Type: has_many

Related object: L<TMS::Schema::Result::BizBranch>

=cut

__PACKAGE__->has_many(
  "biz_branches",
  "TMS::Schema::Result::BizBranch",
  { "foreign.BrnchAddress" => "self.AddrId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 dsp_loads_destinations

Type: has_many

Related object: L<TMS::Schema::Result::DspLoadsDestination>

=cut

__PACKAGE__->has_many(
  "dsp_loads_destinations",
  "TMS::Schema::Result::DspLoadsDestination",
  { "foreign.AddressId" => "self.AddrId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 fin_billing_infos

Type: has_many

Related object: L<TMS::Schema::Result::FinBillingInfo>

=cut

__PACKAGE__->has_many(
  "fin_billing_infos",
  "TMS::Schema::Result::FinBillingInfo",
  { "foreign.Address" => "self.AddrId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 hr_residences

Type: has_many

Related object: L<TMS::Schema::Result::HrResidence>

=cut

__PACKAGE__->has_many(
  "hr_residences",
  "TMS::Schema::Result::HrResidence",
  { "foreign.ResAddress" => "self.AddrId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 sft_vehicle_inspections

Type: has_many

Related object: L<TMS::Schema::Result::SftVehicleInspection>

=cut

__PACKAGE__->has_many(
  "sft_vehicle_inspections",
  "TMS::Schema::Result::SftVehicleInspection",
  { "foreign.LocationOfRecords" => "self.AddrId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 state

Type: belongs_to

Related object: L<TMS::Schema::Result::CntState>

=cut

__PACKAGE__->belongs_to(
  "state",
  "TMS::Schema::Result::CntState",
  { StateId => "State" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-05 10:27:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:qUDRRiofF/9y//IXjFo8TA


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;