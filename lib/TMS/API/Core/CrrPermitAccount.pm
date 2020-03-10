package TMS::API::Core::CrrPermitAccount;

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

has 'CarrierId'    => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'CrrPrmtAccId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '1', 'required' => '0');

# relations depends on
has 'carrier' => ('is' => 'rw', 'isa' => 'ObjEntCarrier', 'coerce' => '1', 'required' => '0');

# relations point to us
has 'crr_permit_account_docs' => ('is' => 'rw', 'isa' => 'ArrayObjCrrPermitAccountDoc', 'coerce' => '1', 'required' => '0');
has 'crr_state_permits'       => ('is' => 'rw', 'isa' => 'ArrayObjCrrStatePermit',      'coerce' => '1', 'required' => '0');

# core class for Traits
has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'CrrPermitAccount');

1;
