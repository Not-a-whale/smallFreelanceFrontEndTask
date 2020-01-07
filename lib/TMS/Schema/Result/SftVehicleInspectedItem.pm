use utf8;

package TMS::Schema::Result::SftVehicleInspectedItem;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::SftVehicleInspectedItem

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<sft_vehicle_inspected_items>

=cut

__PACKAGE__->table("sft_vehicle_inspected_items");

=head1 ACCESSORS

=head2 InspectedId

  accessor: 'inspected_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 InspectionId

  accessor: 'inspection_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 InspectedItem

  accessor: 'inspected_item'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 Status

  accessor: 'status'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 InspectedDate

  accessor: 'inspected_date'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "InspectedId",
    {   accessor          => "inspected_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "InspectionId",
    {   accessor       => "inspection_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "InspectedItem",
    {   accessor       => "inspected_item",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "Status",
    {   accessor    => "status",
        data_type   => "enum",
        extra       => {list => ["NA", "OK", "REPAIR"]},
        is_nullable => 0,
    },
    "InspectedDate",
    {   accessor                  => "inspected_date",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        default_value             => "CURRENT_TIMESTAMP",
        is_nullable               => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</InspectedId>

=back

=cut

__PACKAGE__->set_primary_key("InspectedId");

=head1 RELATIONS

=head2 inspected_item

Type: belongs_to

Related object: L<TMS::Schema::Result::SftVehicleInspectItem>

=cut

__PACKAGE__->belongs_to(
    "inspected_item",
    "TMS::Schema::Result::SftVehicleInspectItem",
    {InspItmId     => "InspectedItem"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 inspection

Type: belongs_to

Related object: L<TMS::Schema::Result::SftVehicleInspection>

=cut

__PACKAGE__->belongs_to(
    "inspection",
    "TMS::Schema::Result::SftVehicleInspection",
    {InspectionId  => "InspectionId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 sft_vehicle_inspect_proofs

Type: has_many

Related object: L<TMS::Schema::Result::SftVehicleInspectProof>

=cut

__PACKAGE__->has_many(
    "sft_vehicle_inspect_proofs", "TMS::Schema::Result::SftVehicleInspectProof",
    {"foreign.InspectedItemId" => "self.InspectedId"}, {cascade_copy => 0, cascade_delete => 0},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-01-07 08:47:06
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:fHlEd71YwDVeJG5FZPU9yg

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
