use utf8;
package TMS::Schema::Result::SftVehicleInspectProof;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::SftVehicleInspectProof

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<sft_vehicle_inspect_proofs>

=cut

__PACKAGE__->table("sft_vehicle_inspect_proofs");

=head1 ACCESSORS

=head2 InspectImageId

  accessor: 'inspect_image_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 FileRef

  accessor: 'file_ref'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 InspectedItemId

  accessor: 'inspected_item_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 Notes

  accessor: 'notes'
  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
  "InspectImageId",
  {
    accessor => "inspect_image_id",
    data_type => "bigint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "FileRef",
  {
    accessor       => "file_ref",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "InspectedItemId",
  {
    accessor       => "inspected_item_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "Notes",
  { accessor => "notes", data_type => "text", is_nullable => 1 },
);

=head1 PRIMARY KEY

=over 4

=item * L</InspectImageId>

=back

=cut

__PACKAGE__->set_primary_key("InspectImageId");

=head1 RELATIONS

=head2 file_ref

Type: belongs_to

Related object: L<TMS::Schema::Result::GenFile>

=cut

__PACKAGE__->belongs_to(
  "file_ref",
  "TMS::Schema::Result::GenFile",
  { FileId => "FileRef" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);

=head2 inspected_item

Type: belongs_to

Related object: L<TMS::Schema::Result::SftVehicleInspectedItem>

=cut

__PACKAGE__->belongs_to(
  "inspected_item",
  "TMS::Schema::Result::SftVehicleInspectedItem",
  { InspectedId => "InspectedItemId" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-13 13:34:11
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:1V6pW6Mum21Yl01olEc/Hw


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;