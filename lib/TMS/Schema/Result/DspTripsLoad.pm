use utf8;

package TMS::Schema::Result::DspTripsLoad;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::DspTripsLoad

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<dsp_trips_loads>

=cut

__PACKAGE__->table("dsp_trips_loads");

=head1 ACCESSORS

=head2 TripLoadId

  accessor: 'trip_load_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 TripId

  accessor: 'trip_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 LoadId

  accessor: 'load_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 DateDispatched

  accessor: 'date_dispatched'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 0

=head2 LoadDispatcher

  accessor: 'load_dispatcher'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "TripLoadId",
    {   accessor          => "trip_load_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "TripId",
    {   accessor       => "trip_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "LoadId",
    {   accessor       => "load_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "DateDispatched",
    {   accessor                  => "date_dispatched",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        default_value             => "CURRENT_TIMESTAMP",
        is_nullable               => 0,
    },
    "LoadDispatcher",
    {   accessor       => "load_dispatcher",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</TripLoadId>

=back

=cut

__PACKAGE__->set_primary_key("TripLoadId");

=head1 UNIQUE CONSTRAINTS

=head2 C<TripLoadUnq>

=over 4

=item * L</TripId>

=item * L</LoadId>

=back

=cut

__PACKAGE__->add_unique_constraint("TripLoadUnq", ["TripId", "LoadId"]);

=head1 RELATIONS

=head2 load

Type: belongs_to

Related object: L<TMS::Schema::Result::DspLoad>

=cut

__PACKAGE__->belongs_to(
    "load",
    "TMS::Schema::Result::DspLoad",
    {LoadId        => "LoadId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 load_dispatcher

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
    "load_dispatcher",
    "TMS::Schema::Result::HrAssociate",
    {AstId         => "LoadDispatcher"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 trip

Type: belongs_to

Related object: L<TMS::Schema::Result::DspTrip>

=cut

__PACKAGE__->belongs_to(
    "trip",
    "TMS::Schema::Result::DspTrip",
    {TripId        => "TripId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-04-28 11:12:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:H2gUFOmPHub1FpHViWsNDw

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
