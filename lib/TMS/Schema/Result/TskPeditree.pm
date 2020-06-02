use utf8;

package TMS::Schema::Result::TskPeditree;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::TskPeditree - VIEW

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';
__PACKAGE__->table_class("DBIx::Class::ResultSource::View");

=head1 TABLE: C<tsk_peditree>

=cut

__PACKAGE__->table("tsk_peditree");
__PACKAGE__->result_source_instance->view_definition(
    "select `t2`.`name` AS `Parent`,`t3`.`name` AS `Child` from ((`tms`.`tsk_trees` `t1` join `tms`.`tsk_tasks` `t2` on((`t1`.`ancestor` = `t2`.`tskid`))) join `tms`.`tsk_tasks` `t3` on((`t1`.`descendant` = `t3`.`tskid`))) where (`t1`.`length` = 1) order by `t1`.`ancestor`,`t1`.`descendant`"
);

=head1 ACCESSORS

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

=cut

__PACKAGE__->add_columns(
    "Parent", {accessor => "parent", data_type => "varchar", is_nullable => 0, size => 255},
    "Child",  {accessor => "child",  data_type => "varchar", is_nullable => 0, size => 255},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-06-02 13:19:17
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:IjfrT4LXj0sZrpBCvND03A

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
