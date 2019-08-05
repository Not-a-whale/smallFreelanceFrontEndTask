use utf8;
package TMS::Schema::Result::InvEquipment;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::InvEquipment - Connects all equipment tables with unique primary keys

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<inv_equipment>

=cut

__PACKAGE__->table("inv_equipment");

=head1 ACCESSORS

=head2 EquipmentId

  accessor: 'equipment_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 GeneralName

  accessor: 'general_name'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 OwnerId

  accessor: 'owner_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 UnitId

  accessor: 'unit_id'
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

=head2 DatePurchased

  accessor: 'date_purchased'
  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 DateSold

  accessor: 'date_sold'
  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 PricePurchased

  accessor: 'price_purchased'
  data_type: 'decimal'
  is_nullable: 1
  size: [12,2]

=head2 PriceSold

  accessor: 'price_sold'
  data_type: 'decimal'
  is_nullable: 1
  size: [12,2]

=head2 SerialNo

  accessor: 'serial_no'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=cut

__PACKAGE__->add_columns(
  "EquipmentId",
  {
    accessor => "equipment_id",
    data_type => "bigint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "GeneralName",
  {
    accessor => "general_name",
    data_type => "varchar",
    is_nullable => 1,
    size => 255,
  },
  "OwnerId",
  {
    accessor       => "owner_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "UnitId",
  {
    accessor       => "unit_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 1,
  },
  "VendorId",
  {
    accessor       => "vendor_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 1,
  },
  "DatePurchased",
  {
    accessor => "date_purchased",
    data_type => "date",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "DateSold",
  {
    accessor => "date_sold",
    data_type => "date",
    datetime_undef_if_invalid => 1,
    is_nullable => 1,
  },
  "PricePurchased",
  {
    accessor => "price_purchased",
    data_type => "decimal",
    is_nullable => 1,
    size => [12, 2],
  },
  "PriceSold",
  {
    accessor => "price_sold",
    data_type => "decimal",
    is_nullable => 1,
    size => [12, 2],
  },
  "SerialNo",
  {
    accessor => "serial_no",
    data_type => "varchar",
    is_nullable => 1,
    size => 255,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</EquipmentId>

=back

=cut

__PACKAGE__->set_primary_key("EquipmentId");

=head1 RELATIONS

=head2 inv_elog_device

Type: might_have

Related object: L<TMS::Schema::Result::InvElogDevice>

=cut

__PACKAGE__->might_have(
  "inv_elog_device",
  "TMS::Schema::Result::InvElogDevice",
  { "foreign.ElogDeviceId" => "self.EquipmentId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 inv_equipment_docs

Type: has_many

Related object: L<TMS::Schema::Result::InvEquipmentDoc>

=cut

__PACKAGE__->has_many(
  "inv_equipment_docs",
  "TMS::Schema::Result::InvEquipmentDoc",
  { "foreign.EquipmentId" => "self.EquipmentId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 inv_equipments_to_support

Type: has_many

Related object: L<TMS::Schema::Result::InvEquipmentToSupport>

=cut

__PACKAGE__->has_many(
  "inv_equipments_to_support",
  "TMS::Schema::Result::InvEquipmentToSupport",
  { "foreign.EquipmentId" => "self.EquipmentId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 inv_notes

Type: has_many

Related object: L<TMS::Schema::Result::InvNote>

=cut

__PACKAGE__->has_many(
  "inv_notes",
  "TMS::Schema::Result::InvNote",
  { "foreign.EquipmentId" => "self.EquipmentId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 inv_units_to_equipments

Type: has_many

Related object: L<TMS::Schema::Result::InvUnitsToEquipment>

=cut

__PACKAGE__->has_many(
  "inv_units_to_equipments",
  "TMS::Schema::Result::InvUnitsToEquipment",
  { "foreign.EquipmentId" => "self.EquipmentId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 inv_vehicle

Type: might_have

Related object: L<TMS::Schema::Result::InvVehicle>

=cut

__PACKAGE__->might_have(
  "inv_vehicle",
  "TMS::Schema::Result::InvVehicle",
  { "foreign.VehicleId" => "self.EquipmentId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 owner

Type: belongs_to

Related object: L<TMS::Schema::Result::Entity>

=cut

__PACKAGE__->belongs_to(
  "owner",
  "TMS::Schema::Result::Entity",
  { EntityId => "OwnerId" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);

=head2 sft_elog_stats

Type: has_many

Related object: L<TMS::Schema::Result::SftElogStat>

=cut

__PACKAGE__->has_many(
  "sft_elog_stats",
  "TMS::Schema::Result::SftElogStat",
  { "foreign.EquipmentId" => "self.EquipmentId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 unit

Type: belongs_to

Related object: L<TMS::Schema::Result::InvUnit>

=cut

__PACKAGE__->belongs_to(
  "unit",
  "TMS::Schema::Result::InvUnit",
  { UnitId => "UnitId" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "CASCADE",
  },
);

=head2 vendor

Type: belongs_to

Related object: L<TMS::Schema::Result::BizBranch>

=cut

__PACKAGE__->belongs_to(
  "vendor",
  "TMS::Schema::Result::BizBranch",
  { BrnchId => "VendorId" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "CASCADE",
  },
);

=head2 files

Type: many_to_many

Composing rels: L</inv_equipment_docs> -> file

=cut

__PACKAGE__->many_to_many("files", "inv_equipment_docs", "file");

=head2 supports

Type: many_to_many

Composing rels: L</inv_equipments_to_support> -> support

=cut

__PACKAGE__->many_to_many("supports", "inv_equipments_to_support", "support");


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-05 15:51:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:l9sEjgiSDrDC8s8Z2d4JzA


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;