use utf8;
package TMS::Schema::Result::TmpRelationsNode;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::TmpRelationsNode

=head1 DESCRIPTION

This is a temporary Table that helps remind how to setup closure tables

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<tmp_relations_nodes>

=cut

__PACKAGE__->table("tmp_relations_nodes");

=head1 ACCESSORS

=head2 RelNodeId

  accessor: 'rel_node_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 Name

  accessor: 'name'
  data_type: 'varchar'
  is_nullable: 1
  size: 45

=head2 ParentId

  accessor: 'parent_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "RelNodeId",
  {
    accessor => "rel_node_id",
    data_type => "bigint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "Name",
  { accessor => "name", data_type => "varchar", is_nullable => 1, size => 45 },
  "ParentId",
  {
    accessor       => "parent_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 1,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</RelNodeId>

=back

=cut

__PACKAGE__->set_primary_key("RelNodeId");

=head1 RELATIONS

=head2 parent

Type: belongs_to

Related object: L<TMS::Schema::Result::TmpRelationsNode>

=cut

__PACKAGE__->belongs_to(
  "parent",
  "TMS::Schema::Result::TmpRelationsNode",
  { RelNodeId => "ParentId" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "NO ACTION",
    on_update     => "NO ACTION",
  },
);

=head2 tmp_relations_clsr_ancestors

Type: has_many

Related object: L<TMS::Schema::Result::TmpRelationsClsr>

=cut

__PACKAGE__->has_many(
  "tmp_relations_clsr_ancestors",
  "TMS::Schema::Result::TmpRelationsClsr",
  { "foreign.AncestorId" => "self.RelNodeId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 tmp_relations_clsr_descendants

Type: has_many

Related object: L<TMS::Schema::Result::TmpRelationsClsr>

=cut

__PACKAGE__->has_many(
  "tmp_relations_clsr_descendants",
  "TMS::Schema::Result::TmpRelationsClsr",
  { "foreign.DescendantId" => "self.RelNodeId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 tmp_relations_nodes

Type: has_many

Related object: L<TMS::Schema::Result::TmpRelationsNode>

=cut

__PACKAGE__->has_many(
  "tmp_relations_nodes",
  "TMS::Schema::Result::TmpRelationsNode",
  { "foreign.ParentId" => "self.RelNodeId" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-05 10:27:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:z3isCtmeP0nsL268VxA/Vg


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;