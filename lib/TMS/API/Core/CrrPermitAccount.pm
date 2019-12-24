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

extends 'TMS::SchemaWrapper';
with 'MooseX::Traits';

has 'CrrPrmtAccId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '0');

# relations
has 'crr_permit_account_docs' => ('is' => 'rw', 'isa' => 'ArrayObjCrrPermitAccountDoc', 'required' => '0');
has 'crr_state_permits'       => ('is' => 'rw', 'isa' => 'ArrayObjCrrStatePermit',      'required' => '0');
has 'carrier'                 => ('is' => 'rw', 'isa' => 'ObjEntCarrier',               'required' => '0');

has '_dbix_class' =>
    (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'CrrPermitAccount');

1;
