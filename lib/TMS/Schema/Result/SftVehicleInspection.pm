use utf8;
package TMS::Schema::Result::SftVehicleInspection;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

=head1 NAME

TMS::Schema::Result::SftVehicleInspection

=cut

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Core';

=head1 TABLE: C<sft_vehicle_inspections>

=cut

__PACKAGE__->table("sft_vehicle_inspections");

=head1 ACCESSORS

=head2 InspectionId

  accessor: 'inspection_id'
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

=head2 InspectorId

  accessor: 'inspector_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 InspectorSignatureId

  accessor: 'inspector_signature_id'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 LocationOfRecords

  accessor: 'location_of_records'
  data_type: 'bigint'
  extra: {unsigned => 1}
  is_foreign_key: 1
  is_nullable: 0

=head2 InspectionNumber

  accessor: 'inspection_number'
  data_type: 'varchar'
  is_nullable: 0
  size: 10

=head2 DateInspection

  accessor: 'date_inspection'
  data_type: 'datetime'
  datetime_undef_if_invalid: 1
  default_value: 'CURRENT_TIMESTAMP'
  is_nullable: 0

=head2 Status

  accessor: 'status'
  data_type: 'enum'
  default_value: 'Other'
  extra: {list => ["Passed","Failed","Postponed","Other"]}
  is_nullable: 0

=head2 Remarks

  accessor: 'remarks'
  data_type: 'text'
  is_nullable: 1

=head2 Brakes

  accessor: 'brakes'
  data_type: 'enum'
  default_value: 'NA'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 BrakesAdjustment

  accessor: 'brakes_adjustment'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 BrakesMechanicalComponent

  accessor: 'brakes_mechanical_component'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 BrakesDrumRotor

  accessor: 'brakes_drum_rotor'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 BrakesHoseTubing

  accessor: 'brakes_hose_tubing'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 BrakesLining

  accessor: 'brakes_lining'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 BrakesAntilockSystem

  accessor: 'brakes_antilock_system'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 BrakesAutomaticAdjusters

  accessor: 'brakes_automatic_adjusters'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 BrakesLowAirWarning

  accessor: 'brakes_low_air_warning'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 BrakesTrailerAirSupply

  accessor: 'brakes_trailer_air_supply'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 BrakesCompressor

  accessor: 'brakes_compressor'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 BrakesParkingBrakes

  accessor: 'brakes_parking_brakes'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 BrakesOther

  accessor: 'brakes_other'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 Couplers

  accessor: 'couplers'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 CouplersFifthWheelMount

  accessor: 'couplers_fifth_wheel_mount'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 CouplersPinUpperPlate

  accessor: 'couplers_pin_upper_plate'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 CouplersPintleHookEye

  accessor: 'couplers_pintle_hook_eye'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 CouplersSafetyChains

  accessor: 'couplers_safety_chains'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 Exhaust

  accessor: 'exhaust'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 ExhaustLeaks

  accessor: 'exhaust_leaks'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 ExhaustPlacement

  accessor: 'exhaust_placement'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 Lighting

  accessor: 'lighting'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 LightingHeadlights

  accessor: 'lighting_headlights'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 LightingTailStop

  accessor: 'lighting_tail_stop'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 LightingClearanceMarker

  accessor: 'lighting_clearance_marker'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 LightingIdentification

  accessor: 'lighting_identification'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 LightingReflectors

  accessor: 'lighting_reflectors'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 LightingOther

  accessor: 'lighting_other'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 CabBody

  accessor: 'cab_body'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 CabBodyAccess

  accessor: 'cab_body_access'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 CabBodyEqptLoadSecure

  accessor: 'cab_body_eqpt_load_secure'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 CabBodyTieDowns

  accessor: 'cab_body_tie_downs'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 CabBodyHeaderboard

  accessor: 'cab_body_headerboard'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 CabBodyMotorcoachSeats

  accessor: 'cab_body_motorcoach_seats'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 CabBodyOther

  accessor: 'cab_body_other'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 Steering

  accessor: 'steering'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 SteeringAdjustment

  accessor: 'steering_adjustment'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 SteeringColumnGear

  accessor: 'steering_column_gear'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 SteeringAxle

  accessor: 'steering_axle'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 SteeringLinkage

  accessor: 'steering_linkage'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 SteeringPowerSteering

  accessor: 'steering_power_steering'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 SteeringOther

  accessor: 'steering_other'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 FuelSystem

  accessor: 'fuel_system'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 FuelSystemTanks

  accessor: 'fuel_system_tanks'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 FuelSystemLines

  accessor: 'fuel_system_lines'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 Suspension

  accessor: 'suspension'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 SuspensionSprings

  accessor: 'suspension_springs'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 SuspensionAttachments

  accessor: 'suspension_attachments'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 SuspensionSliders

  accessor: 'suspension_sliders'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 Mirrors

  accessor: 'mirrors'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 Frame

  accessor: 'frame'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 FrameMembers

  accessor: 'frame_members'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 FrameClearance

  accessor: 'frame_clearance'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 Tires

  accessor: 'tires'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 TiresTread

  accessor: 'tires_tread'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 TiresInflation

  accessor: 'tires_inflation'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 TiresDamage

  accessor: 'tires_damage'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 TiresSpeedRestrictions

  accessor: 'tires_speed_restrictions'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 TiresOther

  accessor: 'tires_other'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 WheelsRim

  accessor: 'wheels_rim'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 WheelsRimFasteners

  accessor: 'wheels_rim_fasteners'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 WheelsRimDiskSpoke

  accessor: 'wheels_rim_disk_spoke'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 Windshield

  accessor: 'windshield'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 WindshieldWipers

  accessor: 'windshield_wipers'
  data_type: 'enum'
  extra: {list => ["NA","OK","REPAIR"]}
  is_nullable: 0

=head2 Mileage

  accessor: 'mileage'
  data_type: 'varchar'
  is_nullable: 1
  size: 12

=cut

__PACKAGE__->add_columns(
  "InspectionId",
  {
    accessor       => "inspection_id",
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
  "InspectorId",
  {
    accessor       => "inspector_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "InspectorSignatureId",
  {
    accessor       => "inspector_signature_id",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "LocationOfRecords",
  {
    accessor       => "location_of_records",
    data_type      => "bigint",
    extra          => { unsigned => 1 },
    is_foreign_key => 1,
    is_nullable    => 0,
  },
  "InspectionNumber",
  {
    accessor => "inspection_number",
    data_type => "varchar",
    is_nullable => 0,
    size => 10,
  },
  "DateInspection",
  {
    accessor => "date_inspection",
    data_type => "datetime",
    datetime_undef_if_invalid => 1,
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
  },
  "Status",
  {
    accessor      => "status",
    data_type     => "enum",
    default_value => "Other",
    extra         => { list => ["Passed", "Failed", "Postponed", "Other"] },
    is_nullable   => 0,
  },
  "Remarks",
  { accessor => "remarks", data_type => "text", is_nullable => 1 },
  "Brakes",
  {
    accessor      => "brakes",
    data_type     => "enum",
    default_value => "NA",
    extra         => { list => ["NA", "OK", "REPAIR"] },
    is_nullable   => 0,
  },
  "BrakesAdjustment",
  {
    accessor    => "brakes_adjustment",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "BrakesMechanicalComponent",
  {
    accessor    => "brakes_mechanical_component",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "BrakesDrumRotor",
  {
    accessor    => "brakes_drum_rotor",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "BrakesHoseTubing",
  {
    accessor    => "brakes_hose_tubing",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "BrakesLining",
  {
    accessor    => "brakes_lining",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "BrakesAntilockSystem",
  {
    accessor    => "brakes_antilock_system",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "BrakesAutomaticAdjusters",
  {
    accessor    => "brakes_automatic_adjusters",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "BrakesLowAirWarning",
  {
    accessor    => "brakes_low_air_warning",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "BrakesTrailerAirSupply",
  {
    accessor    => "brakes_trailer_air_supply",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "BrakesCompressor",
  {
    accessor    => "brakes_compressor",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "BrakesParkingBrakes",
  {
    accessor    => "brakes_parking_brakes",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "BrakesOther",
  {
    accessor    => "brakes_other",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "Couplers",
  {
    accessor    => "couplers",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "CouplersFifthWheelMount",
  {
    accessor    => "couplers_fifth_wheel_mount",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "CouplersPinUpperPlate",
  {
    accessor    => "couplers_pin_upper_plate",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "CouplersPintleHookEye",
  {
    accessor    => "couplers_pintle_hook_eye",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "CouplersSafetyChains",
  {
    accessor    => "couplers_safety_chains",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "Exhaust",
  {
    accessor    => "exhaust",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "ExhaustLeaks",
  {
    accessor    => "exhaust_leaks",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "ExhaustPlacement",
  {
    accessor    => "exhaust_placement",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "Lighting",
  {
    accessor    => "lighting",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "LightingHeadlights",
  {
    accessor    => "lighting_headlights",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "LightingTailStop",
  {
    accessor    => "lighting_tail_stop",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "LightingClearanceMarker",
  {
    accessor    => "lighting_clearance_marker",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "LightingIdentification",
  {
    accessor    => "lighting_identification",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "LightingReflectors",
  {
    accessor    => "lighting_reflectors",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "LightingOther",
  {
    accessor    => "lighting_other",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "CabBody",
  {
    accessor    => "cab_body",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "CabBodyAccess",
  {
    accessor    => "cab_body_access",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "CabBodyEqptLoadSecure",
  {
    accessor    => "cab_body_eqpt_load_secure",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "CabBodyTieDowns",
  {
    accessor    => "cab_body_tie_downs",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "CabBodyHeaderboard",
  {
    accessor    => "cab_body_headerboard",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "CabBodyMotorcoachSeats",
  {
    accessor    => "cab_body_motorcoach_seats",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "CabBodyOther",
  {
    accessor    => "cab_body_other",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "Steering",
  {
    accessor    => "steering",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "SteeringAdjustment",
  {
    accessor    => "steering_adjustment",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "SteeringColumnGear",
  {
    accessor    => "steering_column_gear",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "SteeringAxle",
  {
    accessor    => "steering_axle",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "SteeringLinkage",
  {
    accessor    => "steering_linkage",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "SteeringPowerSteering",
  {
    accessor    => "steering_power_steering",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "SteeringOther",
  {
    accessor    => "steering_other",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "FuelSystem",
  {
    accessor    => "fuel_system",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "FuelSystemTanks",
  {
    accessor    => "fuel_system_tanks",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "FuelSystemLines",
  {
    accessor    => "fuel_system_lines",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "Suspension",
  {
    accessor    => "suspension",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "SuspensionSprings",
  {
    accessor    => "suspension_springs",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "SuspensionAttachments",
  {
    accessor    => "suspension_attachments",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "SuspensionSliders",
  {
    accessor    => "suspension_sliders",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "Mirrors",
  {
    accessor    => "mirrors",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "Frame",
  {
    accessor    => "frame",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "FrameMembers",
  {
    accessor    => "frame_members",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "FrameClearance",
  {
    accessor    => "frame_clearance",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "Tires",
  {
    accessor    => "tires",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "TiresTread",
  {
    accessor    => "tires_tread",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "TiresInflation",
  {
    accessor    => "tires_inflation",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "TiresDamage",
  {
    accessor    => "tires_damage",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "TiresSpeedRestrictions",
  {
    accessor    => "tires_speed_restrictions",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "TiresOther",
  {
    accessor    => "tires_other",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "WheelsRim",
  {
    accessor    => "wheels_rim",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "WheelsRimFasteners",
  {
    accessor    => "wheels_rim_fasteners",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "WheelsRimDiskSpoke",
  {
    accessor    => "wheels_rim_disk_spoke",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "Windshield",
  {
    accessor    => "windshield",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "WindshieldWipers",
  {
    accessor    => "windshield_wipers",
    data_type   => "enum",
    extra       => { list => ["NA", "OK", "REPAIR"] },
    is_nullable => 0,
  },
  "Mileage",
  { accessor => "mileage", data_type => "varchar", is_nullable => 1, size => 12 },
);

=head1 RELATIONS

=head2 inspection

Type: belongs_to

Related object: L<TMS::Schema::Result::SftInspectionSchedule>

=cut

__PACKAGE__->belongs_to(
  "inspection",
  "TMS::Schema::Result::SftInspectionSchedule",
  { InspectionScheduleId => "InspectionId" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);

=head2 inspector

Type: belongs_to

Related object: L<TMS::Schema::Result::EntPerson>

=cut

__PACKAGE__->belongs_to(
  "inspector",
  "TMS::Schema::Result::EntPerson",
  { PrsnId => "InspectorId" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);

=head2 inspector_signature

Type: belongs_to

Related object: L<TMS::Schema::Result::GenFile>

=cut

__PACKAGE__->belongs_to(
  "inspector_signature",
  "TMS::Schema::Result::GenFile",
  { FileId => "InspectorSignatureId" },
  { is_deferrable => 1, on_delete => "RESTRICT", on_update => "CASCADE" },
);

=head2 location_of_records

Type: belongs_to

Related object: L<TMS::Schema::Result::CntAddress>

=cut

__PACKAGE__->belongs_to(
  "location_of_records",
  "TMS::Schema::Result::CntAddress",
  { AddrId => "LocationOfRecords" },
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


# Created by DBIx::Class::Schema::Loader v0.07049 @ 2019-08-05 10:27:47
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:1JzIKAyIkrphamuwJjB/VA


# You can replace this text with custom code or comments, and it will be preserved on regeneration

__PACKAGE__->resultset_class('DBIx::Class::ResultSet::HashRef');
1;