package TMS::API::Core::TmpRelationsNode;

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

has 'Name'      => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'ParentId'  => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'RelNodeId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'required' => '0');

# relations
has 'tmp_relations_clsr_descendants' => ('is' => 'rw', 'isa' => 'ArrayObjTmpRelationsClsr', 'required' => '0');
has 'parent'                         => ('is' => 'rw', 'isa' => 'ObjTmpRelationsNode',      'required' => '0');
has 'tmp_relations_clsr_ancestors'   => ('is' => 'rw', 'isa' => 'ArrayObjTmpRelationsClsr', 'required' => '0');
has 'tmp_relations_nodes'            => ('is' => 'rw', 'isa' => 'ArrayObjTmpRelationsNode', 'required' => '0');

has '_dbix_class' =>
    (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'TmpRelationsNode');

1;
