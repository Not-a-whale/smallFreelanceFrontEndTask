use utf8;

package TMS::Schema::Result::SftLogbook;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::SftLogbook - Driver logbook meta table

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<sft_logbooks>

=cut

__PACKAGE__->table("sft_logbooks");

=head1 ACCESSORS

=head2 LogbookId

  accessor: 'logbook_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 DateStarted

  accessor: 'date_started'
  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 Notes

  accessor: 'notes'
  data_type: 'text'
  is_nullable: 1

=head2 Trip

  accessor: 'trip'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "LogbookId",
    {   accessor          => "logbook_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "DateStarted",
    {   accessor                  => "date_started",
        data_type                 => "date",
        datetime_undef_if_invalid => 1,
        is_nullable               => 0,
    },
    "Notes",
    {accessor => "notes", data_type => "text", is_nullable => 1},
    "Trip",
    {   accessor       => "trip",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</LogbookId>

=back

=cut

__PACKAGE__->set_primary_key("LogbookId");

=head1 RELATIONS

=head2 sft_log_entries

Type: has_many

Related object: L<TMS::Schema::Result::SftLogEntry>

=cut

__PACKAGE__->has_many(
    "sft_log_entries",
    "TMS::Schema::Result::SftLogEntry",
    {"foreign.LogbookId" => "self.LogbookId"},
    {cascade_copy        => 0, cascade_delete => 0},
);

=head2 trip

Type: belongs_to

Related object: L<TMS::Schema::Result::DspTrip>

=cut

__PACKAGE__->belongs_to(
    "trip",
    "TMS::Schema::Result::DspTrip",
    {TripId        => "Trip"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-01-08 09:43:55
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:m+NQtsyPgrnv5Z80W/qmiA

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
