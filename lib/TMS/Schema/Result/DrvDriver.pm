use utf8;

package TMS::Schema::Result::DrvDriver;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::DrvDriver

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<drv_drivers>

=cut

__PACKAGE__->table("drv_drivers");

=head1 ACCESSORS

=head2 DriverId

  accessor: 'driver_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 LocalRoutes

  accessor: 'local_routes'
  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 InternationalRoutes

  accessor: 'international_routes'
  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 LastAnnualReview

  accessor: 'last_annual_review'
  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 PullNotice

  accessor: 'pull_notice'
  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
    "DriverId",
    {   accessor       => "driver_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "LocalRoutes",
    {   accessor      => "local_routes",
        data_type     => "tinyint",
        default_value => 0,
        extra         => {unsigned => 1},
        is_nullable   => 0,
    },
    "InternationalRoutes",
    {   accessor      => "international_routes",
        data_type     => "tinyint",
        default_value => 0,
        extra         => {unsigned => 1},
        is_nullable   => 0,
    },
    "LastAnnualReview",
    {   accessor                  => "last_annual_review",
        data_type                 => "date",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
    },
    "PullNotice",
    {   accessor                  => "pull_notice",
        data_type                 => "date",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</DriverId>

=back

=cut

__PACKAGE__->set_primary_key("DriverId");

=head1 RELATIONS

=head2 driver

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
    "driver",
    "TMS::Schema::Result::HrAssociate",
    {AstId         => "DriverId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 drv_driverlicences

Type: has_many

Related object: L<TMS::Schema::Result::DrvDriverlicence>

=cut

__PACKAGE__->has_many(
    "drv_driverlicences", "TMS::Schema::Result::DrvDriverlicence",
    {"foreign.DriverId" => "self.DriverId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 drv_medcards

Type: has_many

Related object: L<TMS::Schema::Result::DrvMedcard>

=cut

__PACKAGE__->has_many(
    "drv_medcards",
    "TMS::Schema::Result::DrvMedcard",
    {"foreign.DriverId" => "self.DriverId"},
    {cascade_copy       => 0, cascade_delete => 0},
);

=head2 drv_schedules

Type: has_many

Related object: L<TMS::Schema::Result::DrvSchedule>

=cut

__PACKAGE__->has_many(
    "drv_schedules",
    "TMS::Schema::Result::DrvSchedule",
    {"foreign.DriverId" => "self.DriverId"},
    {cascade_copy       => 0, cascade_delete => 0},
);

=head2 dsp_loads_trackings

Type: has_many

Related object: L<TMS::Schema::Result::DspLoadsTracking>

=cut

__PACKAGE__->has_many(
    "dsp_loads_trackings", "TMS::Schema::Result::DspLoadsTracking",
    {"foreign.DriverId" => "self.DriverId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 sft_log_entries

Type: has_many

Related object: L<TMS::Schema::Result::SftLogEntry>

=cut

__PACKAGE__->has_many(
    "sft_log_entries",
    "TMS::Schema::Result::SftLogEntry",
    {"foreign.DriverId" => "self.DriverId"},
    {cascade_copy       => 0, cascade_delete => 0},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-04-28 11:12:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:RRcKpY6POeKzW0rSftN5qQ

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
