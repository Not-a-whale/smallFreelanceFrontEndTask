use utf8;

package TMS::Schema::Result::FinAccountsRoot;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::FinAccountsRoot - VIEW

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';
__PACKAGE__->table_class("DBIx::Class::ResultSource::View");

=head1 TABLE: C<fin_accounts_roots>

=cut

__PACKAGE__->table("fin_accounts_roots");
__PACKAGE__->result_source_instance->view_definition(
    "select `a`.`AncestorId` AS `RootId`,`b`.`DescendantId` AS `DescendantId` from (`tms`.`fin_accounts_trees` `a` join `tms`.`fin_accounts_trees` `b`) where ((`a`.`DescendantId` = `b`.`AncestorId`) and (`b`.`AncestorId` = `b`.`DescendantId`) and (not(exists(select 1 from `tms`.`fin_accounts_trees` `c` where ((`c`.`Depth` > 0) and (`c`.`DescendantId` = `a`.`AncestorId`))))))"
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

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-01-07 08:47:06
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:BGnNqLu9Q8Ex/BTbiwuAFQ

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
