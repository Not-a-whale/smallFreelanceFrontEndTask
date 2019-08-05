use utf8;
package TMS::Schema::Result::SftLogEntry;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::SftLogEntry - Entries for the driver logbook

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<sft_log_entries>

=cut

__PACKAGE__->table("sft_log_entries");

=head1 ACCESSORS

=head2 LogbookEntryId

  accessor: 'logbook_entry_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 LogbookId

  accessor: 'logbook_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 Location

  accessor: 'location'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 StartTime

  accessor: 'start_time'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 0

=head2 Activity

  accessor: 'activity'
  data_type: 'enum'
  extra: {list => ["ON DUTY","OFF DUTY","DRIVING","SLEEPING"]}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "LogbookEntryId",
  {
    accessor => "logbook_entry_id",
    data_type => "bigint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "LogbookId",
  {
    accessor       => "logbook_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "Location",
  {
    accessor    => "location",
    data_type   => "bigint",
    extra       => { unsigned => 1 },
    is_nullable => 1,
  },
  "StartTime",
  {
    accessor => "start_time",
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
  },
  "Activity",
  {
    accessor    => "activity",
    data_type   => "enum",
    extra       => { list => ["ON DUTY", "OFF DUTY", "DRIVING", "SLEEPING"] },
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</LogbookEntryId>

=back

=cut

__PACKAGE__->set_primary_key("LogbookEntryId");

=head1 RELATIONS

=head2 logbook

Type: belongs_to

Related object: L<TMS::Schema::Result::SftLogbook>

=cut

__PACKAGE__->belongs_to(
  "logbook",
  "TMS::Schema::Result::SftLogbook",
  { LogbookId => "LogbookId" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-05 10:27:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:IVFRnK936cWY65p002GjtQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;