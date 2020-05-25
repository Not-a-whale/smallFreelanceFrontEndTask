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
use TMS::API::Types::Columns;

extends 'TMS::SchemaWrapper';
with 'MooseX::Traits';

has 'AccountNickname' => ('is' => 'rw', 'isa' => 'VarChar255',       'coerce' => '1', 'required' => '0');
has 'BankId'          => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'coerce' => '1', 'required' => '0');
has 'BillingId'       => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'Institution'     => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'Notes'           => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'VoidCheck'       => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');

# relations depends on
has 'billing'     => ('is' => 'rw', 'isa' => 'ObjFinBillingInfo', 'coerce' => '1', 'required' => '0');
has 'institution' => ('is' => 'rw', 'isa' => 'ObjBizBranch',      'coerce' => '1', 'required' => '0');
has 'void_check'  => ('is' => 'rw', 'isa' => 'ObjGenFile',        'coerce' => '1', 'required' => '0');

# relations point to us
has 'fin_accounts'      => ('is' => 'rw', 'isa' => 'ArrayObjFinAccount',     'coerce' => '1', 'required' => '0');
has 'fin_billing_rules' => ('is' => 'rw', 'isa' => 'ArrayObjFinBillingRule', 'coerce' => '1', 'required' => '0');

# core class for Traits
has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'FinBillingBank');

1;
