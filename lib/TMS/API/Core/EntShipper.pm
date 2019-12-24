package TMS::API::Core::EntShipper;

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

has 'Notes' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

# relations
has 'shipper'   => ('is' => 'rw', 'isa' => 'ObjEntBusiness',  'required' => '0');
has 'dsp_loads' => ('is' => 'rw', 'isa' => 'ArrayObjDspLoad', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'EntShipper');

1;
