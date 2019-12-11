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

=head2 BizURL

  accessor: 'biz_url'
  data_type: 'varchar'
  is_nullable: 1
  size: 1024

=cut

__PACKAGE__->add_columns(
  "BizId",
  {
    accessor => "biz_id",
    data_type => "bigint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "BizName",
  {
    accessor => "biz_name",
    data_type => "varchar",
    is_nullable => 0,
    size => 1024,
  },
  "BizURL",
  {
    accessor => "biz_url",
    data_type => "varchar",
    is_nullable => 1,
    size => 1024,
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
  { "foreign.BizId" => "self.BizId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 crr_iftas

Type: has_many

Related object: L<TMS::Schema::Result::CrrIfta>

=cut

__PACKAGE__->has_many(
  "crr_iftas",
  "TMS::Schema::Result::CrrIfta",
  { "foreign.BizId" => "self.BizId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ent_carrier

Type: might_have

Related object: L<TMS::Schema::Result::EntCarrier>

=cut

__PACKAGE__->might_have(
  "ent_carrier",
  "TMS::Schema::Result::EntCarrier",
  { "foreign.CarrierId" => "self.BizId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ent_customer

Type: might_have

Related object: L<TMS::Schema::Result::EntCustomer>

=cut

__PACKAGE__->might_have(
  "ent_customer",
  "TMS::Schema::Result::EntCustomer",
  { "foreign.CstmrId" => "self.BizId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ent_owner_operator

Type: might_have

Related object: L<TMS::Schema::Result::EntOwnerOperator>

=cut

__PACKAGE__->might_have(
  "ent_owner_operator",
  "TMS::Schema::Result::EntOwnerOperator",
  { "foreign.BizId" => "self.BizId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ent_shipper

Type: might_have

Related object: L<TMS::Schema::Result::EntShipper>

=cut

__PACKAGE__->might_have(
  "ent_shipper",
  "TMS::Schema::Result::EntShipper",
  { "foreign.ShipperId" => "self.BizId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 entity

Type: might_have

Related object: L<TMS::Schema::Result::Entity>

=cut

__PACKAGE__->might_have(
  "entity",
  "TMS::Schema::Result::Entity",
  { "foreign.BusinessId" => "self.BizId" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-10 15:38:48
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:zDBd8Dki0+loYEyE5iqUUA
# These lines were loaded from '/home/cpeter/temp/lib/TMS/Schema/Result/EntBusiness.pm' found in @INC.
# They are now part of the custom portion of this file
# for you to hand-edit.  If you do not either delete
# this section or remove that file from @INC, this section
# will be repeated redundantly when you re-create this
# file again via Loader!  See skip_load_external to disable
# this feature.

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

=head2 BizURL

  accessor: 'biz_url'
  data_type: 'varchar'
  is_nullable: 1
  size: 1024

=cut

__PACKAGE__->add_columns(
  "BizId",
  {
    accessor => "biz_id",
    data_type => "bigint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "BizName",
  {
    accessor => "biz_name",
    data_type => "varchar",
    is_nullable => 0,
    size => 1024,
  },
  "BizURL",
  {
    accessor => "biz_url",
    data_type => "varchar",
    is_nullable => 1,
    size => 1024,
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
  { "foreign.BizId" => "self.BizId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 crr_iftas

Type: has_many

Related object: L<TMS::Schema::Result::CrrIfta>

=cut

__PACKAGE__->has_many(
  "crr_iftas",
  "TMS::Schema::Result::CrrIfta",
  { "foreign.BizId" => "self.BizId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ent_carrier

Type: might_have

Related object: L<TMS::Schema::Result::EntCarrier>

=cut

__PACKAGE__->might_have(
  "ent_carrier",
  "TMS::Schema::Result::EntCarrier",
  { "foreign.CarrierId" => "self.BizId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ent_customer

Type: might_have

Related object: L<TMS::Schema::Result::EntCustomer>

=cut

__PACKAGE__->might_have(
  "ent_customer",
  "TMS::Schema::Result::EntCustomer",
  { "foreign.CstmrId" => "self.BizId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ent_owner_operator

Type: might_have

Related object: L<TMS::Schema::Result::EntOwnerOperator>

=cut

__PACKAGE__->might_have(
  "ent_owner_operator",
  "TMS::Schema::Result::EntOwnerOperator",
  { "foreign.BizId" => "self.BizId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 ent_shipper

Type: might_have

Related object: L<TMS::Schema::Result::EntShipper>

=cut

__PACKAGE__->might_have(
  "ent_shipper",
  "TMS::Schema::Result::EntShipper",
  { "foreign.ShipperId" => "self.BizId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 entity

Type: might_have

Related object: L<TMS::Schema::Result::Entity>

=cut

__PACKAGE__->might_have(
  "entity",
  "TMS::Schema::Result::Entity",
  { "foreign.BusinessId" => "self.BizId" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-10 12:29:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:8X8dVLXmPv1Uz/xfKARH4Q


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;