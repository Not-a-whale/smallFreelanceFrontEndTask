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

=head2 DateAdded

  accessor: 'date_added'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 0

=head2 AddedBy

  accessor: 'added_by'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "TripId",
  {
    accessor       => "trip_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "LoadId",
  {
    accessor       => "load_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "DateAdded",
  {
    accessor => "date_added",
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
  },
  "AddedBy",
  {
    accessor       => "added_by",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</TripId>

=item * L</LoadId>

=back

=cut

__PACKAGE__->set_primary_key("TripId", "LoadId");

=head1 RELATIONS

=head2 added_by

Type: belongs_to

Related object: L<TMS::Schema::Result::EntPerson>

=cut

__PACKAGE__->belongs_to(
  "added_by",
  "TMS::Schema::Result::EntPerson",
  { PrsnId => "AddedBy" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);

=head2 load

Type: belongs_to

Related object: L<TMS::Schema::Result::DspLoad>

=cut

__PACKAGE__->belongs_to(
  "load",
  "TMS::Schema::Result::DspLoad",
  { LoadId => "LoadId" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);

=head2 trip

Type: belongs_to

Related object: L<TMS::Schema::Result::DspTrip>

=cut

__PACKAGE__->belongs_to(
  "trip",
  "TMS::Schema::Result::DspTrip",
  { TripId => "TripId" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-05 10:27:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:O27V78EHufwNHIoDUNW4+Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;