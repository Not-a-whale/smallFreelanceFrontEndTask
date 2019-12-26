use utf8;

package TMS::Schema::Result::InvUnitReservation;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::InvUnitReservation

=head1 DESCRIPTION

Reservations for specific units, same unit can be reserved by multiple people in different roles

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<inv_unit_reservations>

=cut

__PACKAGE__->table("inv_unit_reservations");

=head1 ACCESSORS

=head2 ReservationId

  accessor: 'reservation_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 PrsnId

  accessor: 'prsn_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 UnitId

  accessor: 'unit_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 InvRoleId

  accessor: 'inv_role_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

this should be a table called 'Roles' or 'People_Roles' that should be a foreign key which is also tied to ent_people, and ent_people should be able to have mutliple Roles and have the dataentry user select the role from a dropdown that is specific to the person they are trying to reserve under.

=head2 DateReserved

  accessor: 'date_reserved'
  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 DateReleased

  accessor: 'date_released'
  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=head2 CreatedBy

  accessor: 'created_by'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 CreatedOn

  accessor: 'created_on'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
    "ReservationId",
    {   accessor          => "reservation_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "PrsnId",
    {   accessor       => "prsn_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "UnitId",
    {   accessor       => "unit_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "InvRoleId",
    {   accessor       => "inv_role_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "DateReserved",
    {   accessor                  => "date_reserved",
        data_type                 => "date",
        datetime_undef_if_invalid => 1,
        is_nullable               => 0,
    },
    "DateReleased",
    {   accessor                  => "date_released",
        data_type                 => "date",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
    },
    "CreatedBy",
    {   accessor       => "created_by",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "CreatedOn",
    {   accessor                  => "created_on",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        default_value             => "CURRENT_TIMESTAMP",
        is_nullable               => 1,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</ReservationId>

=back

=cut

__PACKAGE__->set_primary_key("ReservationId");

=head1 RELATIONS

=head2 created_by

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
    "created_by",
    "TMS::Schema::Result::HrAssociate",
    {AstId => "CreatedBy"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

=head2 inv_role

Type: belongs_to

Related object: L<TMS::Schema::Result::InvRole>

=cut

__PACKAGE__->belongs_to(
    "inv_role",
    "TMS::Schema::Result::InvRole",
    {InvRoleId     => "InvRoleId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 prsn

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
    "prsn",
    "TMS::Schema::Result::HrAssociate",
    {AstId         => "PrsnId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
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

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-25 21:12:39
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:oo1O7gScVJ+LtkZEHOo1iA

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
