package TMS::API::Core::DspLoadsTracking;

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

has 'BolPodNumber'  => ('is' => 'rw', 'isa' => 'VarChar255',       'coerce' => '1', 'required' => '0');
has 'DateArrived'   => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '0');
has 'DateDeparted'  => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '0');
has 'DestinationId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'coerce' => '1', 'required' => '0');
has 'DriverId'      => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'Notes'         => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'Pallets'       => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'Pieces'        => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'ReeferTemp'    => ('is' => 'rw', 'isa' => 'CurrencyValue',    'coerce' => '1', 'required' => '0');
has 'SealNumber'    => ('is' => 'rw', 'isa' => 'VarChar255',       'coerce' => '1', 'required' => '0');
has 'Weight'        => ('is' => 'rw', 'isa' => 'Float',            'coerce' => '1', 'required' => '0');

# relations depends on
has 'destination' => ('is' => 'rw', 'isa' => 'ObjDspLoadsDestination', 'coerce' => '1', 'required' => '0');
has 'driver'      => ('is' => 'rw', 'isa' => 'ObjDrvDriver',           'coerce' => '1', 'required' => '0');

# core class for Traits
has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'DspLoadsTracking');

1;
