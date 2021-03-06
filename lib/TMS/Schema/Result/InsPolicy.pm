use utf8;

package TMS::Schema::Result::InsPolicy;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::InsPolicy

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<ins_policies>

=cut

__PACKAGE__->table("ins_policies");

=head1 ACCESSORS

=head2 InsId

  accessor: 'ins_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 InsProvider

  accessor: 'ins_provider'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 ProofOfInsurance

  accessor: 'proof_of_insurance'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 TagName

  accessor: 'tag_name'
  data_type: 'varchar'
  is_nullable: 0
  size: 64

=head2 WhatIsInsured

  accessor: 'what_is_insured'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 PolicyNumber

  accessor: 'policy_number'
  data_type: 'varchar'
  is_nullable: 0
  size: 255

Policy Number

=head2 EffectiveDate

  accessor: 'effective_date'
  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 0

Effective Date

=head2 ExpirationDate

  accessor: 'expiration_date'
  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 0

Expiration Date

=head2 InsuredAmount

  accessor: 'insured_amount'
  data_type: 'decimal'
  extra: {unsigned => 1}
  is_nullable: 0
  size: [12,2]

Amount Insured

=head2 DownpaymentAmount

  accessor: 'downpayment_amount'
  data_type: 'decimal'
  default_value: 0.00
  extra: {unsigned => 1}
  is_nullable: 0
  size: [12,2]

Downpayment Amount

=head2 PaidBy

  accessor: 'paid_by'
  data_type: 'enum'
  extra: {list => ["Owner","Company"]}
  is_nullable: 1

Paid By

=head2 InsContact

  accessor: 'ins_contact'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
    "InsId",
    {   accessor          => "ins_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "InsProvider",
    {   accessor       => "ins_provider",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "ProofOfInsurance",
    {   accessor       => "proof_of_insurance",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "TagName",
    {   accessor    => "tag_name",
        data_type   => "varchar",
        is_nullable => 0,
        size        => 64,
    },
    "WhatIsInsured",
    {   accessor    => "what_is_insured",
        data_type   => "varchar",
        is_nullable => 1,
        size        => 255,
    },
    "PolicyNumber",
    {   accessor    => "policy_number",
        data_type   => "varchar",
        is_nullable => 0,
        size        => 255,
    },
    "EffectiveDate",
    {   accessor                  => "effective_date",
        data_type                 => "date",
        datetime_undef_if_invalid => 1,
        is_nullable               => 0,
    },
    "ExpirationDate",
    {   accessor                  => "expiration_date",
        data_type                 => "date",
        datetime_undef_if_invalid => 1,
        is_nullable               => 0,
    },
    "InsuredAmount",
    {   accessor    => "insured_amount",
        data_type   => "decimal",
        extra       => {unsigned => 1},
        is_nullable => 0,
        size        => [12, 2],
    },
    "DownpaymentAmount",
    {   accessor      => "downpayment_amount",
        data_type     => "decimal",
        default_value => "0.00",
        extra         => {unsigned => 1},
        is_nullable   => 0,
        size          => [12, 2],
    },
    "PaidBy",
    {   accessor    => "paid_by",
        data_type   => "enum",
        extra       => {list => ["Owner", "Company"]},
        is_nullable => 1,
    },
    "InsContact",
    {   accessor       => "ins_contact",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</InsId>

=back

=cut

__PACKAGE__->set_primary_key("InsId");

=head1 UNIQUE CONSTRAINTS

=head2 C<TagPolicyIndx>

=over 4

=item * L</TagName>

=item * L</PolicyNumber>

=item * L</EffectiveDate>

=item * L</ExpirationDate>

=item * L</InsuredAmount>

=back

=cut

__PACKAGE__->add_unique_constraint("TagPolicyIndx",
    ["TagName", "PolicyNumber", "EffectiveDate", "ExpirationDate", "InsuredAmount",],
);

=head1 RELATIONS

=head2 ins_contact

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
    "ins_contact",
    "TMS::Schema::Result::HrAssociate",
    {AstId => "InsContact"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

=head2 ins_provider

Type: belongs_to

Related object: L<TMS::Schema::Result::EntBusiness>

=cut

__PACKAGE__->belongs_to(
    "ins_provider",
    "TMS::Schema::Result::EntBusiness",
    {BizId         => "InsProvider"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 ins_to_entities

Type: has_many

Related object: L<TMS::Schema::Result::InsToEntity>

=cut

__PACKAGE__->has_many(
    "ins_to_entities", "TMS::Schema::Result::InsToEntity",
    {"foreign.InsId" => "self.InsId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 ins_to_vehicles

Type: has_many

Related object: L<TMS::Schema::Result::InsToVehicle>

=cut

__PACKAGE__->has_many(
    "ins_to_vehicles", "TMS::Schema::Result::InsToVehicle",
    {"foreign.InsId" => "self.InsId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 proof_of_insurance

Type: belongs_to

Related object: L<TMS::Schema::Result::GenFile>

=cut

__PACKAGE__->belongs_to(
    "proof_of_insurance",
    "TMS::Schema::Result::GenFile",
    {FileId => "ProofOfInsurance"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "CASCADE",
        on_update     => "CASCADE",
    },
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-06-02 20:08:31
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:UBPLTP9t9CDcHokLcIE/IA

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
