use utf8;

package TMS::Schema::Result::InvUnitsToEquipment;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::InvUnitsToEquipment

=head1 DESCRIPTION

Table that links which equipment belonged to which unit at which time

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<inv_units_to_equipment>

=cut

__PACKAGE__->table("inv_units_to_equipment");

=head1 ACCESSORS

=head2 EquipUnitResId

  accessor: 'equip_unit_res_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 UnitId

  accessor: 'unit_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 EquipmentId

  accessor: 'equipment_id'
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

=head2 DateRemoved

  accessor: 'date_removed'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 RemovedBy

  accessor: 'removed_by'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 Notes

  accessor: 'notes'
  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
    "EquipUnitResId",
    {   accessor          => "equip_unit_res_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "UnitId",
    {   accessor       => "unit_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "EquipmentId",
    {   accessor       => "equipment_id",
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
    "AddedBy",
    {   accessor       => "added_by",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "DateRemoved",
    {   accessor                  => "date_removed",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
    },
    "RemovedBy",
    {   accessor       => "removed_by",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "Notes",
    {accessor => "notes", data_type => "text", is_nullable => 1},
);

=head1 PRIMARY KEY

=over 4

=item * L</EquipUnitResId>

=back

=cut

__PACKAGE__->set_primary_key("EquipUnitResId");

=head1 UNIQUE CONSTRAINTS

=head2 C<ReserveUnique>

=over 4

=item * L</EquipmentId>

=item * L</UnitId>

=item * L</DateAdded>

=back

=cut

__PACKAGE__->add_unique_constraint("ReserveUnique", ["EquipmentId", "UnitId", "DateAdded"]);

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

=head2 equipment

Type: belongs_to

Related object: L<TMS::Schema::Result::InvEquipment>

=cut

__PACKAGE__->belongs_to(
    "equipment",
    "TMS::Schema::Result::InvEquipment",
    {EquipmentId   => "EquipmentId"},
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

=head2 unit

Type: belongs_to

Related object: L<TMS::Schema::Result::InvUnit>

=cut

__PACKAGE__->belongs_to(
    "unit",
    "TMS::Schema::Result::InvUnit",
    {UnitId        => "UnitId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-03-10 16:28:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:RwjZvo+nsDWnHei+XFmEWw

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
