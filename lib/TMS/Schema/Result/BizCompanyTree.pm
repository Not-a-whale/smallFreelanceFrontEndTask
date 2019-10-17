use utf8;
package TMS::Schema::Result::BizCompanyTree;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::BizCompanyTree

=head1 DESCRIPTION

Holds the tree for the structure of the heirarchy of the client/user company

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<biz_company_trees>

=cut

__PACKAGE__->table("biz_company_trees");

=head1 ACCESSORS

=head2 Ans_Des_Id

  accessor: 'ans_des_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

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
  extra: {unsigned => 1}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "Ans_Des_Id",
  {
    accessor => "ans_des_id",
    data_type => "bigint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "AncestorId",
  {
    accessor       => "ancestor_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "DescendantId",
  {
    accessor       => "descendant_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "Depth",
  {
    accessor    => "depth",
    data_type   => "integer",
    extra       => { unsigned => 1 },
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</Ans_Des_Id>

=back

=cut

__PACKAGE__->set_primary_key("Ans_Des_Id");

=head1 UNIQUE CONSTRAINTS

=head2 C<idx_biz_company_trees_unq>

=over 4

=item * L</AncestorId>

=item * L</DescendantId>

=back

=cut

__PACKAGE__->add_unique_constraint("idx_biz_company_trees_unq", ["AncestorId", "DescendantId"]);

=head1 RELATIONS

=head2 ancestor

Type: belongs_to

Related object: L<TMS::Schema::Result::BizCompanyNode>

=cut

__PACKAGE__->belongs_to(
  "ancestor",
  "TMS::Schema::Result::BizCompanyNode",
  { NodeId => "AncestorId" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 descendant

Type: belongs_to

Related object: L<TMS::Schema::Result::BizCompanyNode>

=cut

__PACKAGE__->belongs_to(
  "descendant",
  "TMS::Schema::Result::BizCompanyNode",
  { NodeId => "DescendantId" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-09-17 16:23:49
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:9r0SdnwYdQohVM9k8PpsNA


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;