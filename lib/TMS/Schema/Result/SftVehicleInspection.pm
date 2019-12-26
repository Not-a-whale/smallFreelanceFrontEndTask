use utf8;

package TMS::Schema::Result::SftVehicleInspection;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::SftVehicleInspection

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<sft_vehicle_inspections>

=cut

__PACKAGE__->table("sft_vehicle_inspections");

=head1 ACCESSORS

=head2 InspectionId

  accessor: 'inspection_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 InspectionScheduleId

  accessor: 'inspection_schedule_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 InspectorId

  accessor: 'inspector_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 InspectorSignatureId

  accessor: 'inspector_signature_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 LocationOfRecords

  accessor: 'location_of_records'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 InspectionNumber

  accessor: 'inspection_number'
  data_type: 'varchar'
  is_nullable: 0
  size: 10

=head2 DateInspection

  accessor: 'date_inspection'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 0

=head2 Status

  accessor: 'status'
  data_type: 'enum'
  default_value: 'Other'
  extra: {list => ["Passed","Failed","Postponed","Other"]}
  is_nullable: 0

=head2 Remarks

  accessor: 'remarks'
  data_type: 'text'
  is_nullable: 1

=head2 Mileage

  accessor: 'mileage'
  data_type: 'varchar'
  is_nullable: 1
  size: 12

=cut

__PACKAGE__->add_columns(
    "InspectionId",
    {   accessor          => "inspection_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "InspectionScheduleId",
    {   accessor       => "inspection_schedule_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "InspectorId",
    {   accessor       => "inspector_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "InspectorSignatureId",
    {   accessor       => "inspector_signature_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "LocationOfRecords",
    {   accessor       => "location_of_records",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "InspectionNumber",
    {   accessor    => "inspection_number",
        data_type   => "varchar",
        is_nullable => 0,
        size        => 10,
    },
    "DateInspection",
    {   accessor                  => "date_inspection",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        default_value             => "CURRENT_TIMESTAMP",
        is_nullable               => 0,
    },
    "Status",
    {   accessor      => "status",
        data_type     => "enum",
        default_value => "Other",
        extra         => {list => ["Passed", "Failed", "Postponed", "Other"]},
        is_nullable   => 0,
    },
    "Remarks",
    {accessor => "remarks", data_type => "text", is_nullable => 1},
    "Mileage",
    {accessor => "mileage", data_type => "varchar", is_nullable => 1, size => 12},
);

=head1 PRIMARY KEY

=over 4

=item * L</InspectionId>

=back

=cut

__PACKAGE__->set_primary_key("InspectionId");

=head1 RELATIONS

=head2 inspection_schedule

Type: belongs_to

Related object: L<TMS::Schema::Result::SftInspectionSchedule>

=cut

__PACKAGE__->belongs_to(
    "inspection_schedule",
    "TMS::Schema::Result::SftInspectionSchedule",
    {InspectionScheduleId => "InspectionScheduleId"},
    {is_deferrable        => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 inspector

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
    "inspector",
    "TMS::Schema::Result::HrAssociate",
    {AstId         => "InspectorId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 inspector_signature

Type: belongs_to

Related object: L<TMS::Schema::Result::GenFile>

=cut

__PACKAGE__->belongs_to(
    "inspector_signature",
    "TMS::Schema::Result::GenFile",
    {FileId        => "InspectorSignatureId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 location_of_records

Type: belongs_to

Related object: L<TMS::Schema::Result::CntAddress>

=cut

__PACKAGE__->belongs_to(
    "location_of_records",
    "TMS::Schema::Result::CntAddress",
    {AddrId        => "LocationOfRecords"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 sft_vehicle_inspected_items

Type: has_many

Related object: L<TMS::Schema::Result::SftVehicleInspectedItem>

=cut

__PACKAGE__->has_many(
    "sft_vehicle_inspected_items", "TMS::Schema::Result::SftVehicleInspectedItem",
    {"foreign.InspectionId" => "self.InspectionId"}, {cascade_copy => 0, cascade_delete => 0},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-25 21:12:39
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:7OCfOXfI0AG8OXX0HF/8/g

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
