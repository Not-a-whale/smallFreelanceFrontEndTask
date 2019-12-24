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

extends 'TMS::SchemaWrapper';
with 'MooseX::Traits';

has 'completed' => ('is' => 'rw', 'isa' => 'DATETIME',      'required' => '0');
has 'created'   => ('is' => 'rw', 'isa' => 'DATETIME',      'required' => '0');
has 'duedate'   => ('is' => 'rw', 'isa' => 'DATETIME',      'required' => '0');
has 'estimated' => ('is' => 'rw', 'isa' => 'Int',           'required' => '0');
has 'priority'  => ('is' => 'rw', 'isa' => 'Int',           'required' => '0', 'default' => '0');
has 'prjid'     => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '0');
has 'severity'  => ('is' => 'rw', 'isa' => 'Int',           'required' => '0', 'default' => '0');
has 'startdate' => ('is' => 'rw', 'isa' => 'DATETIME',      'required' => '0');
has 'tskid'     => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '0');

# relations
has 'prsn'                  => ('is' => 'rw', 'isa' => 'ObjEntPerson',    'required' => '0');
has 'tsk_actns'             => ('is' => 'rw', 'isa' => 'ArrayObjTskActn', 'required' => '0');
has 'tsk_tasks'             => ('is' => 'rw', 'isa' => 'ArrayObjTskTask', 'required' => '0');
has 'tsk_resps'             => ('is' => 'rw', 'isa' => 'ArrayObjTskResp', 'required' => '0');
has 'prjid'                 => ('is' => 'rw', 'isa' => 'ObjTskTask',      'required' => '0');
has 'tsk_trees_ancestors'   => ('is' => 'rw', 'isa' => 'ArrayObjTskTree', 'required' => '0');
has 'tsk_alrms'             => ('is' => 'rw', 'isa' => 'ArrayObjTskAlrm', 'required' => '0');
has 'tsk_trees_descendants' => ('is' => 'rw', 'isa' => 'ArrayObjTskTree', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'TskTask');

1;
