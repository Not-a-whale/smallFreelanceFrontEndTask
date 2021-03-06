package TMS::API::Core::TskTask;

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

has 'PrsnId'    => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'completed' => ('is' => 'rw', 'isa' => 'DATETIME',      'coerce' => '1', 'required' => '0');
has 'created'   => ('is' => 'rw', 'isa' => 'DATETIME',      'coerce' => '1', 'required' => '0');
has 'duedate'   => ('is' => 'rw', 'isa' => 'DATETIME',      'coerce' => '1', 'required' => '0');
has 'estimated' => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'prjid'     => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'startdate' => ('is' => 'rw', 'isa' => 'DATETIME',      'coerce' => '1', 'required' => '0');
has 'tskid'     => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '1', 'required' => '0');

# relations depends on
has 'prjid' => ('is' => 'rw', 'isa' => 'ObjTskTask',   'coerce' => '1', 'required' => '0');
has 'prsn'  => ('is' => 'rw', 'isa' => 'ObjEntPerson', 'coerce' => '1', 'required' => '0');

# relations point to us
has 'tsk_actns'             => ('is' => 'rw', 'isa' => 'ArrayObjTskActn', 'coerce' => '1', 'required' => '0');
has 'tsk_alrms'             => ('is' => 'rw', 'isa' => 'ArrayObjTskAlrm', 'coerce' => '1', 'required' => '0');
has 'tsk_resps'             => ('is' => 'rw', 'isa' => 'ArrayObjTskResp', 'coerce' => '1', 'required' => '0');
has 'tsk_tasks'             => ('is' => 'rw', 'isa' => 'ArrayObjTskTask', 'coerce' => '1', 'required' => '0');
has 'tsk_trees_ancestors'   => ('is' => 'rw', 'isa' => 'ArrayObjTskTree', 'coerce' => '1', 'required' => '0');
has 'tsk_trees_descendants' => ('is' => 'rw', 'isa' => 'ArrayObjTskTree', 'coerce' => '1', 'required' => '0');

# core class for Traits
has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'TskTask');

1;
