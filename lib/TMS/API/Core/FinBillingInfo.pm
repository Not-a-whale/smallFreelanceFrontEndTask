package TMS::API::Core::FinBillingInfo;

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

has 'BillingId'   => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'coerce' => '0', 'required' => '0');
has 'ContactName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'CreditHold'  => ('is' => 'rw', 'isa' => 'Any',              'coerce' => '0', 'required' => '0');
has 'CreditLimit' => ('is' => 'rw', 'isa' => 'CurrencyValue',    'coerce' => '1', 'required' => '0');
has 'DateIn'      => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '0');
has 'DateOut'     => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '0');
has 'EMail'       => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'Fax'         => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'Notes'       => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');

# relations
has 'address'           => ('is' => 'rw', 'isa' => 'ObjCntAddress',          'coerce' => '1', 'required' => '0');
has 'entity'            => ('is' => 'rw', 'isa' => 'ObjEntity',              'coerce' => '1', 'required' => '0');
has 'phone'             => ('is' => 'rw', 'isa' => 'ObjCntPhonesfax',        'coerce' => '1', 'required' => '0');
has 'billing_tag'       => ('is' => 'rw', 'isa' => 'ObjFinBillingTag',       'coerce' => '1', 'required' => '0');
has 'fin_billing_banks' => ('is' => 'rw', 'isa' => 'ArrayObjFinBillingBank', 'coerce' => '1', 'required' => '0');
has 'fax'               => ('is' => 'rw', 'isa' => 'ObjCntPhonesfax',        'coerce' => '1', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'FinBillingInfo');

1;
