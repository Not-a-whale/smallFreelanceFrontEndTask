package TMS::API::Core::InvUnit;

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

has 'UnitId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '0');

# relations
has 'inv_units_to_equipments' => ('is' => 'rw', 'isa' => 'ArrayObjInvUnitsToEquipment', 'coerce' => '1', 'required' => '0');
has 'dsp_loads_dispatched'    => ('is' => 'rw', 'isa' => 'ArrayObjDspLoadDispatched',   'coerce' => '1', 'required' => '0');
has 'inv_unit_reservations'   => ('is' => 'rw', 'isa' => 'ArrayObjInvUnitReservation',  'coerce' => '1', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'InvUnit');

1;
