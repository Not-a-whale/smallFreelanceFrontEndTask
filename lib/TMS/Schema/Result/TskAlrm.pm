use utf8;

package TMS::Schema::Result::TskAlrm;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::TskAlrm - Reminders

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<tsk_alrms>

=cut

__PACKAGE__->table("tsk_alrms");

=head1 ACCESSORS

=head2 alrmid

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 tskid

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 message

  data_type: 'varchar'
  is_nullable: 0
  size: 512

message to display

=head2 atcrontab

  data_type: 'varchar'
  is_nullable: 0
  size: 255

the AT or CRONTAB time

=head2 periodic

  data_type: 'enum'
  default_value: 'no'
  extra: {list => ["yes","no"]}
  is_nullable: 0

=head2 repeat

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

Limit itirations to given number. Zero means no limit.

=head2 turnoff

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

Turn off alarm at specific time and date

=cut

__PACKAGE__->add_columns(
    "alrmid",
    {   data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "tskid",
    {   data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "message",
    {data_type => "varchar", is_nullable => 0, size => 512},
    "atcrontab",
    {data_type => "varchar", is_nullable => 0, size => 255},
    "periodic",
    {   data_type     => "enum",
        default_value => "no",
        extra         => {list => ["yes", "no"]},
        is_nullable   => 0,
    },
    "repeat",
    {data_type => "integer", default_value => 0, is_nullable => 0},
    "turnoff",
    {   data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</alrmid>

=back

=cut

__PACKAGE__->set_primary_key("alrmid");

=head1 UNIQUE CONSTRAINTS

=head2 C<unq_tsk_alrms_tskid_message>

=over 4

=item * L</tskid>

=item * L</message>

=back

=cut

__PACKAGE__->add_unique_constraint("unq_tsk_alrms_tskid_message", ["tskid", "message"]);

=head1 RELATIONS

=head2 tsk_ntfis

Type: has_many

Related object: L<TMS::Schema::Result::TskNtfi>

=cut

__PACKAGE__->has_many(
    "tsk_ntfis",
    "TMS::Schema::Result::TskNtfi",
    {"foreign.alrmid" => "self.alrmid"},
    {cascade_copy     => 0, cascade_delete => 0},
);

=head2 tskid

Type: belongs_to

Related object: L<TMS::Schema::Result::TskTask>

=cut

__PACKAGE__->belongs_to(
    "tskid",
    "TMS::Schema::Result::TskTask",
    {tskid         => "tskid"},
    {is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-01-08 10:28:18
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:IwjJC6cjyma0Np8MviTFFA

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
