use utf8;

package TMS::Schema::Result::DspLoadDispatched;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::DspLoadDispatched

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<dsp_loads_dispatched>

=cut

__PACKAGE__->table("dsp_loads_dispatched");

=head1 ACCESSORS

=head2 LoadVsUnitId

  accessor: 'load_vs_unit_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 LoadId

  accessor: 'load_id'
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

=head2 DateDispatched

  accessor: 'date_dispatched'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 0

=head2 DispatchedBy

  accessor: 'dispatched_by'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "LoadVsUnitId",
    {   accessor          => "load_vs_unit_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "LoadId",
    {   accessor       => "load_id",
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
    "DateDispatched",
    {   accessor                  => "date_dispatched",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        default_value             => "CURRENT_TIMESTAMP",
        is_nullable               => 0,
    },
    "DispatchedBy",
    {   accessor       => "dispatched_by",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</LoadVsUnitId>

=back

=cut

__PACKAGE__->set_primary_key("LoadVsUnitId");

=head1 UNIQUE CONSTRAINTS

=head2 C<DspLoadUnitUNQ>

=over 4

=item * L</LoadId>

=item * L</UnitId>

=back

=cut

__PACKAGE__->add_unique_constraint("DspLoadUnitUNQ", ["LoadId", "UnitId"]);

=head1 RELATIONS

=head2 dispatched_by

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
    "dispatched_by",
    "TMS::Schema::Result::HrAssociate",
    {AstId         => "DispatchedBy"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 load

Type: belongs_to

Related object: L<TMS::Schema::Result::DspLoad>

=cut

__PACKAGE__->belongs_to(
    "load",
    "TMS::Schema::Result::DspLoad",
    {LoadId        => "LoadId"},
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

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-01-08 10:28:18
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:SEtmHvJE4xo3dS2lU6HhCg

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
