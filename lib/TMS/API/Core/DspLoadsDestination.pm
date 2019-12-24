package TMS::API::Core::DspLoadsDestination;

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

has 'AppointmentEnd'   => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'AppointmentNotes' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'DestinationId'    => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'required' => '0');
has 'Pallets'          => ('is' => 'rw', 'isa' => 'Int',              'required' => '0');
has 'Pieces'           => ('is' => 'rw', 'isa' => 'Int',              'required' => '0');
has 'StopOrder'        => ('is' => 'rw', 'isa' => 'Int',              'required' => '1', 'default' => '0');
has 'Weight'           => ('is' => 'rw', 'isa' => 'Float',            'required' => '0');

# relations
has 'load'               => ('is' => 'rw', 'isa' => 'ObjDspLoad',          'required' => '0');
has 'dsp_loads_tracking' => ('is' => 'rw', 'isa' => 'ObjDspLoadsTracking', 'required' => '0');
has 'branch'             => ('is' => 'rw', 'isa' => 'ObjBizBranch',        'required' => '0');
has 'dsp_loads_destinations_docs' =>
    ('is' => 'rw', 'isa' => 'ArrayObjDspLoadsDestinationsDoc', 'required' => '0');

has '_dbix_class' =>
    (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'DspLoadsDestination');

1;
