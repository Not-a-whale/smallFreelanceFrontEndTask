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

extends 'TMS::SchemaWrapper';
with 'MooseX::Traits';

has 'Axels'         => ('is' => 'rw', 'isa' => 'Int',              'required' => '0');
has 'Color'         => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'Fuel'          => ('is' => 'rw', 'isa' => 'Any',              'required' => '1', 'default' => 'none');
has 'Height'        => ('is' => 'rw', 'isa' => 'Int',              'required' => '0');
has 'Length'        => ('is' => 'rw', 'isa' => 'Int',              'required' => '0');
has 'Make'          => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'Model'         => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'TireSize'      => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'UnladenWeight' => ('is' => 'rw', 'isa' => 'Int',              'required' => '0');
has 'Width'         => ('is' => 'rw', 'isa' => 'Int',              'required' => '0');
has 'Year'          => ('is' => 'rw', 'isa' => 'Any',              'required' => '0');

# relations
has 'vehicle'                   => ('is' => 'rw', 'isa' => 'ObjInvEquipment',                'required' => '0');
has 'ins_to_vehicles'           => ('is' => 'rw', 'isa' => 'ArrayObjInsToVehicle',           'required' => '0');
has 'inv_trailer'               => ('is' => 'rw', 'isa' => 'ObjInvTrailer',                  'required' => '0');
has 'sft_vehicle_registrations' => ('is' => 'rw', 'isa' => 'ArrayObjSftVehicleRegistration', 'required' => '0');
has 'sft_inspection_schedules'  => ('is' => 'rw', 'isa' => 'ArrayObjSftInspectionSchedule',  'required' => '0');
has 'crr_state_permits'         => ('is' => 'rw', 'isa' => 'ArrayObjCrrStatePermit',         'required' => '0');
has 'crr_ifta_decals'           => ('is' => 'rw', 'isa' => 'ArrayObjCrrIftaDecal',           'required' => '0');
has 'inv_semitruck'             => ('is' => 'rw', 'isa' => 'ObjInvSemitruck',                'required' => '0');
has 'carrier'                   => ('is' => 'rw', 'isa' => 'ObjEntCarrier',                  'required' => '0');
has 'inv_sprinter'              => ('is' => 'rw', 'isa' => 'ObjInvSprinter',                 'required' => '0');
has 'tire_size'                 => ('is' => 'rw', 'isa' => 'ObjInvTiresize',                 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'InvVehicle');

1;
