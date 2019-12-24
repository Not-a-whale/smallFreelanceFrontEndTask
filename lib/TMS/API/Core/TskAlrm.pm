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

extends 'TMS::SchemaWrapper';
with 'MooseX::Traits';

has 'alrmid'   => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '0');
has 'periodic' => ('is' => 'rw', 'isa' => 'Any',           'required' => '1', 'default' => 'no');
has 'repeat'   => ('is' => 'rw', 'isa' => 'Int',           'required' => '1', 'default' => '0');
has 'turnoff'  => ('is' => 'rw', 'isa' => 'DATETIME',      'required' => '0');

# relations
has 'tskid'     => ('is' => 'rw', 'isa' => 'ObjTskTask',      'required' => '0');
has 'tsk_ntfis' => ('is' => 'rw', 'isa' => 'ArrayObjTskNtfi', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'TskAlrm');

1;
