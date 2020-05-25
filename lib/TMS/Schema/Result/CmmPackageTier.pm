use utf8;

package TMS::Schema::Result::CmmPackageTier;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::CmmPackageTier

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<cmm_package_tiers>

=cut

__PACKAGE__->table("cmm_package_tiers");

=head1 ACCESSORS

=head2 TierId

  accessor: 'tier_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 Package

  accessor: 'package'
  data_type: 'varchar'
  is_foreign_key: 1
  is_nullable: 0
  size: 255

=head2 Name

  accessor: 'name'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 Percentage

  accessor: 'percentage'
  data_type: 'decimal'
  extra: {unsigned => 1}
  is_nullable: 0
  size: [5,2]

=head2 Threshold

  accessor: 'threshold'
  data_type: 'decimal'
  is_nullable: 1
  size: [12,2]

The minimum amount required for the tier to be in effect

=cut

__PACKAGE__->add_columns(
    "TierId",
    {   accessor          => "tier_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "Package",
    {   accessor       => "package",
        data_type      => "varchar",
        is_foreign_key => 1,
        is_nullable    => 0,
        size           => 255,
    },
    "Name",
    {accessor => "name", data_type => "varchar", is_nullable => 0, size => 255},
    "Percentage",
    {   accessor    => "percentage",
        data_type   => "decimal",
        extra       => {unsigned => 1},
        is_nullable => 0,
        size        => [5, 2],
    },
    "Threshold",
    {   accessor    => "threshold",
        data_type   => "decimal",
        is_nullable => 1,
        size        => [12, 2],
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</TierId>

=back

=cut

__PACKAGE__->set_primary_key("TierId");

=head1 UNIQUE CONSTRAINTS

=head2 C<PkgVsTierUnq>

=over 4

=item * L</Package>

=item * L</Name>

=back

=cut

__PACKAGE__->add_unique_constraint("PkgVsTierUnq", ["Package", "Name"]);

=head1 RELATIONS

=head2 package

Type: belongs_to

Related object: L<TMS::Schema::Result::CmmPackage>

=cut

__PACKAGE__->belongs_to(
    "package",
    "TMS::Schema::Result::CmmPackage",
    {Name          => "Package"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-05-25 15:45:37
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:sYmCud8Y2rcTTSFvDUKjzQ

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
