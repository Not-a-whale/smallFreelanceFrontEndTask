use utf8;

package TMS::Schema::Result::TskPedigree;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::TskPedigree - VIEW

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';
__PACKAGE__->table_class("DBIx::Class::ResultSource::View");

=head1 TABLE: C<tsk_pedigree>

=cut

__PACKAGE__->table("tsk_pedigree");
__PACKAGE__->result_source_instance->view_definition(
    "select `t1`.`ancestor` AS `ancestor`,`t1`.`descendant` AS `descendant`,`t2`.`name` AS `Parent`,`t3`.`name` AS `Child`,`t1`.`length` AS `length` from ((`tms`.`tsk_trees` `t1` join `tms`.`tsk_tasks` `t2` on((`t1`.`ancestor` = `t2`.`tskid`))) join `tms`.`tsk_tasks` `t3` on((`t1`.`descendant` = `t3`.`tskid`))) order by `t1`.`ancestor`,`t1`.`descendant`"
);

=head1 ACCESSORS

=head2 ancestor

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 descendant

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 Parent

  accessor: 'parent'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

Short name of the task/project

=head2 Child

  accessor: 'child'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

Short name of the task/project

=head2 length

  data_type: 'integer'
  default_value: 0
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "ancestor",   {data_type => "bigint", extra => {unsigned => 1}, is_nullable => 0},
    "descendant", {data_type => "bigint", extra => {unsigned => 1}, is_nullable => 0},
    "Parent", {accessor => "parent", data_type => "varchar", is_nullable => 0, size => 255},
    "Child",  {accessor => "child",  data_type => "varchar", is_nullable => 0, size => 255},
    "length", {data_type => "integer", default_value => 0, is_nullable => 0},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-06-02 20:08:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ekqmAqt7DadiPo3yqMu//g

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
