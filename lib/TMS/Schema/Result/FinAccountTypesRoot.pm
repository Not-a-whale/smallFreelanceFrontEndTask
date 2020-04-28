use utf8;

package TMS::Schema::Result::FinAccountTypesRoot;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::FinAccountTypesRoot - VIEW

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';
__PACKAGE__->table_class("DBIx::Class::ResultSource::View");

=head1 TABLE: C<fin_account_types_roots>

=cut

__PACKAGE__->table("fin_account_types_roots");
__PACKAGE__->result_source_instance->view_definition(
    "select `a`.`AncestorId` AS `RootId`,`b`.`DescendantId` AS `DescendantId` from (`tms`.`fin_account_types_trees` `a` join `tms`.`fin_account_types_trees` `b`) where ((`a`.`DescendantId` = `b`.`AncestorId`) and (`b`.`AncestorId` = `b`.`DescendantId`) and (not(exists(select 1 from `tms`.`fin_account_types_trees` `c` where ((`c`.`Depth` > 0) and (`c`.`DescendantId` = `a`.`AncestorId`))))))"
);

=head1 ACCESSORS

=head2 RootId

  accessor: 'root_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 DescendantId

  accessor: 'descendant_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "RootId",
    {   accessor    => "root_id",
        data_type   => "bigint",
        extra       => {unsigned => 1},
        is_nullable => 0,
    },
    "DescendantId",
    {   accessor    => "descendant_id",
        data_type   => "bigint",
        extra       => {unsigned => 1},
        is_nullable => 0,
    },
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-04-28 11:12:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:em/qwECUp4THBaB7XP39tA

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
