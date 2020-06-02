use utf8;

package TMS::Schema::Result::EntCarrier;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::EntCarrier

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<ent_carriers>

=cut

__PACKAGE__->table("ent_carriers");

=head1 ACCESSORS

=head2 CarrierId

  accessor: 'carrier_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 MC

  accessor: 'mc'
  data_type: 'varchar'
  is_nullable: 1
  size: 10

MC/MX/FF Number(s)

=head2 McCertificatePhoto

  accessor: 'mc_certificate_photo'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 DOT

  accessor: 'dot'
  data_type: 'varchar'
  is_nullable: 1
  size: 15

=head2 CrType

  accessor: 'cr_type'
  data_type: 'set'
  extra: {list => ["Company Carrier","Brokerage Only"]}
  is_nullable: 1

=head2 SCAC

  accessor: 'scac'
  data_type: 'varchar'
  is_nullable: 1
  size: 4

=head2 RateConfEmailAddress

  accessor: 'rate_conf_email_address'
  data_type: 'varchar'
  is_nullable: 1
  size: 255

=head2 AddedToFMCSA

  accessor: 'added_to_fmcsa'
  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 1

Date when carrier information was added to MCMIS Database System

=head2 OIC_STATE

  accessor: 'oic_state'
  data_type: 'char'
  is_nullable: 1
  size: 2

FMCSA State office with oversight for this carrier

=head2 AgreementFile

  accessor: 'agreement_file'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 AgreedBy

  accessor: 'agreed_by'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 CarrierRepAgreedBy

  accessor: 'carrier_rep_agreed_by'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 1

=head2 AgreementDate

  accessor: 'agreement_date'
  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
    "CarrierId",
    {   accessor       => "carrier_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "MC",
    {accessor => "mc", data_type => "varchar", is_nullable => 1, size => 10},
    "McCertificatePhoto",
    {   accessor       => "mc_certificate_photo",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "DOT",
    {accessor => "dot", data_type => "varchar", is_nullable => 1, size => 15},
    "CrType",
    {   accessor    => "cr_type",
        data_type   => "set",
        extra       => {list => ["Company Carrier", "Brokerage Only"]},
        is_nullable => 1,
    },
    "SCAC",
    {accessor => "scac", data_type => "varchar", is_nullable => 1, size => 4},
    "RateConfEmailAddress",
    {   accessor    => "rate_conf_email_address",
        data_type   => "varchar",
        is_nullable => 1,
        size        => 255,
    },
    "AddedToFMCSA",
    {   accessor                  => "added_to_fmcsa",
        data_type                 => "date",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
    },
    "OIC_STATE",
    {accessor => "oic_state", data_type => "char", is_nullable => 1, size => 2},
    "AgreementFile",
    {   accessor       => "agreement_file",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "AgreedBy",
    {   accessor       => "agreed_by",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "CarrierRepAgreedBy",
    {   accessor       => "carrier_rep_agreed_by",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 1,
    },
    "AgreementDate",
    {   accessor                  => "agreement_date",
        data_type                 => "date",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
    },
);

=head1 PRIMARY KEY

=over 4

=item * L</CarrierId>

=back

=cut

__PACKAGE__->set_primary_key("CarrierId");

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

=head2 agreed_by

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
    "agreed_by",
    "TMS::Schema::Result::HrAssociate",
    {AstId => "AgreedBy"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

=head2 agreement_file

Type: belongs_to

Related object: L<TMS::Schema::Result::GenFile>

=cut

__PACKAGE__->belongs_to(
    "agreement_file",
    "TMS::Schema::Result::GenFile",
    {FileId => "AgreementFile"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

=head2 carrier

Type: belongs_to

Related object: L<TMS::Schema::Result::EntBusiness>

=cut

__PACKAGE__->belongs_to(
    "carrier",
    "TMS::Schema::Result::EntBusiness",
    {BizId         => "CarrierId"},
    {is_deferrable => 1, on_delete => "NO ACTION", on_update => "NO ACTION"},
);

=head2 carrier_rep_agreed_by

Type: belongs_to

Related object: L<TMS::Schema::Result::HrAssociate>

=cut

__PACKAGE__->belongs_to(
    "carrier_rep_agreed_by",
    "TMS::Schema::Result::HrAssociate",
    {AstId => "CarrierRepAgreedBy"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "RESTRICT",
        on_update     => "CASCADE",
    },
);

=head2 crr_permit_accounts

Type: has_many

Related object: L<TMS::Schema::Result::CrrPermitAccount>

=cut

__PACKAGE__->has_many(
    "crr_permit_accounts", "TMS::Schema::Result::CrrPermitAccount",
    {"foreign.CarrierId" => "self.CarrierId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 crr_statistics

Type: has_many

Related object: L<TMS::Schema::Result::CrrStatistic>

=cut

__PACKAGE__->has_many(
    "crr_statistics",
    "TMS::Schema::Result::CrrStatistic",
    {"foreign.CarrierId" => "self.CarrierId"},
    {cascade_copy        => 0, cascade_delete => 0},
);

=head2 ent_owner_operators

Type: has_many

Related object: L<TMS::Schema::Result::EntOwnerOperator>

=cut

__PACKAGE__->has_many(
    "ent_owner_operators", "TMS::Schema::Result::EntOwnerOperator",
    {"foreign.CarrierId" => "self.CarrierId"}, {cascade_copy => 0, cascade_delete => 0},
);

=head2 inv_vehicles

Type: has_many

Related object: L<TMS::Schema::Result::InvVehicle>

=cut

__PACKAGE__->has_many(
    "inv_vehicles",
    "TMS::Schema::Result::InvVehicle",
    {"foreign.CarrierId" => "self.CarrierId"},
    {cascade_copy        => 0, cascade_delete => 0},
);

=head2 mc_certificate_photo

Type: belongs_to

Related object: L<TMS::Schema::Result::GenFile>

=cut

__PACKAGE__->belongs_to(
    "mc_certificate_photo",
    "TMS::Schema::Result::GenFile",
    {FileId => "McCertificatePhoto"},
    {   is_deferrable => 1,
        join_type     => "LEFT",
        on_delete     => "SET NULL",
        on_update     => "CASCADE",
    },
);

=head2 msg_ent_carriers

Type: has_many

Related object: L<TMS::Schema::Result::MsgEntCarrier>

=cut

__PACKAGE__->has_many(
    "msg_ent_carriers",
    "TMS::Schema::Result::MsgEntCarrier",
    {"foreign.CarrierId" => "self.CarrierId"},
    {cascade_copy        => 0, cascade_delete => 0},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-06-02 13:19:17
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:lH04DBKxp21x4/R5MEWoOg
__PACKAGE__->has_many(
    "notes",
    "TMS::Schema::Result::MsgNote",
    sub {
        my $args          = shift;
        my @primary_cols  = $args->{self_resultsource}->primary_columns;
        my $primary_alias = $args->{self_alias} . '.' . $primary_cols[0];
        return {
            "$args->{foreign_alias}.sourceid"    => {-ident => $primary_alias},
            "$args->{foreign_alias}.sourcetable" => $args->{self_resultsource}->from(),
        };
    },
    {cascade_copy => 0, cascade_delete => 0},
);

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
