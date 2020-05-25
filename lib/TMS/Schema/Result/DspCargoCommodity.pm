use utf8;

package TMS::Schema::Result::DspCargoCommodity;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::DspCargoCommodity - keeps track of commodities, used across multiple tables

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<dsp_cargo_commodities>

=cut

__PACKAGE__->table("dsp_cargo_commodities");

=head1 ACCESSORS

=head2 CommodityId

  accessor: 'commodity_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 CommodityName

  accessor: 'commodity_name'
  data_type: 'varchar'
  is_nullable: 0
  size: 64

=cut

__PACKAGE__->add_columns(
    "CommodityId",
    {   accessor          => "commodity_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "CommodityName",
    {   accessor    => "commodity_name",
        data_type   => "varchar",
        is_nullable => 0,
        size        => 64,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</CommodityId>

=back

=cut

__PACKAGE__->set_primary_key("CommodityId");

=head1 UNIQUE CONSTRAINTS

=head2 C<CommodityName_UNIQUE>

=over 4

=item * L</CommodityName>

=back

=cut

__PACKAGE__->add_unique_constraint("CommodityName_UNIQUE", ["CommodityName"]);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-05-25 10:31:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:AHZ0IBFmhOOZPv3E96YwBA

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
