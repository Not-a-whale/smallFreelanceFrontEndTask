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

has 'BillingId'   => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'required' => '0');
has 'ContactName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'CreditHold'  => ('is' => 'rw', 'isa' => 'Any',              'required' => '0');
has 'CreditLimit' => ('is' => 'rw', 'isa' => 'CurrencyValue',    'required' => '0');
has 'DateIn'      => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'DateOut'     => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'EMail'       => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'Fax'         => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'Notes'       => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

# relations
has 'entity'            => ('is' => 'rw', 'isa' => 'ObjEntity',              'required' => '0');
has 'phone'             => ('is' => 'rw', 'isa' => 'ObjCntPhonesfax',        'required' => '0');
has 'fin_billing_banks' => ('is' => 'rw', 'isa' => 'ArrayObjFinBillingBank', 'required' => '0');
has 'address'           => ('is' => 'rw', 'isa' => 'ObjCntAddress',          'required' => '0');
has 'fax'               => ('is' => 'rw', 'isa' => 'ObjCntPhonesfax',        'required' => '0');
has 'billing_tag'       => ('is' => 'rw', 'isa' => 'ObjFinBillingTag',       'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'FinBillingInfo');

1;
