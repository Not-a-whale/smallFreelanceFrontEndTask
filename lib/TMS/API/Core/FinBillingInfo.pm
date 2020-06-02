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
use TMS::API::Types::Columns;

extends 'TMS::SchemaWrapper';
with 'MooseX::Traits';

has 'Address'      => ('is' => 'rw', 'isa' => 'PositiveInt',       'coerce' => '1', 'required' => '0');
has 'BillingId'    => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',     'coerce' => '1', 'required' => '0');
has 'BillingTagId' => ('is' => 'rw', 'isa' => 'PositiveInt',       'coerce' => '1', 'required' => '0');
has 'ContactName'  => ('is' => 'rw', 'isa' => 'VarChar255',        'coerce' => '1', 'required' => '0');
has 'CreditHold'   => ('is' => 'rw', 'isa' => 'enum_TeamRequired', 'coerce' => '1', 'required' => '0');
has 'CreditLimit'  => ('is' => 'rw', 'isa' => 'CurrencyValue',     'coerce' => '1', 'required' => '0');
has 'DateIn'       => ('is' => 'rw', 'isa' => 'DATETIME',          'coerce' => '1', 'required' => '0');
has 'DateOut'      => ('is' => 'rw', 'isa' => 'DATETIME',          'coerce' => '1', 'required' => '0');
has 'EMail'        => ('is' => 'rw', 'isa' => 'VarChar255',        'coerce' => '1', 'required' => '0');
has 'EntityId'     => ('is' => 'rw', 'isa' => 'PositiveInt',       'coerce' => '1', 'required' => '0');
has 'Fax'          => ('is' => 'rw', 'isa' => 'PositiveInt',       'coerce' => '1', 'required' => '0');
has 'Notes'        => ('is' => 'rw', 'isa' => 'TidySpacesString',  'coerce' => '1', 'required' => '0');
has 'Phone'        => ('is' => 'rw', 'isa' => 'PositiveInt',       'coerce' => '1', 'required' => '0');

# relations depends on
has 'address'     => ('is' => 'rw', 'isa' => 'ObjCntAddress',    'coerce' => '1', 'required' => '0');
has 'billing_tag' => ('is' => 'rw', 'isa' => 'ObjFinBillingTag', 'coerce' => '1', 'required' => '0');
has 'entity'      => ('is' => 'rw', 'isa' => 'ObjEntity',        'coerce' => '1', 'required' => '0');
has 'fax'         => ('is' => 'rw', 'isa' => 'ObjCntPhonesfax',  'coerce' => '1', 'required' => '0');
has 'phone'       => ('is' => 'rw', 'isa' => 'ObjCntPhonesfax',  'coerce' => '1', 'required' => '0');

# relations point to us
has 'fin_billing_banks'     => ('is' => 'rw', 'isa' => 'ArrayObjFinBillingBank',    'coerce' => '1', 'required' => '0');
has 'msg_fin_billing_infos' => ('is' => 'rw', 'isa' => 'ArrayObjMsgFinBillingInfo', 'coerce' => '1', 'required' => '0');

# core class for Traits
has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'FinBillingInfo');

1;
