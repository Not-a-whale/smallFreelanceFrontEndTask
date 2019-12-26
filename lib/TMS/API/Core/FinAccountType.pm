package TMS::API::Core::FinAccountType;

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

has 'AccountTypeId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '0');
has 'DisplayOrder'  => ('is' => 'rw', 'isa' => 'Int',           'coerce' => '0', 'required' => '0');
has 'ParentId'      => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');

# relations
has 'fin_account_types' => ('is' => 'rw', 'isa' => 'ArrayObjFinAccountType', 'coerce' => '1', 'required' => '0');
has 'fin_accounts'      => ('is' => 'rw', 'isa' => 'ArrayObjFinAccount',     'coerce' => '1', 'required' => '0');
has 'parent'            => ('is' => 'rw', 'isa' => 'ObjFinAccountType',      'coerce' => '1', 'required' => '0');
has 'fin_account_types_trees_ancestors' =>
    ('is' => 'rw', 'isa' => 'ArrayObjFinAccountTypesTree', 'coerce' => '1', 'required' => '0');
has 'fin_account_types_trees_descendants' =>
    ('is' => 'rw', 'isa' => 'ArrayObjFinAccountTypesTree', 'coerce' => '1', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'FinAccountType');

1;
