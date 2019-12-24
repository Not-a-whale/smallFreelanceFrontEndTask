package TMS::API::Core::FinBillingBank;

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

has 'AccountNickname' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'AccountType' => ('is' => 'rw', 'isa' => 'Any',              'required' => '1', 'default' => 'checking');
has 'Active'      => ('is' => 'rw', 'isa' => 'BoolInt',          'required' => '1', 'default' => '1');
has 'BankId'      => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'required' => '0');
has 'Notes'       => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'Purpose' => ('is' => 'rw', 'isa' => 'Any', 'required' => '1', 'default' => 'billing and payment');
has 'VoidCheck' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');

# relations
has 'institution'       => ('is' => 'rw', 'isa' => 'ObjBizBranch',           'required' => '0');
has 'billing'           => ('is' => 'rw', 'isa' => 'ObjFinBillingInfo',      'required' => '0');
has 'void_check'        => ('is' => 'rw', 'isa' => 'ObjGenFile',             'required' => '0');
has 'fin_billing_rules' => ('is' => 'rw', 'isa' => 'ArrayObjFinBillingRule', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'FinBillingBank');

1;
