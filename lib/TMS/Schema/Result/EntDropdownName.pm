use utf8;

package TMS::Schema::Result::EntDropdownName;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::EntDropdownName - VIEW

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';
__PACKAGE__->table_class("DBIx::Class::ResultSource::View");

=head1 TABLE: C<ent_dropdown_names>

=cut

__PACKAGE__->table("ent_dropdown_names");
__PACKAGE__->result_source_instance->view_definition(
    "select `entity`.`EntityId` AS `Id`,if(isnull(`person`.`PrsnId`),if(isnull(`business`.`BizId`),'unknown','business'),'person') AS `WhatAmI`,if(isnull(`business`.`BizId`),concat_ws(' ',`person`.`Prefix`,`person`.`FirstName`,`person`.`MiddleName`,`person`.`LastName`,`person`.`Suffix`),concat_ws(' ',`business`.`BizName`,`branch`.`OfficeName`)) AS `Name` from (((`tms`.`entities` `entity` left join `tms`.`ent_people` `person` on((`person`.`PrsnId` = `entity`.`EntityId`))) left join `tms`.`ent_businesses` `business` on((`business`.`BizId` = `entity`.`EntityId`))) left join `tms`.`biz_branches` `branch` on((`business`.`BizId` = `branch`.`BizId`))) order by concat_ws(' ',`business`.`BizName`,`branch`.`OfficeName`),concat_ws(' ',`person`.`Prefix`,`person`.`FirstName`,`person`.`MiddleName`,`person`.`LastName`,`person`.`Suffix`)"
);

=head1 ACCESSORS

=head2 Id

  accessor: 'id'
  data_type: 'bigint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=head2 WhatAmI

  accessor: 'what_am_i'
  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 8

=head2 Name

  accessor: 'name'
  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
    "Id",
    {   accessor      => "id",
        data_type     => "bigint",
        default_value => 0,
        extra         => {unsigned => 1},
        is_nullable   => 0,
    },
    "WhatAmI",
    {   accessor      => "what_am_i",
        data_type     => "varchar",
        default_value => "",
        is_nullable   => 0,
        size          => 8,
    },
    "Name",
    {accessor => "name", data_type => "text", is_nullable => 1},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-01-08 09:43:54
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ryo/G/PohO1a7ovTFwmFMQ

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
