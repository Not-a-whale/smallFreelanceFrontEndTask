use utf8;

package TMS::Schema::Result::CntPhonesfax;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::CntPhonesfax

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<cnt_phonesfaxes>

=cut

__PACKAGE__->table("cnt_phonesfaxes");

=head1 ACCESSORS

=head2 PhnFaxId

  accessor: 'phn_fax_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 Number

  accessor: 'number'
  data_type: 'varchar'
  is_nullable: 0
  size: 12

=head2 Extension

  accessor: 'extension'
  data_type: 'varchar'
  default_value: 0
  is_nullable: 0
  size: 10

=head2 Features

  accessor: 'features'
  data_type: 'set'
  default_value: 'VOICE'
  extra: {list => ["VOICE","SMS","MMS","FAX"]}
  is_nullable: 0

=head2 Mobility

  accessor: 'mobility'
  data_type: 'enum'
  default_value: 'LAND LINE'
  extra: {list => ["LAND LINE","MOBILE","SOFT PHONE"]}
  is_nullable: 0

=head2 Notes

  accessor: 'notes'
  data_type: 'text'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
    "PhnFaxId",
    {   accessor          => "phn_fax_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "Number",
    {accessor => "number", data_type => "varchar", is_nullable => 0, size => 12},
    "Extension",
    {   accessor      => "extension",
        data_type     => "varchar",
        default_value => 0,
        is_nullable   => 0,
        size          => 10,
    },
    "Features",
    {   accessor      => "features",
        data_type     => "set",
        default_value => "VOICE",
        extra         => {list => ["VOICE", "SMS", "MMS", "FAX"]},
        is_nullable   => 0,
    },
    "Mobility",
    {   accessor      => "mobility",
        data_type     => "enum",
        default_value => "LAND LINE",
        extra         => {list => ["LAND LINE", "MOBILE", "SOFT PHONE"]},
        is_nullable   => 0,
    },
    "Notes",
    {accessor => "notes", data_type => "text", is_nullable => 1},
);

=head1 PRIMARY KEY

=over 4

=item * L</PhnFaxId>

=back

=cut

__PACKAGE__->set_primary_key("PhnFaxId");

=head1 UNIQUE CONSTRAINTS

=head2 C<UnqNum>

=over 4

=item * L</Number>

=item * L</Extension>

=back

=cut

__PACKAGE__->add_unique_constraint("UnqNum", ["Number", "Extension"]);

=head1 RELATIONS

=head2 biz_branches_brnch_faxes

Type: has_many

Related object: L<TMS::Schema::Result::BizBranch>

=cut

__PACKAGE__->has_many(
    "biz_branches_brnch_faxes", "TMS::Schema::Result::BizBranch",
    {"foreign.BrnchFax" => "self.PhnFaxId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 biz_branches_brnch_phones

Type: has_many

Related object: L<TMS::Schema::Result::BizBranch>

=cut

__PACKAGE__->has_many(
    "biz_branches_brnch_phones", "TMS::Schema::Result::BizBranch",
    {"foreign.BrnchPhone" => "self.PhnFaxId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 fin_billing_infos_faxes

Type: has_many

Related object: L<TMS::Schema::Result::FinBillingInfo>

=cut

__PACKAGE__->has_many(
    "fin_billing_infos_faxes", "TMS::Schema::Result::FinBillingInfo",
    {"foreign.Fax" => "self.PhnFaxId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 fin_billing_infos_phones

Type: has_many

Related object: L<TMS::Schema::Result::FinBillingInfo>

=cut

__PACKAGE__->has_many(
    "fin_billing_infos_phones", "TMS::Schema::Result::FinBillingInfo",
    {"foreign.Phone" => "self.PhnFaxId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 hr_associates_biz_faxes

Type: has_many

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->has_many(
    "hr_associates_biz_faxes", "TMS::Schema::Result::HrAssociate",
    {"foreign.BizFax" => "self.PhnFaxId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 hr_associates_biz_phones

Type: has_many

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->has_many(
    "hr_associates_biz_phones", "TMS::Schema::Result::HrAssociate",
    {"foreign.BizPhone" => "self.PhnFaxId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 hr_confidentials

Type: has_many

Related object: L<TMS::Schema::Result::HrConfidential>

=cut

__PACKAGE__->has_many(
    "hr_confidentials",
    "TMS::Schema::Result::HrConfidential",
    {"foreign.PersonalPhone" => "self.PhnFaxId"},
    {cascade_copy            => 0, cascade_delete => 0},
);

=head2 hr_emrgency_contacts

Type: has_many

Related object: L<TMS::Schema::Result::HrEmrgencyContact>

=cut

__PACKAGE__->has_many(
    "hr_emrgency_contacts", "TMS::Schema::Result::HrEmrgencyContact",
    {"foreign.ContactPhone" => "self.PhnFaxId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 hr_references

Type: has_many

Related object: L<TMS::Schema::Result::HrReference>

=cut

__PACKAGE__->has_many(
    "hr_references",
    "TMS::Schema::Result::HrReference",
    {"foreign.ReferensorPhone" => "self.PhnFaxId"},
    {cascade_copy              => 0, cascade_delete => 0},
);

=head2 hr_residences

Type: has_many

Related object: L<TMS::Schema::Result::HrResidence>

=cut

__PACKAGE__->has_many(
    "hr_residences",
    "TMS::Schema::Result::HrResidence",
    {"foreign.ResPhone" => "self.PhnFaxId"},
    {cascade_copy       => 0, cascade_delete => 0},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-01-08 10:28:18
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Q6mu+qBpnpIux1ZOYo+C8Q

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
