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

extends 'TMS::SchemaWrapper';
with 'MooseX::Traits';

has 'NodeId'   => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '0');
has 'ParentId' => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '0');
has 'Type'     => ('is' => 'rw', 'isa' => 'Any',           'required' => '1', 'default' => 'Other');

# relations
has 'biz_company_nodes'             => ('is' => 'rw', 'isa' => 'ArrayObjBizCompanyNode', 'required' => '0');
has 'biz_company_trees_ancestors'   => ('is' => 'rw', 'isa' => 'ArrayObjBizCompanyTree', 'required' => '0');
has 'parent'                        => ('is' => 'rw', 'isa' => 'ObjBizCompanyNode',      'required' => '0');
has 'biz_company_trees_descendants' => ('is' => 'rw', 'isa' => 'ArrayObjBizCompanyTree', 'required' => '0');
has 'hr_associates'                 => ('is' => 'rw', 'isa' => 'ArrayObjHrAssociate',    'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'BizCompanyNode');

1;
