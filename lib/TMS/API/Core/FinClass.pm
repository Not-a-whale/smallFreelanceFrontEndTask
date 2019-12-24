package TMS::API::Core::FinClass;

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

has 'ClassId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '0');

# relations
has 'fin_transactions' => ('is' => 'rw', 'isa' => 'ArrayObjFinTransaction', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'FinClass');

1;
