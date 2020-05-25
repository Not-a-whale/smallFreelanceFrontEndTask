use utf8;

package TMS::Schema::Result::BrkStatuslist;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::BrkStatuslist

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<brk_statuslist>

=cut

__PACKAGE__->table("brk_statuslist");

=head1 ACCESSORS

=head2 StatListId

  accessor: 'stat_list_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 StatusName

  accessor: 'status_name'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

Unposted, Posted, Holding, Booked, Dispatching, IRC Sent, Activating Driver, Assigning Driver, Pre-Transit, In-Transit, Trip Finished, FRC Sent, Closed

=cut

__PACKAGE__->add_columns(
    "StatListId",
    {   accessor          => "stat_list_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "StatusName",
    {   accessor    => "status_name",
        data_type   => "varchar",
        is_nullable => 1,
        size        => 255,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</StatListId>

=back

=cut

__PACKAGE__->set_primary_key("StatListId");

=head1 RELATIONS

=head2 brk_loadstatuses

Type: has_many

Related object: L<TMS::Schema::Result::BrkLoadstatus>

=cut

__PACKAGE__->has_many(
    "brk_loadstatuses",
    "TMS::Schema::Result::BrkLoadstatus",
    {"foreign.StatListId" => "self.StatListId"},
    {cascade_copy         => 0, cascade_delete => 0},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-05-25 15:45:37
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:UJZmmNfOMApmfcq3XnVCUg

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
