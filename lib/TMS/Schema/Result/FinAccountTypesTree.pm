use utf8;

package TMS::Schema::Result::FinAccountTypesTree;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::FinAccountTypesTree

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<fin_account_types_trees>

=cut

__PACKAGE__->table("fin_account_types_trees");

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

Related object: L<TMS::Schema::Result::FinAccountType>

=cut

__PACKAGE__->belongs_to(
    "ancestor",
    "TMS::Schema::Result::FinAccountType",
    {AccountTypeId => "AncestorId"},
    {is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE"},
);

=head2 descendant

Type: belongs_to

Related object: L<TMS::Schema::Result::FinAccountType>

=cut

__PACKAGE__->belongs_to(
    "descendant",
    "TMS::Schema::Result::FinAccountType",
    {AccountTypeId => "DescendantId"},
    {is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-01-07 08:47:06
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:cPq/HVCOGGu36clLZb3Mww

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
