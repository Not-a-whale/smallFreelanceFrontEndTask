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

extends 'TMS::SchemaWrapper';
with 'MooseX::Traits';

has 'BolPodNumber' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'DateArrived'  => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '0');
has 'DateDeparted' => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '0');
has 'Notes'        => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'Pallets'      => ('is' => 'rw', 'isa' => 'Int',              'coerce' => '0', 'required' => '0');
has 'Pieces'       => ('is' => 'rw', 'isa' => 'Int',              'coerce' => '0', 'required' => '0');
has 'ReeferTemp'   => ('is' => 'rw', 'isa' => 'CurrencyValue',    'coerce' => '1', 'required' => '0');
has 'SealNumber'   => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'Weight'       => ('is' => 'rw', 'isa' => 'Float',            'coerce' => '1', 'required' => '0');

# relations
has 'destination' => ('is' => 'rw', 'isa' => 'ObjDspLoadsDestination', 'coerce' => '1', 'required' => '0');
has 'driver'      => ('is' => 'rw', 'isa' => 'ObjDrvDriver',           'coerce' => '1', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'DspLoadsTracking');

1;
