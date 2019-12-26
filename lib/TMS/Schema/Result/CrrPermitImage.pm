use utf8;

package TMS::Schema::Result::CrrPermitImage;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::CrrPermitImage

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<crr_permit_images>

=cut

__PACKAGE__->table("crr_permit_images");

=head1 ACCESSORS

=head2 PrmtImgId

  accessor: 'prmt_img_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 StatePrmtId

  accessor: 'state_prmt_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 PermtImageId

  accessor: 'permt_image_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "PrmtImgId",
    {   accessor          => "prmt_img_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "StatePrmtId",
    {   accessor       => "state_prmt_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "PermtImageId",
    {   accessor       => "permt_image_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</PrmtImgId>

=back

=cut

__PACKAGE__->set_primary_key("PrmtImgId");

=head1 UNIQUE CONSTRAINTS

=head2 C<StateUnqImage>

=over 4

=item * L</StatePrmtId>

=item * L</PermtImageId>

=back

=cut

__PACKAGE__->add_unique_constraint("StateUnqImage", ["StatePrmtId", "PermtImageId"]);

=head1 RELATIONS

=head2 permt_image

Type: belongs_to

Related object: L<TMS::Schema::Result::GenFile>

=cut

__PACKAGE__->belongs_to(
    "permt_image",
    "TMS::Schema::Result::GenFile",
    {FileId        => "PermtImageId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 state_prmt

Type: belongs_to

Related object: L<TMS::Schema::Result::CrrStatePermit>

=cut

__PACKAGE__->belongs_to(
    "state_prmt",
    "TMS::Schema::Result::CrrStatePermit",
    {StatePrmtId   => "StatePrmtId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-26 15:33:20
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:KQxlH5yiyMgRywIepqmBtA

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
