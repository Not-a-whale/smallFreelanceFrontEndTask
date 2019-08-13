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
  "LoadId",
  {
    accessor       => "load_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "UnitId",
  {
    accessor       => "unit_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "DateDispatched",
  {
    accessor => "date_dispatched",
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
  },
  "DispatchedBy",
  {
    accessor       => "dispatched_by",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</LoadId>

=item * L</UnitId>

=back

=cut

__PACKAGE__->set_primary_key("LoadId", "UnitId");

=head1 RELATIONS

=head2 dispatched_by

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
  "dispatched_by",
  "TMS::Schema::Result::HrAssociate",
  { AstId => "DispatchedBy" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);

=head2 load

Type: belongs_to

Related object: L<TMS::Schema::Result::DspLoad>

=cut

__PACKAGE__->belongs_to(
  "load",
  "TMS::Schema::Result::DspLoad",
  { LoadId => "LoadId" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);

=head2 unit

Type: belongs_to

Related object: L<TMS::Schema::Result::InvUnit>

=cut

__PACKAGE__->belongs_to(
  "unit",
  "TMS::Schema::Result::InvUnit",
  { UnitId => "UnitId" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-13 13:34:11
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:697Bt391IOgYvlljm73LkQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;