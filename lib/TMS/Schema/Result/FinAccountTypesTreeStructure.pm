use utf8;

package TMS::Schema::Result::FinAccountTypesTreeStructure;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::FinAccountTypesTreeStructure - VIEW

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';
__PACKAGE__->table_class("DBIx::Class::ResultSource::View");

=head1 TABLE: C<fin_account_types_tree_structures>

=cut

__PACKAGE__->table("fin_account_types_tree_structures");
__PACKAGE__->result_source_instance->view_definition(
    "select `tree`.`DescendantId` AS `AccountId`,group_concat(`tree`.`AncestorId` separator ',') AS `Structure` from (`tms`.`fin_account_types_trees` `tree` join `tms`.`fin_account_types_roots` `root`) where ((`tree`.`DescendantId` = `root`.`DescendantId`) and (`root`.`RootId` in (1,3,5))) group by `tree`.`DescendantId` order by `Structure`"
);

=head1 ACCESSORS

=head2 AccountId

  accessor: 'account_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 Structure

  accessor: 'structure'
  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
    "AccountId",
    {   accessor    => "account_id",
        data_type   => "bigint",
        extra       => {unsigned => 1},
        is_nullable => 0,
    },
    "Structure",
    {accessor => "structure", data_type => "text", is_nullable => 1},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-24 07:43:32
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:AvlcMLCP5zrOzxsZh/GKgQ

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
