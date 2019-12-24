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

extends 'TMS::SchemaWrapper';
with 'MooseX::Traits';

has 'DownpaymentAmount' => ('is' => 'rw', 'isa' => 'CurrencyValue',    'required' => '1', 'default' => '0.00');
has 'InsId'             => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'required' => '0');
has 'PaidBy'            => ('is' => 'rw', 'isa' => 'Any',              'required' => '0');
has 'ProofOfInsurance'  => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'WhatIsInsured'     => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

# relations
has 'ins_to_vehicles'    => ('is' => 'rw', 'isa' => 'ArrayObjInsToVehicle', 'required' => '0');
has 'ins_to_entities'    => ('is' => 'rw', 'isa' => 'ArrayObjInsToEntity',  'required' => '0');
has 'proof_of_insurance' => ('is' => 'rw', 'isa' => 'ObjGenFile',           'required' => '0');
has 'provider_agent'     => ('is' => 'rw', 'isa' => 'ObjHrAssociate',       'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'InsPolicy');

1;
