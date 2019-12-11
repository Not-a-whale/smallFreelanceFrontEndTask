use utf8;
package TMS::Schema::Result::CrrStatePermit;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::CrrStatePermit

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<crr_state_permits>

=cut

__PACKAGE__->table("crr_state_permits");

=head1 ACCESSORS

=head2 StatePrmtId

  accessor: 'state_prmt_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 CrrPrmtAccId

  accessor: 'crr_prmt_acc_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 VehicleId

  accessor: 'vehicle_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 ReceiptNo

  accessor: 'receipt_no'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 Effective

  accessor: 'effective'
  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 Expired

  accessor: 'expired'
  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 Issued

  accessor: 'issued'
  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "StatePrmtId",
  {
    accessor => "state_prmt_id",
    data_type => "bigint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "CrrPrmtAccId",
  {
    accessor       => "crr_prmt_acc_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "VehicleId",
  {
    accessor       => "vehicle_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "ReceiptNo",
  {
    accessor => "receipt_no",
    data_type => "varchar",
    is_nullable => 0,
    size => 255,
  },
  "Effective",
  {
    accessor => "effective",
    data_type => "date",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "Expired",
  {
    accessor => "expired",
    data_type => "date",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "Issued",
  {
    accessor => "issued",
    data_type => "date",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</StatePrmtId>

=back

=cut

__PACKAGE__->set_primary_key("StatePrmtId");

=head1 UNIQUE CONSTRAINTS

=head2 C<UniqVhclPermit>

=over 4

=item * L</ReceiptNo>

=item * L</Effective>

=item * L</Expired>

=back

=cut

__PACKAGE__->add_unique_constraint("UniqVhclPermit", ["ReceiptNo", "Effective", "Expired"]);

=head1 RELATIONS

=head2 crr_permit_images

Type: has_many

Related object: L<TMS::Schema::Result::CrrPermitImage>

=cut

__PACKAGE__->has_many(
  "crr_permit_images",
  "TMS::Schema::Result::CrrPermitImage",
  { "foreign.StatePrmtId" => "self.StatePrmtId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 crr_prmt_acc

Type: belongs_to

Related object: L<TMS::Schema::Result::CrrPermitAccount>

=cut

__PACKAGE__->belongs_to(
  "crr_prmt_acc",
  "TMS::Schema::Result::CrrPermitAccount",
  { CrrPrmtAccId => "CrrPrmtAccId" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);

=head2 vehicle

Type: belongs_to

Related object: L<TMS::Schema::Result::InvVehicle>

=cut

__PACKAGE__->belongs_to(
  "vehicle",
  "TMS::Schema::Result::InvVehicle",
  { VehicleId => "VehicleId" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-10 15:38:48
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:VzxCw/meoVQJtY1INA3dfw
# These lines were loaded from '/home/cpeter/temp/lib/TMS/Schema/Result/CrrStatePermit.pm' found in @INC.
# They are now part of the custom portion of this file
# for you to hand-edit.  If you do not either delete
# this section or remove that file from @INC, this section
# will be repeated redundantly when you re-create this
# file again via Loader!  See skip_load_external to disable
# this feature.

use utf8;
package TMS::Schema::Result::CrrStatePermit;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::CrrStatePermit

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<crr_state_permits>

=cut

__PACKAGE__->table("crr_state_permits");

=head1 ACCESSORS

=head2 StatePrmtId

  accessor: 'state_prmt_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 CrrPrmtAccId

  accessor: 'crr_prmt_acc_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 VehicleId

  accessor: 'vehicle_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 ReceiptNo

  accessor: 'receipt_no'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

=head2 Effective

  accessor: 'effective'
  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 Expired

  accessor: 'expired'
  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=head2 Issued

  accessor: 'issued'
  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
  "StatePrmtId",
  {
    accessor => "state_prmt_id",
    data_type => "bigint",
    extra => { unsigned => 1 },
    is_auto_increment => 1,
    is_nullable => 0,
  },
  "CrrPrmtAccId",
  {
    accessor       => "crr_prmt_acc_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "VehicleId",
  {
    accessor       => "vehicle_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "ReceiptNo",
  {
    accessor => "receipt_no",
    data_type => "varchar",
    is_nullable => 0,
    size => 255,
  },
  "Effective",
  {
    accessor => "effective",
    data_type => "date",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "Expired",
  {
    accessor => "expired",
    data_type => "date",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
  "Issued",
  {
    accessor => "issued",
    data_type => "date",
    datetime_undef_if_invalid => 1,
    is_nullable => 0,
  },
);

=head1 PRIMARY KEY

=over 4

=item * L</StatePrmtId>

=back

=cut

__PACKAGE__->set_primary_key("StatePrmtId");

=head1 UNIQUE CONSTRAINTS

=head2 C<UniqVhclPermit>

=over 4

=item * L</ReceiptNo>

=item * L</Effective>

=item * L</Expired>

=back

=cut

__PACKAGE__->add_unique_constraint("UniqVhclPermit", ["ReceiptNo", "Effective", "Expired"]);

=head1 RELATIONS

=head2 crr_permit_images

Type: has_many

Related object: L<TMS::Schema::Result::CrrPermitImage>

=cut

__PACKAGE__->has_many(
  "crr_permit_images",
  "TMS::Schema::Result::CrrPermitImage",
  { "foreign.StatePrmtId" => "self.StatePrmtId" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 crr_prmt_acc

Type: belongs_to

Related object: L<TMS::Schema::Result::CrrPermitAccount>

=cut

__PACKAGE__->belongs_to(
  "crr_prmt_acc",
  "TMS::Schema::Result::CrrPermitAccount",
  { CrrPrmtAccId => "CrrPrmtAccId" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);

=head2 vehicle

Type: belongs_to

Related object: L<TMS::Schema::Result::InvVehicle>

=cut

__PACKAGE__->belongs_to(
  "vehicle",
  "TMS::Schema::Result::InvVehicle",
  { VehicleId => "VehicleId" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-10 12:29:14
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:4KyTeEX2V1Wq05wFfIQlOQ


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;