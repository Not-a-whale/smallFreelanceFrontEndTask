use utf8;

package TMS::Schema::Result::DrvDesttype;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::DrvDesttype

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<drv_desttypes>

=cut

__PACKAGE__->table("drv_desttypes");

=head1 ACCESSORS

=head2 DesiredDestId

  accessor: 'desired_dest_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 DestName

  accessor: 'dest_name'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 Notes

  accessor: 'notes'
  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
    "DesiredDestId",
    {   accessor          => "desired_dest_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "DestName",
    {   accessor    => "dest_name",
        data_type   => "varchar",
        is_nullable => 0,
        size        => 255,
    },
    "Notes",
    {accessor => "notes", data_type => "text", is_nullable => 1},
);

=head1 PRIMARY KEY

=over 4

=item * L</DesiredDestId>

=back

=cut

__PACKAGE__->set_primary_key("DesiredDestId");

=head1 RELATIONS

=head2 drv_schedules

Type: has_many

Related object: L<TMS::Schema::Result::DrvSchedule>

=cut

__PACKAGE__->has_many(
    "drv_schedules",
    "TMS::Schema::Result::DrvSchedule",
    {"foreign.DesiredDestId" => "self.DesiredDestId"},
    {cascade_copy            => 0, cascade_delete => 0},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-05-25 15:45:37
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:jiMlEAzc/alIK6NMPLG33Q

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
