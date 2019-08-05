use utf8;
package TMS::Schema::Result::InvEquipmentToSupport;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::InvEquipmentToSupport

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<inv_equipment_to_support>

=cut

__PACKAGE__->table("inv_equipment_to_support");

=head1 ACCESSORS

=head2 EquipmentId

  accessor: 'equipment_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 SupportId

  accessor: 'support_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "EquipmentId",
  {
    accessor       => "equipment_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "SupportId",
  {
    accessor       => "support_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</EquipmentId>

=item * L</SupportId>

=back

=cut

__PACKAGE__->set_primary_key("EquipmentId", "SupportId");

=head1 RELATIONS

=head2 equipment

Type: belongs_to

Related object: L<TMS::Schema::Result::InvEquipment>

=cut

__PACKAGE__->belongs_to(
  "equipment",
  "TMS::Schema::Result::InvEquipment",
  { EquipmentId => "EquipmentId" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);

=head2 support

Type: belongs_to

Related object: L<TMS::Schema::Result::InvSupportVendor>

=cut

__PACKAGE__->belongs_to(
  "support",
  "TMS::Schema::Result::InvSupportVendor",
  { SupportId => "SupportId" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-05 10:27:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Dx/MF8LlViVoaOd7073Asg


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;