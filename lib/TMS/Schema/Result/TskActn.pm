use utf8;

package TMS::Schema::Result::TskActn;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::TskActn - Actions - actual execution of the task

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<tsk_actns>

=cut

__PACKAGE__->table("tsk_actns");

=head1 ACCESSORS

=head2 actid

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 tskid

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 PrsnId

  accessor: 'prsn_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 note

  data_type: 'varchar'
  is_nullable: 1
  size: 1024

Notes or comments if required

=cut

__PACKAGE__->add_columns(
    "actid",
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
    "PrsnId",
    {   accessor       => "prsn_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "note",
    {data_type => "varchar", is_nullable => 1, size => 1024},
);

=head1 PRIMARY KEY

=over 4

=item * L</actid>

=back

=cut

__PACKAGE__->set_primary_key("actid");

=head1 RELATIONS

=head2 prsn

Type: belongs_to

Related object: L<TMS::Schema::Result::EntPerson>

=cut

__PACKAGE__->belongs_to(
    "prsn",
    "TMS::Schema::Result::EntPerson",
    {PrsnId        => "PrsnId"},
    {is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION"},
);

=head2 tsk_times

Type: has_many

Related object: L<TMS::Schema::Result::TskTime>

=cut

__PACKAGE__->has_many(
    "tsk_times",
    "TMS::Schema::Result::TskTime",
    {"foreign.actid" => "self.actid"},
    {cascade_copy    => 0, cascade_delete => 0},
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

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-25 21:12:39
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:bLb91BZlgAKZELGbf8Cq/A

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
