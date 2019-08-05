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

=head2 equipments

Type: many_to_many

Composing rels: L</inv_equipments_to_support> -> equipment

=cut

__PACKAGE__->many_to_many("equipments", "inv_equipments_to_support", "equipment");


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-05 10:27:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:2rPWkJfBZXDiJO2LSPwkqw


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;