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

has 'AppointmentEnd'   => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '0');
has 'AppointmentNotes' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'DestinationId'    => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'coerce' => '0', 'required' => '0');
has 'Pallets'          => ('is' => 'rw', 'isa' => 'Int',              'coerce' => '0', 'required' => '0');
has 'Pieces'           => ('is' => 'rw', 'isa' => 'Int',              'coerce' => '0', 'required' => '0');
has 'StopOrder'        => ('is' => 'rw', 'isa' => 'Int',              'coerce' => '0', 'required' => '1', 'default' => '0');
has 'Weight'           => ('is' => 'rw', 'isa' => 'Float',            'coerce' => '1', 'required' => '0');

# relations
has 'load'               => ('is' => 'rw', 'isa' => 'ObjDspLoad',          'coerce' => '1', 'required' => '0');
has 'dsp_loads_tracking' => ('is' => 'rw', 'isa' => 'ObjDspLoadsTracking', 'coerce' => '1', 'required' => '0');
has 'dsp_loads_destinations_docs' =>
    ('is' => 'rw', 'isa' => 'ArrayObjDspLoadsDestinationsDoc', 'coerce' => '1', 'required' => '0');
has 'branch' => ('is' => 'rw', 'isa' => 'ObjBizBranch', 'coerce' => '1', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'DspLoadsDestination');

1;
