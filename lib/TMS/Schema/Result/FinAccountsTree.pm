use utf8;

package TMS::Schema::Result::FinAccountsTree;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::FinAccountsTree

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<fin_accounts_trees>

=cut

__PACKAGE__->table("fin_accounts_trees");

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
  extra: {unsigned => 1}
  is_nullable: 1

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
    {   accessor    => "depth",
        data_type   => "integer",
        extra       => {unsigned => 1},
        is_nullable => 1,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</AncestorId>

=item * L</DescendantId>

=back

=cut

__PACKAGE__->set_primary_key("AncestorId", "DescendantId");

=head1 RELATIONS

=head2 ancestor

Type: belongs_to

Related object: L<TMS::Schema::Result::FinAccount>

=cut

__PACKAGE__->belongs_to(
    "ancestor",
    "TMS::Schema::Result::FinAccount",
    {AccountId     => "AncestorId"},
    {is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE"},
);

=head2 descendant

Type: belongs_to

Related object: L<TMS::Schema::Result::FinAccount>

=cut

__PACKAGE__->belongs_to(
    "descendant",
    "TMS::Schema::Result::FinAccount",
    {AccountId     => "DescendantId"},
    {is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-26 15:33:21
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Un41RQR5AOz8qE0NYojj0Q

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
