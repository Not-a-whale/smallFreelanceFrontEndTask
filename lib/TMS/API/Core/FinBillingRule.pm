package TMS::API::Core::FinBillingRule;

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

has 'Active'     => ('is' => 'rw', 'isa' => 'BoolInt',          'required' => '0');
has 'Amount'     => ('is' => 'rw', 'isa' => 'CurrencyValue',    'required' => '1', 'default' => '100.00');
has 'BillRuleId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'required' => '0');
has 'Notes'      => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'Rule'       => ('is' => 'rw', 'isa' => 'Any',              'required' => '1', 'default' => 'percentage');

# relations
has 'bank_account' => ('is' => 'rw', 'isa' => 'ObjFinBillingBank', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'FinBillingRule');

1;
