package TMS::API::Core::TskActn;

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

has 'actid' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'coerce' => '0', 'required' => '0');
has 'note'  => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');

# relations
has 'prsn'      => ('is' => 'rw', 'isa' => 'ObjEntPerson',    'coerce' => '1', 'required' => '0');
has 'tskid'     => ('is' => 'rw', 'isa' => 'ObjTskTask',      'coerce' => '1', 'required' => '0');
has 'tsk_times' => ('is' => 'rw', 'isa' => 'ArrayObjTskTime', 'coerce' => '1', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'TskActn');

1;
