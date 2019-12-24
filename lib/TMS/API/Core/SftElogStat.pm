package TMS::API::Core::SftElogStat;

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

has 'Acquired'     => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'Bearings'     => ('is' => 'rw', 'isa' => 'Float',            'required' => '0');
has 'EngineHours'  => ('is' => 'rw', 'isa' => 'Float',            'required' => '0');
has 'Fuel'         => ('is' => 'rw', 'isa' => 'Float',            'required' => '0');
has 'GpsReqId'     => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'required' => '0');
has 'Odometer'     => ('is' => 'rw', 'isa' => 'Float',            'required' => '0');
has 'Posted'       => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'Speed'        => ('is' => 'rw', 'isa' => 'Float',            'required' => '0');
has 'VehicleState' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

# relations
has 'equipment'       => ('is' => 'rw', 'isa' => 'ObjInvEquipment',     'required' => '0');
has 'sft_log_entries' => ('is' => 'rw', 'isa' => 'ArrayObjSftLogEntry', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'SftElogStat');

1;
