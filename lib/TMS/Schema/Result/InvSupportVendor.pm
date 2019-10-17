use utf8;
package TMS::Schema::Result::InvSupportVendor;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::InvSupportVendor

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<inv_support_vendors>

=cut

__PACKAGE__->table("inv_support_vendors");

=head1 ACCESSORS

=head2 SupportId

  accessor: 'support_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_nullable: 0

=head2 VendorId

  accessor: 'vendor_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 PrimaryContact

  accessor: 'primary_contact'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 Name

  accessor: 'name'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 Description

  accessor: 'description'
  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "SupportId",
  {
    accessor    => "support_id",
    data_type   => "bigint",
    extra       => { unsigned => 1 },
    is_nullable => 0,
  },
  "VendorId",
  {
    accessor       => "vendor_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "PrimaryContact",
  {
    accessor       => "primary_contact",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 1,
  },
  "Name",
  { accessor => "name", data_type => "varchar", is_nullable => 0, size => 255 },
  "Description",
  { accessor => "description", data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</SupportId>

=back

=cut

__PACKAGE__->set_primary_key("SupportId");

=head1 RELATIONS

=head2 inv_equipments_to_support

Type: has_many

Related object: L<TMS::Schema::Result::InvEquipmentToSupport>

=cut

__PACKAGE__->has_many(
  "inv_equipments_to_support",
  "TMS::Schema::Result::InvEquipmentToSupport",
  { "foreign.SupportId" => "self.SupportId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 primary_contact

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
  "primary_contact",
  "TMS::Schema::Result::HrAssociate",
  { AstId => "PrimaryContact" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "CASCADE",
  },
);

=head2 vendor

Type: belongs_to

Related object: L<TMS::Schema::Result::BizBranch>

=cut

__PACKAGE__->belongs_to(
  "vendor",
  "TMS::Schema::Result::BizBranch",
  { BrnchId => "VendorId" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-09-17 16:23:49
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ZmQoYO64W5C3ePpTI7bB0w


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;