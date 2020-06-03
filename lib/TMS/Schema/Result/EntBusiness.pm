use utf8;

package TMS::Schema::Result::EntBusiness;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::EntBusiness

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<ent_businesses>

=cut

__PACKAGE__->table("ent_businesses");

=head1 ACCESSORS

=head2 BizId

  accessor: 'biz_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 BizName

  accessor: 'biz_name'
  data_type: 'varchar'
  is_nullable: 0
  size: 1024

=head2 DBA

  accessor: 'dba'
  data_type: 'varchar'
  is_nullable: 1
  size: 1024

=head2 BizURL

  accessor: 'biz_url'
  data_type: 'varchar'
  is_nullable: 1
  size: 1024

=head2 Logo

  accessor: 'logo'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
    "BizId",
    {   accessor          => "biz_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "BizName",
    {   accessor    => "biz_name",
        data_type   => "varchar",
        is_nullable => 0,
        size        => 1024,
    },
    "DBA",
    {accessor => "dba", data_type => "varchar", is_nullable => 1, size => 1024},
    "BizURL",
    {   accessor    => "biz_url",
        data_type   => "varchar",
        is_nullable => 1,
        size        => 1024,
    },
    "Logo",
    {   accessor       => "logo",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</BizId>

=back

=cut

__PACKAGE__->set_primary_key("BizId");

=head1 UNIQUE CONSTRAINTS

=head2 C<BizName_UNIQUE>

=over 4

=item * L</BizName>

=back

=cut

__PACKAGE__->add_unique_constraint("BizName_UNIQUE", ["BizName"]);

=head1 RELATIONS

=head2 biz_branches

Type: has_many

Related object: L<TMS::Schema::Result::BizBranch>

=cut

__PACKAGE__->has_many(
    "biz_branches",
    "TMS::Schema::Result::BizBranch",
    {"foreign.BizId" => "self.BizId"},
    {cascade_copy    => 0, cascade_delete => 0},
);

=head2 crr_iftas

Type: has_many

Related object: L<TMS::Schema::Result::CrrIfta>

=cut

__PACKAGE__->has_many(
    "crr_iftas",
    "TMS::Schema::Result::CrrIfta",
    {"foreign.BizId" => "self.BizId"},
    {cascade_copy    => 0, cascade_delete => 0},
);

=head2 dsp_loads_customers

Type: has_many

Related object: L<TMS::Schema::Result::DspLoad>

=cut

__PACKAGE__->has_many(
    "dsp_loads_customers",
    "TMS::Schema::Result::DspLoad",
    {"foreign.CustomerId" => "self.BizId"},
    {cascade_copy         => 0, cascade_delete => 0},
);

=head2 dsp_loads_vendors

Type: has_many

Related object: L<TMS::Schema::Result::DspLoad>

=cut

__PACKAGE__->has_many(
    "dsp_loads_vendors",
    "TMS::Schema::Result::DspLoad",
    {"foreign.VendorId" => "self.BizId"},
    {cascade_copy       => 0, cascade_delete => 0},
);

=head2 ent_carrier

Type: might_have

Related object: L<TMS::Schema::Result::EntCarrier>

=cut

__PACKAGE__->might_have(
    "ent_carrier",
    "TMS::Schema::Result::EntCarrier",
    {"foreign.CarrierId" => "self.BizId"},
    {cascade_copy        => 0, cascade_delete => 0},
);

=head2 ent_customer

Type: might_have

Related object: L<TMS::Schema::Result::EntCustomer>

=cut

__PACKAGE__->might_have(
    "ent_customer",
    "TMS::Schema::Result::EntCustomer",
    {"foreign.CstmrId" => "self.BizId"},
    {cascade_copy      => 0, cascade_delete => 0},
);

=head2 ent_owner_operator

Type: might_have

Related object: L<TMS::Schema::Result::EntOwnerOperator>

=cut

__PACKAGE__->might_have(
    "ent_owner_operator", "TMS::Schema::Result::EntOwnerOperator",
    {"foreign.BizId" => "self.BizId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 ent_shipper

Type: might_have

Related object: L<TMS::Schema::Result::EntShipper>

=cut

__PACKAGE__->might_have(
    "ent_shipper",
    "TMS::Schema::Result::EntShipper",
    {"foreign.ShipperId" => "self.BizId"},
    {cascade_copy        => 0, cascade_delete => 0},
);

=head2 entity

Type: might_have

Related object: L<TMS::Schema::Result::Entity>

=cut

__PACKAGE__->might_have(
    "entity", "TMS::Schema::Result::Entity",
    {"foreign.BusinessId" => "self.BizId"},
    {cascade_copy         => 0, cascade_delete => 0},
);

=head2 ins_policies

Type: has_many

Related object: L<TMS::Schema::Result::InsPolicy>

=cut

__PACKAGE__->has_many(
    "ins_policies",
    "TMS::Schema::Result::InsPolicy",
    {"foreign.InsProvider" => "self.BizId"},
    {cascade_copy          => 0, cascade_delete => 0},
);

=head2 logo

Type: belongs_to

Related object: L<TMS::Schema::Result::GenFile>

=cut

__PACKAGE__->belongs_to(
    "logo",
    "TMS::Schema::Result::GenFile",
    {FileId => "Logo"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-06-02 20:08:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:VucMMrk8gd+My6KXAT6pZA

__PACKAGE__->belongs_to(
    "has_carrier",
    "TMS::Schema::Result::EntCarrier",
    {"foreign.CarrierId" => "self.BizId"},
    {cascade_copy        => 0, cascade_delete => 0},
);

foreach (qw( insr cust vend oper )) {
    __PACKAGE__->has_many(
        $_ . "_branches",
        "TMS::Schema::Result::BizBranch",
        {"foreign.BizId" => "self.BizId"},
        {cascade_copy    => 0, cascade_delete => 0},
    );
}

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
