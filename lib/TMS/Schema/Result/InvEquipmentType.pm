use utf8;

package TMS::Schema::Result::InvEquipmentType;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::InvEquipmentType - Types of equipment used for load requirement contraints

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<inv_equipment_types>

=cut

__PACKAGE__->table("inv_equipment_types");

=head1 ACCESSORS

=head2 EquipmentTypeId

  accessor: 'equipment_type_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 Name

  accessor: 'name'
  data_type: 'varchar'
  is_nullable: 0
  size: 64

=cut

__PACKAGE__->add_columns(
    "EquipmentTypeId",
    {   accessor          => "equipment_type_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "Name",
    {accessor => "name", data_type => "varchar", is_nullable => 0, size => 64},
);

=head1 PRIMARY KEY

=over 4

=item * L</EquipmentTypeId>

=back

=cut

__PACKAGE__->set_primary_key("EquipmentTypeId");

=head1 RELATIONS

=head2 dsp_loads_required_equipments

Type: has_many

Related object: L<TMS::Schema::Result::DspLoadsRequiredEquipment>

=cut

__PACKAGE__->has_many(
    "dsp_loads_required_equipments", "TMS::Schema::Result::DspLoadsRequiredEquipment",
    {"foreign.EquipmentType" => "self.EquipmentTypeId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 inv_equipments

Type: has_many

Related object: L<TMS::Schema::Result::InvEquipment>

=cut

__PACKAGE__->has_many(
    "inv_equipments",
    "TMS::Schema::Result::InvEquipment",
    {"foreign.EquipmentType" => "self.EquipmentTypeId"},
    {cascade_copy            => 0, cascade_delete => 0},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-01-08 10:28:18
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:CN9itwUXzRK3hcD1IQH69g

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
