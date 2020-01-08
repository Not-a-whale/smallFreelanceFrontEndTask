use utf8;

package TMS::Schema::Result::TmpRelationsClsr;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::TmpRelationsClsr

=head1 DESCRIPTION

This is a temporary table that helps remind how to setup closure tables.

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<tmp_relations_clsr>

=cut

__PACKAGE__->table("tmp_relations_clsr");

=head1 ACCESSORS

=head2 AncestorId

  accessor: 'ancestor_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 DescendantId

  accessor: 'descendant_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 Depth

  accessor: 'depth'
  data_type: 'integer'
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "AncestorId",
    {   accessor       => "ancestor_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "DescendantId",
    {   accessor       => "descendant_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "Depth",
    {accessor => "depth", data_type => "integer", is_nullable => 0},
);

=head1 RELATIONS

=head2 ancestor

Type: belongs_to

Related object: L<TMS::Schema::Result::TmpRelationsNode>

=cut

__PACKAGE__->belongs_to(
    "ancestor",
    "TMS::Schema::Result::TmpRelationsNode",
    {RelNodeId     => "AncestorId"},
    {is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION"},
);

=head2 descendant

Type: belongs_to

Related object: L<TMS::Schema::Result::TmpRelationsNode>

=cut

__PACKAGE__->belongs_to(
    "descendant",
    "TMS::Schema::Result::TmpRelationsNode",
    {RelNodeId     => "DescendantId"},
    {is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-01-07 08:47:06
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:62w9gqrBAkFhdZh3uReudA

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
