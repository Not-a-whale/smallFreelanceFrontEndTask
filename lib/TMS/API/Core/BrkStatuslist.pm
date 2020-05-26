package TMS::API::Core::BrkStatuslist;

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

has 'StatListId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '1', 'required' => '0');
has 'StatusName' => ('is' => 'rw', 'isa' => 'VarChar255',    'coerce' => '1', 'required' => '0');

# relations point to us
has 'brk_loadstatuses' => ('is' => 'rw', 'isa' => 'ArrayObjBrkLoadstatus', 'coerce' => '1', 'required' => '0');

# core class for Traits
has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'BrkStatuslist');

1;