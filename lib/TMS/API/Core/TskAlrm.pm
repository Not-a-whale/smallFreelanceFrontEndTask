package TMS::API::Core::TskAlrm;

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

has 'alrmid'  => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '1', 'required' => '0');
has 'tskid'   => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'turnoff' => ('is' => 'rw', 'isa' => 'DATETIME',      'coerce' => '1', 'required' => '0');

# relations depends on
has 'tskid' => ('is' => 'rw', 'isa' => 'ObjTskTask', 'coerce' => '1', 'required' => '0');

# relations point to us
has 'tsk_ntfis' => ('is' => 'rw', 'isa' => 'ArrayObjTskNtfi', 'coerce' => '1', 'required' => '0');

# core class for Traits
has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'TskAlrm');

1;
