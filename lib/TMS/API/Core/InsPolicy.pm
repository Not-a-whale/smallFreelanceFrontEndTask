package TMS::API::Core::InsPolicy;

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

has 'InsId'            => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '1', 'required' => '0');
has 'InsProvider'      => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'PaidBy'           => ('is' => 'rw', 'isa' => 'enum_PaidBy',   'coerce' => '1', 'required' => '0');
has 'ProofOfInsurance' => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'WhatIsInsured'    => ('is' => 'rw', 'isa' => 'VarChar255',    'coerce' => '1', 'required' => '0');

# relations depends on
has 'ins_provider'       => ('is' => 'rw', 'isa' => 'ObjEntBusiness', 'coerce' => '1', 'required' => '0');
has 'proof_of_insurance' => ('is' => 'rw', 'isa' => 'ObjGenFile',     'coerce' => '1', 'required' => '0');

# relations point to us
has 'ins_to_entities' => ('is' => 'rw', 'isa' => 'ArrayObjInsToEntity',  'coerce' => '1', 'required' => '0');
has 'ins_to_vehicles' => ('is' => 'rw', 'isa' => 'ArrayObjInsToVehicle', 'coerce' => '1', 'required' => '0');

# core class for Traits
has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'InsPolicy');

1;
