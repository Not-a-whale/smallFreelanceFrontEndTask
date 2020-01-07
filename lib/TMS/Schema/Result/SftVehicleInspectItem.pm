use utf8;

package TMS::Schema::Result::SftVehicleInspectItem;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::SftVehicleInspectItem

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<sft_vehicle_inspect_items>

=cut

__PACKAGE__->table("sft_vehicle_inspect_items");

=head1 ACCESSORS

=head2 InspItmId

  accessor: 'insp_itm_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 ItemAreaName

  accessor: 'item_area_name'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 Notes

  accessor: 'notes'
  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
    "InspItmId",
    {   accessor          => "insp_itm_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "ItemAreaName",
    {   accessor    => "item_area_name",
        data_type   => "varchar",
        is_nullable => 0,
        size        => 255,
    },
    "Notes",
    {accessor => "notes", data_type => "text", is_nullable => 1},
);

=head1 PRIMARY KEY

=over 4

=item * L</InspItmId>

=back

=cut

__PACKAGE__->set_primary_key("InspItmId");

=head1 UNIQUE CONSTRAINTS

=head2 C<ItemAreaName_UNIQUE>

=over 4

=item * L</ItemAreaName>

=back

=cut

__PACKAGE__->add_unique_constraint("ItemAreaName_UNIQUE", ["ItemAreaName"]);

=head1 RELATIONS

=head2 sft_vehicle_inspected_items

Type: has_many

Related object: L<TMS::Schema::Result::SftVehicleInspectedItem>

=cut

__PACKAGE__->has_many(
    "sft_vehicle_inspected_items", "TMS::Schema::Result::SftVehicleInspectedItem",
    {"foreign.InspectedItem" => "self.InspItmId"}, {cascade_copy => 0, cascade_delete => 0},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-01-07 08:47:06
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:RH5yQs/i7nrPXv0/SkfyDQ

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
