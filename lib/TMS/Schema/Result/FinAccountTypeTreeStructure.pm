use utf8;

package TMS::Schema::Result::FinAccountTypeTreeStructure;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::FinAccountTypeTreeStructure - VIEW

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';
__PACKAGE__->table_class("DBIx::Class::ResultSource::View");

=head1 TABLE: C<fin_account_type_tree_structures>

=cut

__PACKAGE__->table("fin_account_type_tree_structures");
__PACKAGE__->result_source_instance->view_definition(
    "select `root`.`RootId` AS `RootTypeId`,`tree`.`DescendantId` AS `AccountTypeId`,group_concat(`tree`.`AncestorId` separator ',') AS `Structure` from (`tms`.`fin_account_types_trees` `tree` join `tms`.`fin_account_types_roots` `root`) where ((`tree`.`DescendantId` = `root`.`DescendantId`) and (`root`.`RootId` in (1,3,5))) group by `root`.`RootId`,`tree`.`DescendantId` order by `Structure`"
);

=head1 ACCESSORS

=head2 RootTypeId

  accessor: 'root_type_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 AccountTypeId

  accessor: 'account_type_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 Structure

  accessor: 'structure'
  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
    "RootTypeId",
    {   accessor    => "root_type_id",
        data_type   => "bigint",
        extra       => {unsigned => 1},
        is_nullable => 0,
    },
    "AccountTypeId",
    {   accessor    => "account_type_id",
        data_type   => "bigint",
        extra       => {unsigned => 1},
        is_nullable => 0,
    },
    "Structure",
    {accessor => "structure", data_type => "text", is_nullable => 1},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-04-28 11:12:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:rzfj4TQTrUp7Va8OHDSoeA

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
