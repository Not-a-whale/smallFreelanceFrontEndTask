use utf8;

package TMS::Schema::Result::InsToEntity;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::InsToEntity

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<ins_to_entities>

=cut

__PACKAGE__->table("ins_to_entities");

=head1 ACCESSORS

=head2 InsEntId

  accessor: 'ins_ent_id'
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

=head2 EntityId

  accessor: 'entity_id'
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
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
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

=head2 Notes

  accessor: 'notes'
  data_type: 'text'
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
    "InsEntId",
    {   accessor          => "ins_ent_id",
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
    "EntityId",
    {   accessor       => "entity_id",
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
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        default_value             => "CURRENT_TIMESTAMP",
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
    "Notes",
    {accessor => "notes", data_type => "text", is_nullable => 1},
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

=item * L</InsEntId>

=back

=cut

__PACKAGE__->set_primary_key("InsEntId");

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

=head2 entity

Type: belongs_to

Related object: L<TMS::Schema::Result::Entity>

=cut

__PACKAGE__->belongs_to(
    "entity", "TMS::Schema::Result::Entity",
    {EntityId      => "EntityId"},
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

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-04-28 11:12:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Bygq8dsyjCZtkzquFbwmkQ

__PACKAGE__->belongs_to(
    "ins",
    "TMS::Schema::Result::InsPolicy",
    {InsId         => "InsId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
