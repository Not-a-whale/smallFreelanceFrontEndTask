use utf8;

package TMS::Schema::Result::BizBranch;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::BizBranch - Office Branch Details

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<biz_branches>

=cut

__PACKAGE__->table("biz_branches");

=head1 ACCESSORS

=head2 BrnchId

  accessor: 'brnch_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 OfficeName

  accessor: 'office_name'
  data_type: 'varchar'
  default_value: (empty string)
  is_nullable: 0
  size: 255

=head2 BizId

  accessor: 'biz_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 BrnchAddress

  accessor: 'brnch_address'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 BrnchPhone

  accessor: 'brnch_phone'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 BrnchFax

  accessor: 'brnch_fax'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 BrnchEMail

  accessor: 'brnch_email'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=cut

__PACKAGE__->add_columns(
    "BrnchId",
    {   accessor          => "brnch_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "OfficeName",
    {   accessor      => "office_name",
        data_type     => "varchar",
        default_value => "",
        is_nullable   => 0,
        size          => 255,
    },
    "BizId",
    {   accessor       => "biz_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "BrnchAddress",
    {   accessor       => "brnch_address",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "BrnchPhone",
    {   accessor       => "brnch_phone",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "BrnchFax",
    {   accessor       => "brnch_fax",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "BrnchEMail",
    {   accessor    => "brnch_email",
        data_type   => "varchar",
        is_nullable => 1,
        size        => 255,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</BrnchId>

=back

=cut

__PACKAGE__->set_primary_key("BrnchId");

=head1 RELATIONS

=head2 biz

Type: belongs_to

Related object: L<TMS::Schema::Result::EntBusiness>

=cut

__PACKAGE__->belongs_to(
    "biz",
    "TMS::Schema::Result::EntBusiness",
    {BizId         => "BizId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 brnch_address

Type: belongs_to

Related object: L<TMS::Schema::Result::CntAddress>

=cut

__PACKAGE__->belongs_to(
    "brnch_address",
    "TMS::Schema::Result::CntAddress",
    {AddrId        => "BrnchAddress"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 brnch_fax

Type: belongs_to

Related object: L<TMS::Schema::Result::CntPhonesfax>

=cut

__PACKAGE__->belongs_to(
    "brnch_fax",
    "TMS::Schema::Result::CntPhonesfax",
    {PhnFaxId => "BrnchFax"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

=head2 brnch_phone

Type: belongs_to

Related object: L<TMS::Schema::Result::CntPhonesfax>

=cut

__PACKAGE__->belongs_to(
    "brnch_phone",
    "TMS::Schema::Result::CntPhonesfax",
    {PhnFaxId      => "BrnchPhone"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 dsp_loads_destinations

Type: has_many

Related object: L<TMS::Schema::Result::DspLoadsDestination>

=cut

__PACKAGE__->has_many(
    "dsp_loads_destinations", "TMS::Schema::Result::DspLoadsDestination",
    {"foreign.Branch" => "self.BrnchId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 ent_people

Type: has_many

Related object: L<TMS::Schema::Result::EntPerson>

=cut

__PACKAGE__->has_many(
    "ent_people",
    "TMS::Schema::Result::EntPerson",
    {"foreign.BrnchId" => "self.BrnchId"},
    {cascade_copy      => 0, cascade_delete => 0},
);

=head2 fin_billing_banks

Type: has_many

Related object: L<TMS::Schema::Result::FinBillingBank>

=cut

__PACKAGE__->has_many(
    "fin_billing_banks", "TMS::Schema::Result::FinBillingBank",
    {"foreign.Institution" => "self.BrnchId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 fin_cheques

Type: has_many

Related object: L<TMS::Schema::Result::FinCheque>

=cut

__PACKAGE__->has_many(
    "fin_cheques",
    "TMS::Schema::Result::FinCheque",
    {"foreign.Bank" => "self.BrnchId"},
    {cascade_copy   => 0, cascade_delete => 0},
);

=head2 inv_equipments

Type: has_many

Related object: L<TMS::Schema::Result::InvEquipment>

=cut

__PACKAGE__->has_many(
    "inv_equipments",
    "TMS::Schema::Result::InvEquipment",
    {"foreign.VendorId" => "self.BrnchId"},
    {cascade_copy       => 0, cascade_delete => 0},
);

=head2 inv_support_vendors

Type: has_many

Related object: L<TMS::Schema::Result::InvSupportVendor>

=cut

__PACKAGE__->has_many(
    "inv_support_vendors", "TMS::Schema::Result::InvSupportVendor",
    {"foreign.VendorId" => "self.BrnchId"}, {cascade_copy => 0, cascade_delete => 0},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-12-24 07:43:32
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:T62aHU84vpikvFkFucYsWQ

__PACKAGE__->belongs_to(
  "vendor_address",
  "TMS::Schema::Result::CntAddress",
  { AddrId => "BrnchAddress" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);

__PACKAGE__->belongs_to(
  "vendor_phone",
  "TMS::Schema::Result::CntPhonesfax",
  { PhnFaxId => "BrnchPhone" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);

__PACKAGE__->belongs_to(
  "vendor_fax",
  "TMS::Schema::Result::CntPhonesfax",
  { PhnFaxId => "BrnchFax" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "RESTRICT",
    on_update     => "CASCADE",
  },
);

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
