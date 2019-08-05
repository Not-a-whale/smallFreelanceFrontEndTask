use utf8;
package TMS::Schema::Result::GenGpsCoord;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::GenGpsCoord

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<gen_gps_coords>

=cut

__PACKAGE__->table("gen_gps_coords");

=head1 ACCESSORS

=head2 GpsId

  accessor: 'gps_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 Latitude

  accessor: 'latitude'
  data_type: 'decimal'
  is_nullable: 0
  size: [8,6]

=head2 Longitude

  accessor: 'longitude'
  data_type: 'decimal'
  is_nullable: 0
  size: [9,6]

=cut

__PACKAGE__->add_columns(
  "GpsId",
  {
    accessor    => "gps_id",
    data_type   => "bigint",
    extra       => { unsigned => 1 },
    is_nullable => 0,
  },
  "Latitude",
  {
    accessor => "latitude",
    data_type => "decimal",
    is_nullable => 0,
    size => [8, 6],
  },
  "Longitude",
  {
    accessor => "longitude",
    data_type => "decimal",
    is_nullable => 0,
    size => [9, 6],
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</GpsId>

=back

=cut

__PACKAGE__->set_primary_key("GpsId");

=head1 UNIQUE CONSTRAINTS

=head2 C<LatLongUniq>

=over 4

=item * L</Latitude>

=item * L</Longitude>

=back

=cut

__PACKAGE__->add_unique_constraint("LatLongUniq", ["Latitude", "Longitude"]);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-05 15:51:53
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:XnKUs7/19JfyB6YQusD1kw


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;