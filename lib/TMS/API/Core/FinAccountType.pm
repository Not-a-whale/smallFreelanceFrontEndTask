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
has 'BalanceSheet'  => ('is' => 'rw', 'isa' => 'BoolInt',       'coerce' => '1', 'required' => '1', 'default' => '1');
has 'Credit'        => ('is' => 'rw', 'isa' => 'CurrencyValue', 'coerce' => '1', 'required' => '1', 'default' => '-1.00');
has 'Debit'         => ('is' => 'rw', 'isa' => 'CurrencyValue', 'coerce' => '1', 'required' => '1', 'default' => '1.00');
has 'DisplayOrder'  => ('is' => 'rw', 'isa' => 'Int',           'coerce' => '0', 'required' => '0');
has 'Editable'      => ('is' => 'rw', 'isa' => 'BoolInt',       'coerce' => '1', 'required' => '0', 'default' => '1');
has 'IncomeSheet'   => ('is' => 'rw', 'isa' => 'BoolInt',       'coerce' => '1', 'required' => '1', 'default' => '0');
has 'ParentId'      => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'Temp'          => ('is' => 'rw', 'isa' => 'BoolInt',       'coerce' => '1', 'required' => '0', 'default' => '0');
has 'UserDefined'   => ('is' => 'rw', 'isa' => 'BoolInt',       'coerce' => '1', 'required' => '0', 'default' => '1');
has 'Valid'         => ('is' => 'rw', 'isa' => 'BoolInt',       'coerce' => '1', 'required' => '1', 'default' => '0');

# relations
has 'fin_accounts' => ('is' => 'rw', 'isa' => 'ArrayObjFinAccount', 'coerce' => '1', 'required' => '0');
has 'fin_account_types_trees_descendants' =>
    ('is' => 'rw', 'isa' => 'ArrayObjFinAccountTypesTree', 'coerce' => '1', 'required' => '0');
has 'fin_account_types' => ('is' => 'rw', 'isa' => 'ArrayObjFinAccountType', 'coerce' => '1', 'required' => '0');
has 'fin_account_types_trees_ancestors' =>
    ('is' => 'rw', 'isa' => 'ArrayObjFinAccountTypesTree', 'coerce' => '1', 'required' => '0');
has 'parent' => ('is' => 'rw', 'isa' => 'ObjFinAccountType', 'coerce' => '1', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'FinAccountType');

1;
