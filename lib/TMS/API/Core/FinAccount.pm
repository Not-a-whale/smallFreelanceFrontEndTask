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

extends 'TMS::SchemaWrapper';
with 'MooseX::Traits';

has 'AccountId'    => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'required' => '0');
has 'Active'       => ('is' => 'rw', 'isa' => 'BoolInt',          'required' => '1', 'default' => '1');
has 'Balance'      => ('is' => 'rw', 'isa' => 'CurrencyValue',    'required' => '1', 'default' => '0.00');
has 'Code'         => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'DateCreated'  => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'Description'  => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'ExternalName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'ParentId'     => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'UserDefined'  => ('is' => 'rw', 'isa' => 'BoolInt',          'required' => '1', 'default' => '1');
has 'Valid'        => ('is' => 'rw', 'isa' => 'BoolInt',          'required' => '1', 'default' => '1');

# relations
has 'fin_journal_entries'              => ('is' => 'rw', 'isa' => 'ArrayObjFinJournalEntry', 'required' => '0');
has 'fin_accounts_trees_descendants'   => ('is' => 'rw', 'isa' => 'ArrayObjFinAccountsTree', 'required' => '0');
has 'fin_item_template_debit_accounts' => ('is' => 'rw', 'isa' => 'ArrayObjFinItemTemplate', 'required' => '0');
has 'account_type'                     => ('is' => 'rw', 'isa' => 'ObjFinAccountType',       'required' => '0');
has 'parent'                           => ('is' => 'rw', 'isa' => 'ObjFinAccount',           'required' => '0');
has 'fin_accounts'                     => ('is' => 'rw', 'isa' => 'ArrayObjFinAccount',      'required' => '0');
has 'fin_accounts_trees_ancestors'     => ('is' => 'rw', 'isa' => 'ArrayObjFinAccountsTree', 'required' => '0');
has 'fin_item_template_credit_accounts' =>
    ('is' => 'rw', 'isa' => 'ArrayObjFinItemTemplate', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'FinAccount');

1;
