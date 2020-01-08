use utf8;

package TMS::Schema::Result::InsToVehicle;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::InsToVehicle

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<ins_to_vehicles>

=cut

__PACKAGE__->table("ins_to_vehicles");

=head1 ACCESSORS

=head2 VhlInsId

  accessor: 'vhl_ins_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 InsId

  accessor: 'ins_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 VehicleId

  accessor: 'vehicle_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 AddedBy

  accessor: 'added_by'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 DateAdded

  accessor: 'date_added'
  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 RemovedBy

  accessor: 'removed_by'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 DateRemoved

  accessor: 'date_removed'
  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 ActionReminder

  accessor: 'action_reminder'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 ActionNote

  accessor: 'action_note'
  data_type: 'text'
  is_nullable: 1

=head2 ActionEmail

  accessor: 'action_email'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=cut

__PACKAGE__->add_columns(
    "VhlInsId",
    {   accessor          => "vhl_ins_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "InsId",
    {   accessor       => "ins_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "VehicleId",
    {   accessor       => "vehicle_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "AddedBy",
    {   accessor       => "added_by",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "DateAdded",
    {   accessor                  => "date_added",
        data_type                 => "date",
        datetime_undef_if_invalid => 1,
        is_nullable               => 0,
    },
    "RemovedBy",
    {   accessor       => "removed_by",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "DateRemoved",
    {   accessor                  => "date_removed",
        data_type                 => "date",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
    },
    "ActionReminder",
    {   accessor                  => "action_reminder",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
    },
    "ActionNote",
    {accessor => "action_note", data_type => "text", is_nullable => 1},
    "ActionEmail",
    {   accessor    => "action_email",
        data_type   => "varchar",
        is_nullable => 1,
        size        => 255,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</VhlInsId>

=back

=cut

__PACKAGE__->set_primary_key("VhlInsId");

=head1 UNIQUE CONSTRAINTS

=head2 C<InsVsDateUnq>

=over 4

=item * L</VhlInsId>

=item * L</DateAdded>

=back

=cut

__PACKAGE__->add_unique_constraint("InsVsDateUnq", ["VhlInsId", "DateAdded"]);

=head1 RELATIONS

=head2 added_by

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
    "added_by",
    "TMS::Schema::Result::HrAssociate",
    {AstId         => "AddedBy"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 in

Type: belongs_to

Related object: L<TMS::Schema::Result::InsPolicy>

=cut

__PACKAGE__->belongs_to(
    "in",
    "TMS::Schema::Result::InsPolicy",
    {InsId         => "InsId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 removed_by

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
    "removed_by",
    "TMS::Schema::Result::HrAssociate",
    {AstId => "RemovedBy"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

=head2 vehicle

Type: belongs_to

Related object: L<TMS::Schema::Result::InvVehicle>

=cut

__PACKAGE__->belongs_to(
    "vehicle",
    "TMS::Schema::Result::InvVehicle",
    {VehicleId     => "VehicleId"},
    {is_deferrable => 1, on_delete => "CASCADE", on_update => "RESTRICT"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-01-08 10:28:18
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:8jIJSQ1gV+ljMdSttBV6LA

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
