use utf8;

package TMS::Schema::Result::InvTrailerType;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::InvTrailerType

=head1 DESCRIPTION

Keeps the types of trailers which needs to be used in dsp_loads to find proper trailers

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<inv_trailer_types>

=cut

__PACKAGE__->table("inv_trailer_types");

=head1 ACCESSORS

=head2 Name

  accessor: 'name'
  data_type: 'varchar'
  is_nullable: 0
  size: 24

=cut

__PACKAGE__->add_columns("Name", {accessor => "name", data_type => "varchar", is_nullable => 0, size => 24},);

=head1 PRIMARY KEY

=over 4

=item * L</Name>

=back

=cut

__PACKAGE__->set_primary_key("Name");

=head1 RELATIONS

=head2 dsp_loads

Type: has_many

Related object: L<TMS::Schema::Result::DspLoad>

=cut

__PACKAGE__->has_many(
    "dsp_loads",
    "TMS::Schema::Result::DspLoad",
    {"foreign.TruckType" => "self.Name"},
    {cascade_copy        => 0, cascade_delete => 0},
);

=head2 inv_trailers

Type: has_many

Related object: L<TMS::Schema::Result::InvTrailer>

=cut

__PACKAGE__->has_many(
    "inv_trailers",
    "TMS::Schema::Result::InvTrailer",
    {"foreign.Type" => "self.Name"},
    {cascade_copy   => 0, cascade_delete => 0},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-01-08 09:43:54
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:SJldcTOnJC+TJe2ivKdy/Q

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
