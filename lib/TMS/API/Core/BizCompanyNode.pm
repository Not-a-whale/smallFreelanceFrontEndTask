package TMS::API::Core::BizCompanyNode;

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

has 'NodeId'   => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '1', 'required' => '0');
has 'ParentId' => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');

# relations depends on
has 'parent' => ('is' => 'rw', 'isa' => 'ObjBizCompanyNode', 'coerce' => '1', 'required' => '0');

# relations point to us
has 'biz_company_nodes'             => ('is' => 'rw', 'isa' => 'ArrayObjBizCompanyNode', 'coerce' => '1', 'required' => '0');
has 'biz_company_trees_ancestors'   => ('is' => 'rw', 'isa' => 'ArrayObjBizCompanyTree', 'coerce' => '1', 'required' => '0');
has 'biz_company_trees_descendants' => ('is' => 'rw', 'isa' => 'ArrayObjBizCompanyTree', 'coerce' => '1', 'required' => '0');
has 'hr_associates'                 => ('is' => 'rw', 'isa' => 'ArrayObjHrAssociate',    'coerce' => '1', 'required' => '0');

# core class for Traits
has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'BizCompanyNode');

1;
