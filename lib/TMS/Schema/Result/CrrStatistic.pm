use utf8;

package TMS::Schema::Result::CrrStatistic;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::CrrStatistic - Carrier Statistics

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<crr_statistics>

=cut

__PACKAGE__->table("crr_statistics");

=head1 ACCESSORS

=head2 StatsId

  accessor: 'stats_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_auto_increment: 1
  is_nullable: 0

=head2 CarrierId

  accessor: 'carrier_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 DateUpdated

  accessor: 'date_updated'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 1

=head2 CargoCarried

  accessor: 'cargo_carried'
  data_type: 'enum'
  extra: {list => ["General Freight","Household Goods","Metal: sheets, coils, rolls","Motor Vehicles","Drive/Tow away","Logs, Poles, Beams, Lumber","Building Materials","Mobile Homes","Machinery, Large Objects","Fresh Produce","Liquids/Gases","Intermodal Cont.","Passengers","Oilfield Equipment","Livestock","Grain, Feed, Hay","Coal/Coke","Meat","Garbage/Refuse","US Mail","Chemicals","Commodities Dry Bulk","Refrigerated Food","Beverages","Paper Products","Utilities","Agricultural/Farm Supplies","Construction","Water Well"]}
  is_nullable: 1

=head2 CarrierOperation

  accessor: 'carrier_operation'
  data_type: 'enum'
  extra: {list => ["Interstate","Intrastate Only - HM","Intrastate Only - Non-HM"]}
  is_nullable: 1

=head2 OperationClassification

  accessor: 'operation_classification'
  data_type: 'enum'
  extra: {list => ["Auth. For Hire","Exempt For Hire","Private Property","Priv. Pass. Business","Priv. Pass. Non-business","Migrant","U.S. Mail","Fed. Gov","State Gov","Local Gov","Indian Nation"]}
  is_nullable: 1

=head2 HmFlag

  accessor: 'hm_flag'
  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

Carrier is subject to placardable hazardous material threshold

=head2 PcFlag

  accessor: 'pc_flag'
  data_type: 'tinyint'
  default_value: 0
  extra: {unsigned => 1}
  is_nullable: 0

Carrier is subject to passenger carrier threshold

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

CDL holders

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

=head2 UnitsOperated

  accessor: 'units_operated'
  data_type: 'integer'
  is_nullable: 1

=cut

__PACKAGE__->add_columns(
    "StatsId",
    {   accessor          => "stats_id",
        data_type         => "bigint",
        extra             => {unsigned => 1},
        is_auto_increment => 1,
        is_nullable       => 0,
    },
    "CarrierId",
    {   accessor       => "carrier_id",
        data_type      => "bigint",
        extra          => {unsigned => 1},
        is_foreign_key => 1,
        is_nullable    => 0,
    },
    "DateUpdated",
    {   accessor                  => "date_updated",
        data_type                 => "datetime",
        datetime_undef_if_invalid => 1,
        default_value             => "CURRENT_TIMESTAMP",
        is_nullable               => 1,
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
        extra       => {list => ["Interstate", "Intrastate Only - HM", "Intrastate Only - Non-HM",],},
        is_nullable => 1,
    },
    "OperationClassification",
    {   accessor  => "operation_classification",
        data_type => "enum",
        extra     => {
            list => [
                "Auth. For Hire",
                "Exempt For Hire",
                "Private Property",
                "Priv. Pass. Business",
                "Priv. Pass. Non-business",
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
    "UnitsOperated",
    {accessor => "units_operated", data_type => "integer", is_nullable => 1},
);

=head1 PRIMARY KEY

=over 4

=item * L</StatsId>

=back

=cut

__PACKAGE__->set_primary_key("StatsId");

=head1 UNIQUE CONSTRAINTS

=head2 C<StatsUpdated>

=over 4

=item * L</CarrierId>

=item * L</DateUpdated>

=back

=cut

__PACKAGE__->add_unique_constraint("StatsUpdated", ["CarrierId", "DateUpdated"]);

=head1 RELATIONS

=head2 carrier

Type: belongs_to

Related object: L<TMS::Schema::Result::EntCarrier>

=cut

__PACKAGE__->belongs_to(
    "carrier",
    "TMS::Schema::Result::EntCarrier",
    {CarrierId     => "CarrierId"},
    {is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE"},
);

# Created by DBIx::Class::Schema::Loader v0.07049 @ 2020-06-02 20:08:30
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Lsh6wCRgey2nHWy+zu103g

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');

1;
