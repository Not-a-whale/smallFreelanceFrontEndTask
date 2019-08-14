use utf8;
package TMS::Schema::Result::SftInspectionSchedule;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::SftInspectionSchedule

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<sft_inspection_schedules>

=cut

__PACKAGE__->table("sft_inspection_schedules");

=head1 ACCESSORS

=head2 InspectionScheduleId

  accessor: 'inspection_schedule_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 VehicleId

  accessor: 'vehicle_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 InspectionType

  accessor: 'inspection_type'
  data_type: 'enum'
  extra: {list => ["Quarterly","Annually","90 Days"]}
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "InspectionScheduleId",
  {
    accessor => "inspection_schedule_id",
    data_type => "bigint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "VehicleId",
  {
    accessor       => "vehicle_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "InspectionType",
  {
    accessor    => "inspection_type",
    data_type   => "enum",
    extra       => { list => ["Quarterly", "Annually", "90 Days"] },
    is_nullable => 1,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</InspectionScheduleId>

=back

=cut

__PACKAGE__->set_primary_key("InspectionScheduleId");

=head1 RELATIONS

=head2 sft_vehicle_inspections

Type: has_many

Related object: L<TMS::Schema::Result::SftVehicleInspection>

=cut

__PACKAGE__->has_many(
  "sft_vehicle_inspections",
  "TMS::Schema::Result::SftVehicleInspection",
  { "foreign.InspectionScheduleId" => "self.InspectionScheduleId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 vehicle

Type: belongs_to

Related object: L<TMS::Schema::Result::InvVehicle>

=cut

__PACKAGE__->belongs_to(
  "vehicle",
  "TMS::Schema::Result::InvVehicle",
  { VehicleId => "VehicleId" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-13 13:28:57
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:h0hl48/Qf7Kghhja+LRmiQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;