package TMS::API::Core::DspLoadDispatched;

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

has 'DateDispatched' => ('is' => 'rw', 'isa' => 'DATETIME',      'coerce' => '1', 'required' => '0');
has 'LoadVsUnitId'   => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '0');

# relations
has 'load'          => ('is' => 'rw', 'isa' => 'ObjDspLoad',     'coerce' => '1', 'required' => '0');
has 'dispatched_by' => ('is' => 'rw', 'isa' => 'ObjHrAssociate', 'coerce' => '1', 'required' => '0');
has 'unit'          => ('is' => 'rw', 'isa' => 'ObjInvUnit',     'coerce' => '1', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'DspLoadDispatched');

1;
