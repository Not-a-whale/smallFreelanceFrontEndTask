use utf8;

package TMS::Schema::Result::DspTrip;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::DspTrip

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<dsp_trips>

=cut

__PACKAGE__->table("dsp_trips");

=head1 ACCESSORS

=head2 TripId

  accessor: 'trip_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

For financial purposes TripNumber === JobNumber, TripId === JobId

=head2 CreatedBy

  accessor: 'created_by'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 TripNumber

  accessor: 'trip_number'
  data_type: 'varchar'
  is_nullable: 0
  size: 12

For financial purposes TripNumber === JobNumber, TripId === JobId

=head2 DateCreated

  accessor: 'date_created'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 0

=head2 DateStarted

  accessor: 'date_started'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 DateCompleted

  accessor: 'date_completed'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 DateBooked

  accessor: 'date_booked'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 DateDispatched

  accessor: 'date_dispatched'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 IsValid

  accessor: 'is_valid'
  data_type: 'tinyint'
  default_value: 1
  extra: {unsigned => 1}
  is_nullable: 0

=head2 TripStatus

  accessor: 'trip_status'
  data_type: 'enum'
  extra: {list => ["Pending","Dispatched","Complete","Other","TONU","Cancelled"]}
  is_nullable: 0

=head2 Notes

  accessor: 'notes'
  data_type: 'text'
  is_nullable: 1

=head2 GoogleRoute

  accessor: 'google_route'
  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
    "TripId",
    {   accessor          => "trip_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "CreatedBy",
    {   accessor       => "created_by",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "TripNumber",
    {   accessor    => "trip_number",
        data_type   => "varchar",
        is_nullable => 0,
        size        => 12,
    },
    "DateCreated",
    {   accessor                  => "date_created",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        default_value             => "CURRENT_TIMESTAMP",
        is_nullable               => 0,
    },
    "DateStarted",
    {   accessor                  => "date_started",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
    },
    "DateCompleted",
    {   accessor                  => "date_completed",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
    },
    "DateBooked",
    {   accessor                  => "date_booked",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
    },
    "DateDispatched",
    {   accessor                  => "date_dispatched",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
    },
    "IsValid",
    {   accessor      => "is_valid",
        data_type     => "tinyint",
        default_value => 1,
        extra         => {unsigned => 1},
        is_nullable   => 0,
    },
    "TripStatus",
    {   accessor    => "trip_status",
        data_type   => "enum",
        extra       => {list => ["Pending", "Dispatched", "Complete", "Other", "TONU", "Cancelled"],},
        is_nullable => 0,
    },
    "Notes",
    {accessor => "notes", data_type => "text", is_nullable => 1},
    "GoogleRoute",
    {accessor => "google_route", data_type => "text", is_nullable => 1},
);

=head1 PRIMARY KEY

=over 4

=item * L</TripId>

=back

=cut

__PACKAGE__->set_primary_key("TripId");

=head1 UNIQUE CONSTRAINTS

=head2 C<TripNumber_UNIQUE>

=over 4

=item * L</TripNumber>

=back

=cut

__PACKAGE__->add_unique_constraint("TripNumber_UNIQUE", ["TripNumber"]);

=head1 RELATIONS

=head2 created_by

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
    "created_by",
    "TMS::Schema::Result::HrAssociate",
    {AstId         => "CreatedBy"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 dsp_trips_loads

Type: has_many

Related object: L<TMS::Schema::Result::DspTripsLoad>

=cut

__PACKAGE__->has_many(
    "dsp_trips_loads", "TMS::Schema::Result::DspTripsLoad",
    {"foreign.TripId" => "self.TripId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 msg_dsp_trips

Type: has_many

Related object: L<TMS::Schema::Result::MsgDspTrip>

=cut

__PACKAGE__->has_many(
    "msg_dsp_trips",
    "TMS::Schema::Result::MsgDspTrip",
    {"foreign.TripId" => "self.TripId"},
    {cascade_copy     => 0, cascade_delete => 0},
);

=head2 sft_logbooks

Type: has_many

Related object: L<TMS::Schema::Result::SftLogbook>

=cut

__PACKAGE__->has_many(
    "sft_logbooks",
    "TMS::Schema::Result::SftLogbook",
    {"foreign.Trip" => "self.TripId"},
    {cascade_copy   => 0, cascade_delete => 0},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-06-02 13:19:17
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:J2+b/PwiIk2pvD0Hn8IQAw

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
