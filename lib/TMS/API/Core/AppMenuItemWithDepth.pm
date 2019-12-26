package TMS::API::Core::AppMenuItemWithDepth;

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

has 'Depth'      => ('is' => 'rw', 'isa' => 'Int',              'coerce' => '0', 'required' => '0');
has 'Enabled'    => ('is' => 'rw', 'isa' => 'BoolInt',          'coerce' => '1', 'required' => '0', 'default' => '1');
has 'Help'       => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'Icon'       => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'MenuItemId' => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '1', 'default' => '0');
has 'ParentId'   => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'Path'       => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'Route' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1', 'default' => 'tms.app.error');
has 'SortIndex' => ('is' => 'rw', 'isa' => 'CurrencyValue',    'coerce' => '1', 'required' => '0', 'default' => '0.000');
has 'Title'     => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'AppMenuItemWithDepth');

1;
