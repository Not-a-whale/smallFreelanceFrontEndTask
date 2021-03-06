use utf8;

package TMS::Schema::Result::BizCompanyNode;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::BizCompanyNode

=head1 DESCRIPTION

Holds the nodes for the structure of the client/user company hierarchy 

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<biz_company_nodes>

=cut

__PACKAGE__->table("biz_company_nodes");

=head1 ACCESSORS

=head2 NodeId

  accessor: 'node_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 ParentId

  accessor: 'parent_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 UnitName

  accessor: 'unit_name'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 UnitType

  accessor: 'unit_type'
  data_type: 'enum'
  default_value: 'Other'
  extra: {list => ["Department","Office","Team","Group","Other"]}
  is_nullable: 0

=head2 UnitPhone

  accessor: 'unit_phone'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 OpenStartTime

  accessor: 'open_start_time'
  data_type: 'time'
  is_nullable: 1

=head2 OpenEndTime

  accessor: 'open_end_time'
  data_type: 'time'
  is_nullable: 1

=head2 TimeZone

  accessor: 'time_zone'
  data_type: 'integer'
  is_nullable: 1

=head2 UnitEmail

  accessor: 'unit_email'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=cut

__PACKAGE__->add_columns(
    "NodeId",
    {   accessor          => "node_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "ParentId",
    {   accessor       => "parent_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "UnitName",
    {   accessor    => "unit_name",
        data_type   => "varchar",
        is_nullable => 0,
        size        => 255,
    },
    "UnitType",
    {   accessor      => "unit_type",
        data_type     => "enum",
        default_value => "Other",
        extra         => {list => ["Department", "Office", "Team", "Group", "Other"]},
        is_nullable   => 0,
    },
    "UnitPhone",
    {   accessor       => "unit_phone",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "OpenStartTime",
    {accessor => "open_start_time", data_type => "time", is_nullable => 1},
    "OpenEndTime",
    {accessor => "open_end_time", data_type => "time", is_nullable => 1},
    "TimeZone",
    {accessor => "time_zone", data_type => "integer", is_nullable => 1},
    "UnitEmail",
    {   accessor    => "unit_email",
        data_type   => "varchar",
        is_nullable => 1,
        size        => 255,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</NodeId>

=back

=cut

__PACKAGE__->set_primary_key("NodeId");

=head1 UNIQUE CONSTRAINTS

=head2 C<UniqBizUnitName>

=over 4

=item * L</UnitName>

=item * L</UnitType>

=back

=cut

__PACKAGE__->add_unique_constraint("UniqBizUnitName", ["UnitName", "UnitType"]);

=head1 RELATIONS

=head2 biz_company_nodes

Type: has_many

Related object: L<TMS::Schema::Result::BizCompanyNode>

=cut

__PACKAGE__->has_many(
    "biz_company_nodes", "TMS::Schema::Result::BizCompanyNode",
    {"foreign.ParentId" => "self.NodeId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 biz_company_trees_ancestors

Type: has_many

Related object: L<TMS::Schema::Result::BizCompanyTree>

=cut

__PACKAGE__->has_many(
    "biz_company_trees_ancestors", "TMS::Schema::Result::BizCompanyTree",
    {"foreign.AncestorId" => "self.NodeId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 biz_company_trees_descendants

Type: has_many

Related object: L<TMS::Schema::Result::BizCompanyTree>

=cut

__PACKAGE__->has_many(
    "biz_company_trees_descendants", "TMS::Schema::Result::BizCompanyTree",
    {"foreign.DescendantId" => "self.NodeId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 hr_associates

Type: has_many

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->has_many(
    "hr_associates",
    "TMS::Schema::Result::HrAssociate",
    {"foreign.NodeId" => "self.NodeId"},
    {cascade_copy     => 0, cascade_delete => 0},
);

=head2 parent

Type: belongs_to

Related object: L<TMS::Schema::Result::BizCompanyNode>

=cut

__PACKAGE__->belongs_to(
    "parent",
    "TMS::Schema::Result::BizCompanyNode",
    {NodeId => "ParentId"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

=head2 unit_phone

Type: belongs_to

Related object: L<TMS::Schema::Result::CntPhonesfax>

=cut

__PACKAGE__->belongs_to(
    "unit_phone",
    "TMS::Schema::Result::CntPhonesfax",
    {PhnFaxId => "UnitPhone"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-06-02 20:08:30
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:K9lWGS/CXWyq1kVIO+aRFA

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
