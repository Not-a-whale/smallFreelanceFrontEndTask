use utf8;

package TMS::Schema::Result::InvTiresize;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::InvTiresize

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<inv_tiresizes>

=cut

__PACKAGE__->table("inv_tiresizes");

=head1 ACCESSORS

=head2 TireId

  accessor: 'tire_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 Name

  accessor: 'name'
  data_type: 'varchar'
  is_nullable: 0
  size: 16

=head2 Type

  accessor: 'type'
  data_type: 'set'
  default_value: 'Truck'
  extra: {list => ["Truck","Trailer","Sprinter"]}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "TireId",
    {   accessor          => "tire_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "Name",
    {accessor => "name", data_type => "varchar", is_nullable => 0, size => 16},
    "Type",
    {   accessor      => "type",
        data_type     => "set",
        default_value => "Truck",
        extra         => {list => ["Truck", "Trailer", "Sprinter"]},
        is_nullable   => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</TireId>

=back

=cut

__PACKAGE__->set_primary_key("TireId");

=head1 UNIQUE CONSTRAINTS

=head2 C<Name_UNIQUE>

=over 4

=item * L</Name>

=back

=cut

__PACKAGE__->add_unique_constraint("Name_UNIQUE", ["Name"]);

=head1 RELATIONS

=head2 inv_vehicles

Type: has_many

Related object: L<TMS::Schema::Result::InvVehicle>

=cut

__PACKAGE__->has_many(
    "inv_vehicles",
    "TMS::Schema::Result::InvVehicle",
    {"foreign.TireSize" => "self.TireId"},
    {cascade_copy       => 0, cascade_delete => 0},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-01-08 10:28:18
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:87bGfvrA242oddcSBGbdZw

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
