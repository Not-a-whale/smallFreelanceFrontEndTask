package TMS::API::Core::FinAccount;

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

has 'AccountId'       => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '1', 'required' => '0');
has 'AccountTypeId'   => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'Code'            => ('is' => 'rw', 'isa' => 'VarChar12',     'coerce' => '1', 'required' => '0');
has 'DateCreated'     => ('is' => 'rw', 'isa' => 'DATETIME',      'coerce' => '1', 'required' => '0');
has 'Description'     => ('is' => 'rw', 'isa' => 'VarChar1024',   'coerce' => '1', 'required' => '0');
has 'ExternalName'    => ('is' => 'rw', 'isa' => 'VarChar255',    'coerce' => '1', 'required' => '0');
has 'ParentId'        => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'PhysicalAccount' => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');

# relations depends on
has 'account_type'     => ('is' => 'rw', 'isa' => 'ObjFinAccountType', 'coerce' => '1', 'required' => '0');
has 'parent'           => ('is' => 'rw', 'isa' => 'ObjFinAccount',     'coerce' => '1', 'required' => '0');
has 'physical_account' => ('is' => 'rw', 'isa' => 'ObjFinBillingBank', 'coerce' => '1', 'required' => '0');

# relations point to us
has 'fin_accounts'                      => ('is' => 'rw', 'isa' => 'ArrayObjFinAccount',      'coerce' => '1', 'required' => '0');
has 'fin_accounts_trees_ancestors'      => ('is' => 'rw', 'isa' => 'ArrayObjFinAccountsTree', 'coerce' => '1', 'required' => '0');
has 'fin_accounts_trees_descendants'    => ('is' => 'rw', 'isa' => 'ArrayObjFinAccountsTree', 'coerce' => '1', 'required' => '0');
has 'fin_item_template_credit_accounts' => ('is' => 'rw', 'isa' => 'ArrayObjFinItemTemplate', 'coerce' => '1', 'required' => '0');
has 'fin_item_template_debit_accounts'  => ('is' => 'rw', 'isa' => 'ArrayObjFinItemTemplate', 'coerce' => '1', 'required' => '0');
has 'fin_journal_entries'               => ('is' => 'rw', 'isa' => 'ArrayObjFinJournalEntry', 'coerce' => '1', 'required' => '0');

# core class for Traits
has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'FinAccount');

1;
