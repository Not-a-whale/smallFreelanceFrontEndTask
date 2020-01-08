package TMS::API::Core::SftInspectionSchedule;

use strict;
use warnings FATAL => 'all';
use Carp qw( confess longmess );
use namespace::autoclean;
use Devel::Confess;
use Data::Dumper;
use Try::Tiny;

$Data::Dumper::Terse = 1;

use Moose;
use TMS::API::Types::Simple;
use TMS::API::Types::Objects;
use TMS::API::Types::Complex;

extends 'TMS::SchemaWrapper';
with 'MooseX::Traits';

has 'InspectionScheduleId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '0');
has 'InspectionType'       => ('is' => 'rw', 'isa' => 'Any',           'coerce' => '0', 'required' => '0');
has 'VehicleId'            => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');

# relations
has 'sft_vehicle_inspections' => ('is' => 'rw', 'isa' => 'ArrayObjSftVehicleInspection', 'coerce' => '1', 'required' => '0');
has 'vehicle' => ('is' => 'rw', 'isa' => 'ObjInvVehicle', 'coerce' => '1', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'SftInspectionSchedule');

1;
