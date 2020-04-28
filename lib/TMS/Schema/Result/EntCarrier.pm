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
  data_type: 'enum'
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

=head2 CargoCarried

  accessor: 'cargo_carried'
  data_type: 'enum'
  extra: {list => ["General Freight","Household Goods","Metal: sheets, coils, rolls","Motor Vehicles","Drive/Tow away","Logs, Poles, Beams, Lumber","Building Materials","Mobile Homes","Machinery, Large Objects","Fresh Produce","Liquids/Gases","Intermodal Cont.","Passengers","Oilfield Equipment","Livestock","Grain, Feed, Hay","Coal/Coke","Meat","Garbage/Refuse","US Mail","Chemicals","Commodities Dry Bulk","Refrigerated Food","Beverages","Paper Products","Utilities","Agricultural/Farm Supplies","Construction","Water Well"]}
  is_nullable: 1

=head2 CarrierOperation

  accessor: 'carrier_operation'
  data_type: 'enum'
  extra: {list => ["Interstate","Intrastate Only (HM)","Intrastate Only (Non-HM)"]}
  is_nullable: 1

=head2 OperationClassification

  accessor: 'operation_classification'
  data_type: 'enum'
  extra: {list => ["Auth. For Hire","Exempt For Hire","Private(Property)","Priv. Pass. (Business)","Priv. Pass.(Non-business)","Migrant","U.S. Mail","Fed. Gov","State Gov","Local Gov","Indian Nation"]}
  is_nullable: 1

=head2 MCS150FormDate

  accessor: 'mcs150_form_date'
  data_type: 'date'
  datetime_undef_if_invalid: 1
  is_nullable: 1

Latest date MCS-150 was filed

=head2 MCS150FormMileage

  accessor: 'mcs150_form_mileage'
  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

Vehicle Mileage Traveled reported on the carrier MCS-150 form

=head2 MCS150FormMileageYear

  accessor: 'mcs150_form_mileage_year'
  data_type: 'integer'
  is_nullable: 1

Year for which Vehicle Mileage Traveled was reported

=head2 InerstateDriversLess100M

  accessor: 'inerstate_drivers_less100_m'
  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 InerstateDriversOver100M

  accessor: 'inerstate_drivers_over100_m'
  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 IntrastateDriversLess100M

  accessor: 'intrastate_drivers_less100_m'
  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 IntrastateDriversOver100M

  accessor: 'intrastate_drivers_over100_m'
  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 EmployedDriversCDL

  accessor: 'employed_drivers_cdl'
  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 TractorsOwned

  accessor: 'tractors_owned'
  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 TractorsTermLeased

  accessor: 'tractors_term_leased'
  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 TractorsTripLeased

  accessor: 'tractors_trip_leased'
  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 TrucksOwned

  accessor: 'trucks_owned'
  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 TrucksTermLeased

  accessor: 'trucks_term_leased'
  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 TrucksTripLeased

  accessor: 'trucks_trip_leased'
  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 TrailersOwned

  accessor: 'trailers_owned'
  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 TrailersTermLeased

  accessor: 'trailers_term_leased'
  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

=head2 TrailersTripLeased

  accessor: 'trailers_trip_leased'
  data_type: 'integer'
  extra: {unsigned => 1}
  is_nullable: 1

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

=head2 HmFlag

  accessor: 'hm_flag'
  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

Carrier is subject to placardable HM threshold

=head2 PcFlag

  accessor: 'pc_flag'
  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

Carrier is subject to passenger carrier Threshold

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
        data_type   => "enum",
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
    "CargoCarried",
    {   accessor  => "cargo_carried",
        data_type => "enum",
        extra     => {
            list => [
                "General Freight",
                "Household Goods",
                "Metal: sheets, coils, rolls",
                "Motor Vehicles",
                "Drive/Tow away",
                "Logs, Poles, Beams, Lumber",
                "Building Materials",
                "Mobile Homes",
                "Machinery, Large Objects",
                "Fresh Produce",
                "Liquids/Gases",
                "Intermodal Cont.",
                "Passengers",
                "Oilfield Equipment",
                "Livestock",
                "Grain, Feed, Hay",
                "Coal/Coke",
                "Meat",
                "Garbage/Refuse",
                "US Mail",
                "Chemicals",
                "Commodities Dry Bulk",
                "Refrigerated Food",
                "Beverages",
                "Paper Products",
                "Utilities",
                "Agricultural/Farm Supplies",
                "Construction",
                "Water Well",
            ],
        },
        is_nullable => 1,
    },
    "CarrierOperation",
    {   accessor    => "carrier_operation",
        data_type   => "enum",
        extra       => {list => ["Interstate", "Intrastate Only (HM)", "Intrastate Only (Non-HM)",],},
        is_nullable => 1,
    },
    "OperationClassification",
    {   accessor  => "operation_classification",
        data_type => "enum",
        extra     => {
            list => [
                "Auth. For Hire",
                "Exempt For Hire",
                "Private(Property)",
                "Priv. Pass. (Business)",
                "Priv. Pass.(Non-business)",
                "Migrant",
                "U.S. Mail",
                "Fed. Gov",
                "State Gov",
                "Local Gov",
                "Indian Nation",
            ],
        },
        is_nullable => 1,
    },
    "MCS150FormDate",
    {   accessor                  => "mcs150_form_date",
        data_type                 => "date",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
    },
    "MCS150FormMileage",
    {   accessor    => "mcs150_form_mileage",
        data_type   => "integer",
        extra       => {unsigned => 1},
        is_nullable => 1,
    },
    "MCS150FormMileageYear",
    {   accessor    => "mcs150_form_mileage_year",
        data_type   => "integer",
        is_nullable => 1,
    },
    "InerstateDriversLess100M",
    {   accessor    => "inerstate_drivers_less100_m",
        data_type   => "integer",
        extra       => {unsigned => 1},
        is_nullable => 1,
    },
    "InerstateDriversOver100M",
    {   accessor    => "inerstate_drivers_over100_m",
        data_type   => "integer",
        extra       => {unsigned => 1},
        is_nullable => 1,
    },
    "IntrastateDriversLess100M",
    {   accessor    => "intrastate_drivers_less100_m",
        data_type   => "integer",
        extra       => {unsigned => 1},
        is_nullable => 1,
    },
    "IntrastateDriversOver100M",
    {   accessor    => "intrastate_drivers_over100_m",
        data_type   => "integer",
        extra       => {unsigned => 1},
        is_nullable => 1,
    },
    "EmployedDriversCDL",
    {   accessor    => "employed_drivers_cdl",
        data_type   => "integer",
        extra       => {unsigned => 1},
        is_nullable => 1,
    },
    "TractorsOwned",
    {   accessor    => "tractors_owned",
        data_type   => "integer",
        extra       => {unsigned => 1},
        is_nullable => 1,
    },
    "TractorsTermLeased",
    {   accessor    => "tractors_term_leased",
        data_type   => "integer",
        extra       => {unsigned => 1},
        is_nullable => 1,
    },
    "TractorsTripLeased",
    {   accessor    => "tractors_trip_leased",
        data_type   => "integer",
        extra       => {unsigned => 1},
        is_nullable => 1,
    },
    "TrucksOwned",
    {   accessor    => "trucks_owned",
        data_type   => "integer",
        extra       => {unsigned => 1},
        is_nullable => 1,
    },
    "TrucksTermLeased",
    {   accessor    => "trucks_term_leased",
        data_type   => "integer",
        extra       => {unsigned => 1},
        is_nullable => 1,
    },
    "TrucksTripLeased",
    {   accessor    => "trucks_trip_leased",
        data_type   => "integer",
        extra       => {unsigned => 1},
        is_nullable => 1,
    },
    "TrailersOwned",
    {   accessor    => "trailers_owned",
        data_type   => "integer",
        extra       => {unsigned => 1},
        is_nullable => 1,
    },
    "TrailersTermLeased",
    {   accessor    => "trailers_term_leased",
        data_type   => "integer",
        extra       => {unsigned => 1},
        is_nullable => 1,
    },
    "TrailersTripLeased",
    {   accessor    => "trailers_trip_leased",
        data_type   => "integer",
        extra       => {unsigned => 1},
        is_nullable => 1,
    },
    "AddedToFMCSA",
    {   accessor                  => "added_to_fmcsa",
        data_type                 => "date",
        datetime_undef_if_invalid => 1,
        is_nullable               => 1,
    },
    "OIC_STATE",
    {accessor => "oic_state", data_type => "char", is_nullable => 1, size => 2},
    "HmFlag",
    {   accessor      => "hm_flag",
        data_type     => "tinyint",
        default_value => 0,
        extra         => {unsigned => 1},
        is_nullable   => 0,
    },
    "PcFlag",
    {   accessor      => "pc_flag",
        data_type     => "tinyint",
        default_value => 0,
        extra         => {unsigned => 1},
        is_nullable   => 0,
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

=head2 crr_permit_accounts

Type: has_many

Related object: L<TMS::Schema::Result::CrrPermitAccount>

=cut

__PACKAGE__->has_many(
    "crr_permit_accounts", "TMS::Schema::Result::CrrPermitAccount",
    {"foreign.CarrierId" => "self.CarrierId"}, {cascade_copy => 0, cascade_delete => 0},
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

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-04-28 11:12:56
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:LiEiykQH2iQ3lRlaOvb9VQ

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
