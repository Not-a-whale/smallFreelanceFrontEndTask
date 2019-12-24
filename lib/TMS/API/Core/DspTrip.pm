package TMS::API::Core::DspTrip;

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

has 'DateBooked'     => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'DateCompleted'  => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'DateCreated'    => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'DateDispatched' => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'DateStarted'    => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'GoogleRoute'    => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'IsValid'        => ('is' => 'rw', 'isa' => 'BoolInt',          'required' => '1', 'default' => '1');
has 'Notes'          => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'TripId'         => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'required' => '0');

# relations
has 'dsp_trips_loads' => ('is' => 'rw', 'isa' => 'ArrayObjDspTripsLoad', 'required' => '0');
has 'created_by'      => ('is' => 'rw', 'isa' => 'ObjHrAssociate',       'required' => '0');
has 'sft_logbooks'    => ('is' => 'rw', 'isa' => 'ArrayObjSftLogbook',   'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'DspTrip');

1;
