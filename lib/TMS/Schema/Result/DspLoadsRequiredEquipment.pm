use utf8;

package TMS::Schema::Result::DspLoadsRequiredEquipment;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::DspLoadsRequiredEquipment

=head1 DESCRIPTION

list of equipment required for the load, will be used to search for trucks that satisfy the criteria 

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<dsp_loads_required_equipment>

=cut

__PACKAGE__->table("dsp_loads_required_equipment");

=head1 ACCESSORS

=head2 LoadsEquipId

  accessor: 'loads_equip_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 LoadId

  accessor: 'load_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 EquipmentType

  accessor: 'equipment_type'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "LoadsEquipId",
    {   accessor    => "loads_equip_id",
        data_type   => "bigint",
        extra       => {unsigned => 1},
        is_nullable => 0,
    },
    "LoadId",
    {   accessor       => "load_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "EquipmentType",
    {   accessor       => "equipment_type",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</LoadsEquipId>

=back

=cut

__PACKAGE__->set_primary_key("LoadsEquipId");

=head1 RELATIONS

=head2 equipment_type

Type: belongs_to

Related object: L<TMS::Schema::Result::InvEquipmentType>

=cut

__PACKAGE__->belongs_to(
    "equipment_type",
    "TMS::Schema::Result::InvEquipmentType",
    {EquipmentTypeId => "EquipmentType"},
    {is_deferrable   => 1, on_delete => "NO ACTION", on_update => "NO ACTION"},
);

=head2 load

Type: belongs_to

Related object: L<TMS::Schema::Result::DspLoad>

=cut

__PACKAGE__->belongs_to(
    "load",
    "TMS::Schema::Result::DspLoad",
    {LoadId        => "LoadId"},
    {is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-06-02 20:08:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Ou+f5rqVn5eCgiAjiJH+mQ

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
