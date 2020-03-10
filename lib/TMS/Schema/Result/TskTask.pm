use utf8;

package TMS::Schema::Result::TskTask;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::TskTask - Task/Project Tree

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<tsk_tasks>

=cut

__PACKAGE__->table("tsk_tasks");

=head1 ACCESSORS

=head2 tskid

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

Task ID

=head2 prjid

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

Parent Task or Project ID

=head2 PrsnId

  accessor: 'prsn_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

Who created the tsk_tasks

=head2 name

  data_type: 'varchar'
  is_nullable: 0
  size: 255

Short name of the task/project

=head2 created

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 1

When created

=head2 startdate

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 duedate

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 completed

  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

When completed

=head2 estimated

  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

Estimated time to complete hrs:min

=head2 priority

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 1

Task priority: higher then number more urgent it is

=head2 severity

  data_type: 'integer'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 1

Severity: higher the number more important it is

=cut

__PACKAGE__->add_columns(
    "tskid",
    {   data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "prjid",
    {   data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "PrsnId",
    {   accessor       => "prsn_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "name",
    {data_type => "varchar", is_nullable => 0, size => 255},
    "created",
    {   data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        default_value             => "CURRENT_TIMESTAMP",
        is_nullable               => 1,
    },
    "startdate",
    {   data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
    },
    "duedate",
    {   data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
    },
    "completed",
    {   data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
    },
    "estimated",
    {data_type => "integer", extra => {unsigned => 1}, is_nullable => 1},
    "priority",
    {   data_type     => "integer",
        default_value => 0,
        extra         => {unsigned => 1},
        is_nullable   => 1,
    },
    "severity",
    {   data_type     => "integer",
        default_value => 0,
        extra         => {unsigned => 1},
        is_nullable   => 1,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</tskid>

=back

=cut

__PACKAGE__->set_primary_key("tskid");

=head1 UNIQUE CONSTRAINTS

=head2 C<name_UNIQUE>

=over 4

=item * L</name>

=back

=cut

__PACKAGE__->add_unique_constraint("name_UNIQUE", ["name"]);

=head1 RELATIONS

=head2 prjid

Type: belongs_to

Related object: L<TMS::Schema::Result::TskTask>

=cut

__PACKAGE__->belongs_to(
    "prjid",
    "TMS::Schema::Result::TskTask",
    {tskid => "prjid"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "CASCADE",
        on_update     => "CASCADE",
    },
);

=head2 prsn

Type: belongs_to

Related object: L<TMS::Schema::Result::EntPerson>

=cut

__PACKAGE__->belongs_to(
    "prsn",
    "TMS::Schema::Result::EntPerson",
    {PrsnId        => "PrsnId"},
    {is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE"},
);

=head2 tsk_actns

Type: has_many

Related object: L<TMS::Schema::Result::TskActn>

=cut

__PACKAGE__->has_many(
    "tsk_actns",
    "TMS::Schema::Result::TskActn",
    {"foreign.tskid" => "self.tskid"},
    {cascade_copy    => 0, cascade_delete => 0},
);

=head2 tsk_alrms

Type: has_many

Related object: L<TMS::Schema::Result::TskAlrm>

=cut

__PACKAGE__->has_many(
    "tsk_alrms",
    "TMS::Schema::Result::TskAlrm",
    {"foreign.tskid" => "self.tskid"},
    {cascade_copy    => 0, cascade_delete => 0},
);

=head2 tsk_resps

Type: has_many

Related object: L<TMS::Schema::Result::TskResp>

=cut

__PACKAGE__->has_many(
    "tsk_resps",
    "TMS::Schema::Result::TskResp",
    {"foreign.tskid" => "self.tskid"},
    {cascade_copy    => 0, cascade_delete => 0},
);

=head2 tsk_tasks

Type: has_many

Related object: L<TMS::Schema::Result::TskTask>

=cut

__PACKAGE__->has_many(
    "tsk_tasks",
    "TMS::Schema::Result::TskTask",
    {"foreign.prjid" => "self.tskid"},
    {cascade_copy    => 0, cascade_delete => 0},
);

=head2 tsk_trees_ancestors

Type: has_many

Related object: L<TMS::Schema::Result::TskTree>

=cut

__PACKAGE__->has_many(
    "tsk_trees_ancestors",
    "TMS::Schema::Result::TskTree",
    {"foreign.ancestor" => "self.tskid"},
    {cascade_copy       => 0, cascade_delete => 0},
);

=head2 tsk_trees_descendants

Type: has_many

Related object: L<TMS::Schema::Result::TskTree>

=cut

__PACKAGE__->has_many(
    "tsk_trees_descendants",
    "TMS::Schema::Result::TskTree",
    {"foreign.descendant" => "self.tskid"},
    {cascade_copy         => 0, cascade_delete => 0},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-03-10 16:28:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:rZpKXWqKJrfXd+njhg7w6A

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
