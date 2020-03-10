use utf8;

package TMS::Schema::Result::InvElogDevice;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::InvElogDevice

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<inv_elog_device>

=cut

__PACKAGE__->table("inv_elog_device");

=head1 ACCESSORS

=head2 ElogDeviceId

  accessor: 'elog_device_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "ElogDeviceId",
    {   accessor       => "elog_device_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</ElogDeviceId>

=back

=cut

__PACKAGE__->set_primary_key("ElogDeviceId");

=head1 RELATIONS

=head2 elog_device

Type: belongs_to

Related object: L<TMS::Schema::Result::InvEquipment>

=cut

__PACKAGE__->belongs_to(
    "elog_device",
    "TMS::Schema::Result::InvEquipment",
    {EquipmentId   => "ElogDeviceId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-03-10 16:28:43
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:qEMZh0OaAMxwE4oH+vsEfw

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
