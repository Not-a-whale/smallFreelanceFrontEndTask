use utf8;

package TMS::Schema::Result::MsgSftVehicleInspectProof;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::MsgSftVehicleInspectProof

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<msg_sft_vehicle_inspect_proofs>

=cut

__PACKAGE__->table("msg_sft_vehicle_inspect_proofs");

=head1 ACCESSORS

=head2 idmsg_sft_vehicle_inspect_proofs

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 mnoteid

  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 InspectImageId

  accessor: 'inspect_image_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "idmsg_sft_vehicle_inspect_proofs",
    {   data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "mnoteid",
    {   data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "InspectImageId",
    {   accessor       => "inspect_image_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</idmsg_sft_vehicle_inspect_proofs>

=back

=cut

__PACKAGE__->set_primary_key("idmsg_sft_vehicle_inspect_proofs");

=head1 UNIQUE CONSTRAINTS

=head2 C<msg_sft_vehicle_inspect_proofs_unq>

=over 4

=item * L</mnoteid>

=item * L</InspectImageId>

=back

=cut

__PACKAGE__->add_unique_constraint("msg_sft_vehicle_inspect_proofs_unq", ["mnoteid", "InspectImageId"],);

=head1 RELATIONS

=head2 inspect_image

Type: belongs_to

Related object: L<TMS::Schema::Result::SftVehicleInspectProof>

=cut

__PACKAGE__->belongs_to(
    "inspect_image",
    "TMS::Schema::Result::SftVehicleInspectProof",
    {InspectImageId => "InspectImageId"},
    {is_deferrable  => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 mnoteid

Type: belongs_to

Related object: L<TMS::Schema::Result::MsgNote>

=cut

__PACKAGE__->belongs_to(
    "mnoteid",
    "TMS::Schema::Result::MsgNote",
    {mnoteid       => "mnoteid"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-06-02 20:08:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:vcmrSYGUPa4v2OMEsqITOQ

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
