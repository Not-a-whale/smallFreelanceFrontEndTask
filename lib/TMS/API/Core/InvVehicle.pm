package TMS::API::Core::InvVehicle;

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
use TMS::API::Types::Columns;

extends 'TMS::SchemaWrapper';
with 'MooseX::Traits';

has 'Axels'         => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'CarrierId'     => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'Color'         => ('is' => 'rw', 'isa' => 'VarChar24',     'coerce' => '1', 'required' => '0');
has 'Height'        => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'Length'        => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'Make'          => ('is' => 'rw', 'isa' => 'VarChar24',     'coerce' => '1', 'required' => '0');
has 'Model'         => ('is' => 'rw', 'isa' => 'VarChar24',     'coerce' => '1', 'required' => '0');
has 'TireSize'      => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'UnladenWeight' => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'VehicleId'     => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '1', 'required' => '0');
has 'Width'         => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'Year'          => ('is' => 'rw', 'isa' => 'Year',          'coerce' => '1', 'required' => '0');

# relations depends on
has 'carrier'   => ('is' => 'rw', 'isa' => 'ObjEntCarrier',   'coerce' => '1', 'required' => '0');
has 'tire_size' => ('is' => 'rw', 'isa' => 'ObjInvTiresize',  'coerce' => '1', 'required' => '0');
has 'vehicle'   => ('is' => 'rw', 'isa' => 'ObjInvEquipment', 'coerce' => '1', 'required' => '0');

# relations point to us
has 'crr_ifta_decals'           => ('is' => 'rw', 'isa' => 'ArrayObjCrrIftaDecal',           'coerce' => '1', 'required' => '0');
has 'crr_state_permits'         => ('is' => 'rw', 'isa' => 'ArrayObjCrrStatePermit',         'coerce' => '1', 'required' => '0');
has 'ins_to_vehicles'           => ('is' => 'rw', 'isa' => 'ArrayObjInsToVehicle',           'coerce' => '1', 'required' => '0');
has 'inv_semitruck'             => ('is' => 'rw', 'isa' => 'ObjInvSemitruck',                'coerce' => '1', 'required' => '0');
has 'inv_sprinter'              => ('is' => 'rw', 'isa' => 'ObjInvSprinter',                 'coerce' => '1', 'required' => '0');
has 'inv_trailer'               => ('is' => 'rw', 'isa' => 'ObjInvTrailer',                  'coerce' => '1', 'required' => '0');
has 'sft_inspection_schedules'  => ('is' => 'rw', 'isa' => 'ArrayObjSftInspectionSchedule',  'coerce' => '1', 'required' => '0');
has 'sft_vehicle_registrations' => ('is' => 'rw', 'isa' => 'ArrayObjSftVehicleRegistration', 'coerce' => '1', 'required' => '0');

# core class for Traits
has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'InvVehicle');

1;
