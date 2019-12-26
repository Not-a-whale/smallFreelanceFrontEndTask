use utf8;

package TMS::Schema::Result::InvUnit;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::InvUnit

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<inv_units>

=cut

__PACKAGE__->table("inv_units");

=head1 ACCESSORS

=head2 UnitId

  accessor: 'unit_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 UnitTag

  accessor: 'unit_tag'
  data_type: 'varchar'
  is_nullable: 0
  size: 45

=cut

__PACKAGE__->add_columns(
    "UnitId",
    {   accessor          => "unit_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "UnitTag",
    {   accessor    => "unit_tag",
        data_type   => "varchar",
        is_nullable => 0,
        size        => 45,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</UnitId>

=back

=cut

__PACKAGE__->set_primary_key("UnitId");

=head1 UNIQUE CONSTRAINTS

=head2 C<UnitTag_UNIQUE>

=over 4

=item * L</UnitTag>

=back

=cut

__PACKAGE__->add_unique_constraint("UnitTag_UNIQUE", ["UnitTag"]);

=head1 RELATIONS

=head2 dsp_loads_dispatched

Type: has_many

Related object: L<TMS::Schema::Result::DspLoadDispatched>

=cut

__PACKAGE__->has_many(
    "dsp_loads_dispatched", "TMS::Schema::Result::DspLoadDispatched",
    {"foreign.UnitId" => "self.UnitId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 inv_unit_reservations

Type: has_many

Related object: L<TMS::Schema::Result::InvUnitReservation>

=cut

__PACKAGE__->has_many(
    "inv_unit_reservations", "TMS::Schema::Result::InvUnitReservation",
    {"foreign.UnitId" => "self.UnitId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 inv_units_to_equipments

Type: has_many

Related object: L<TMS::Schema::Result::InvUnitsToEquipment>

=cut

__PACKAGE__->has_many(
    "inv_units_to_equipments", "TMS::Schema::Result::InvUnitsToEquipment",
    {"foreign.UnitId" => "self.UnitId"}, {cascade_copy => 0, cascade_delete => 0},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-25 21:12:39
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:1zwsthhusnIMCkPaSKvY9w

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
