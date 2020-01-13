use utf8;

package TMS::Schema::Result::EntCustomer;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::EntCustomer

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<ent_customers>

=cut

__PACKAGE__->table("ent_customers");

=head1 ACCESSORS

=head2 CstmrId

  accessor: 'cstmr_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 MC

  accessor: 'mc'
  data_type: 'varchar'
  is_nullable: 1
  size: 10

MC number

=head2 DOT

  accessor: 'dot'
  data_type: 'varchar'
  is_nullable: 1
  size: 15

=head2 SCAC

  accessor: 'scac'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

SCACC

=head2 Terms

  accessor: 'terms'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

Payment terms

=head2 Factoring

  accessor: 'factoring'
  data_type: 'enum'
  extra: {list => ["yes","no"]}
  is_nullable: 1

=head2 CreditLimit

  accessor: 'credit_limit'
  data_type: 'decimal'
  extra: {unsigned => 1}
  is_nullable: 1
  size: [10,2]

Credit Limit

=head2 Bond

  accessor: 'bond'
  data_type: 'varchar'
  is_nullable: 1
  size: 64

=head2 DUNS

  accessor: 'duns'
  data_type: 'char'
  is_nullable: 1
  size: 9

=head2 DontUse

  accessor: 'dont_use'
  data_type: 'enum'
  extra: {list => ["do not use","can use"]}
  is_nullable: 1

Do not use

=head2 WhyDontUse

  accessor: 'why_dont_use'
  data_type: 'text'
  is_nullable: 1

Why do not use

=head2 RequireOriginals

  accessor: 'require_originals'
  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

=cut

__PACKAGE__->add_columns(
    "CstmrId",
    {   accessor       => "cstmr_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "MC",
    {accessor => "mc", data_type => "varchar", is_nullable => 1, size => 10},
    "DOT",
    {accessor => "dot", data_type => "varchar", is_nullable => 1, size => 15},
    "SCAC",
    {accessor => "scac", data_type => "varchar", is_nullable => 1, size => 255},
    "Terms",
    {accessor => "terms", data_type => "varchar", is_nullable => 1, size => 255},
    "Factoring",
    {   accessor    => "factoring",
        data_type   => "enum",
        extra       => {list => ["yes", "no"]},
        is_nullable => 1,
    },
    "CreditLimit",
    {   accessor    => "credit_limit",
        data_type   => "decimal",
        extra       => {unsigned => 1},
        is_nullable => 1,
        size        => [10, 2],
    },
    "Bond",
    {accessor => "bond", data_type => "varchar", is_nullable => 1, size => 64},
    "DUNS",
    {accessor => "duns", data_type => "char", is_nullable => 1, size => 9},
    "DontUse",
    {   accessor    => "dont_use",
        data_type   => "enum",
        extra       => {list => ["do not use", "can use"]},
        is_nullable => 1,
    },
    "WhyDontUse",
    {accessor => "why_dont_use", data_type => "text", is_nullable => 1},
    "RequireOriginals",
    {   accessor      => "require_originals",
        data_type     => "tinyint",
        default_value => 0,
        extra         => {unsigned => 1},
        is_nullable   => 0,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</CstmrId>

=back

=cut

__PACKAGE__->set_primary_key("CstmrId");

=head1 UNIQUE CONSTRAINTS

=head2 C<DOT_UNIQUE>

=over 4

=item * L</DOT>

=back

=cut

__PACKAGE__->add_unique_constraint("DOT_UNIQUE", ["DOT"]);

=head2 C<MC_UNIQUE>

=over 4

=item * L</MC>

=back

=cut

__PACKAGE__->add_unique_constraint("MC_UNIQUE", ["MC"]);

=head2 C<SCAC_UNIQUE>

=over 4

=item * L</SCAC>

=back

=cut

__PACKAGE__->add_unique_constraint("SCAC_UNIQUE", ["SCAC"]);

=head1 RELATIONS

=head2 cmm_assignments_customers

Type: has_many

Related object: L<TMS::Schema::Result::CmmAssignmentsCustomer>

=cut

__PACKAGE__->has_many(
    "cmm_assignments_customers", "TMS::Schema::Result::CmmAssignmentsCustomer",
    {"foreign.CustomerId" => "self.CstmrId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 cstmr

Type: belongs_to

Related object: L<TMS::Schema::Result::EntBusiness>

=cut

__PACKAGE__->belongs_to(
    "cstmr",
    "TMS::Schema::Result::EntBusiness",
    {BizId         => "CstmrId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

=head2 dsp_loads

Type: has_many

Related object: L<TMS::Schema::Result::DspLoad>

=cut

__PACKAGE__->has_many(
    "dsp_loads",
    "TMS::Schema::Result::DspLoad",
    {"foreign.BrokerId" => "self.CstmrId"},
    {cascade_copy       => 0, cascade_delete => 0},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-01-08 15:30:12
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:a0ubIfHoh5IQkw4PdaA5qA

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
