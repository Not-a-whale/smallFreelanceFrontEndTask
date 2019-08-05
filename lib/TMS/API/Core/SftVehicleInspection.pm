package TMS::API::Core::SftVehicleInspection;

# $Id: $
use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use namespace::autoclean;
use Devel::Confess;
use Data::Dumper;
use Try::Tiny;

use Moose;

# AUTO-GENERATED DEPENDENCIES START
use TMS::API::Core::CntAddress;
use TMS::API::Core::EntPerson;
use TMS::API::Core::InvVehicle;
use TMS::API::Core::SftInspectionSchedule;
use TMS::API::Core::GenFile;

# AUTO-GENERATED DEPENDENCIES END

use TMS::SchemaWrapper;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Columns;
use MooseX::Types::Moose qw(Undef);

extends 'TMS::SchemaWrapper';

# AUTO-GENERATED HAS-A START
has InspectionId              => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'SftInspectionScheduleObj',);
has VehicleId                 => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'InvVehicleObj',);
has InspectorId               => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'EntPersonObj',);
has InspectorSignatureId      => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'GenFileObj',);
has LocationOfRecords         => (is => 'rw', coerce => 1, required => 1, isa => Undef | 'CntAddressObj',);
has InspectionNumber          => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'Str',);
has DateInspection            => (is => 'rw', coerce => 1, required => 0, isa => Undef | 'DATETIME',);
has Status                    => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'EnumPassed',);
has Remarks                   => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);
has Brakes                    => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'EnumNa',);
has BrakesAdjustment          => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has BrakesMechanicalComponent => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has BrakesDrumRotor           => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has BrakesHoseTubing          => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has BrakesLining              => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has BrakesAntilockSystem      => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has BrakesAutomaticAdjusters  => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has BrakesLowAirWarning       => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has BrakesTrailerAirSupply    => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has BrakesCompressor          => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has BrakesParkingBrakes       => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has BrakesOther               => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has Couplers                  => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has CouplersFifthWheelMount   => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has CouplersPinUpperPlate     => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has CouplersPintleHookEye     => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has CouplersSafetyChains      => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has Exhaust                   => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has ExhaustLeaks              => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has ExhaustPlacement          => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has Lighting                  => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has LightingHeadlights        => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has LightingTailStop          => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has LightingClearanceMarker   => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has LightingIdentification    => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has LightingReflectors        => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has LightingOther             => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has CabBody                   => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has CabBodyAccess             => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has CabBodyEqptLoadSecure     => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has CabBodyTieDowns           => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has CabBodyHeaderboard        => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has CabBodyMotorcoachSeats    => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has CabBodyOther              => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has Steering                  => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has SteeringAdjustment        => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has SteeringColumnGear        => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has SteeringAxle              => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has SteeringLinkage           => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has SteeringPowerSteering     => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has SteeringOther             => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has FuelSystem                => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has FuelSystemTanks           => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has FuelSystemLines           => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has Suspension                => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has SuspensionSprings         => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has SuspensionAttachments     => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has SuspensionSliders         => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has Mirrors                   => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has Frame                     => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has FrameMembers              => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has FrameClearance            => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has Tires                     => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has TiresTread                => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has TiresInflation            => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has TiresDamage               => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has TiresSpeedRestrictions    => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has TiresOther                => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has WheelsRim                 => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has WheelsRimFasteners        => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has WheelsRimDiskSpoke        => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has Windshield                => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has WindshieldWipers          => (is => 'rw', coerce => 0, required => 1, isa => Undef | 'EnumNa',);
has Mileage                   => (is => 'rw', coerce => 0, required => 0, isa => Undef | 'Str',);

# AUTO-GENERATED HAS-A END

1;

