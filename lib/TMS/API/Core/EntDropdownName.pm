package TMS::API::Core::EntDropdownName;

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

has 'Id'      => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '1', 'default' => '0');
has 'Name'    => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'WhatAmI' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1', 'default' => '');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'EntDropdownName');

1;
