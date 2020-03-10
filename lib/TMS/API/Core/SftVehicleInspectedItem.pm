package TMS::API::Core::SftVehicleInspectedItem;

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

has 'InspectedDate' => ('is' => 'rw', 'isa' => 'DATETIME',      'coerce' => '1', 'required' => '0');
has 'InspectedId'   => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '1', 'required' => '0');
has 'InspectedItem' => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'InspectionId'  => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');

# relations depends on
has 'inspected_item' => ('is' => 'rw', 'isa' => 'ObjSftVehicleInspectItem', 'coerce' => '1', 'required' => '0');
has 'inspection'     => ('is' => 'rw', 'isa' => 'ObjSftVehicleInspection',  'coerce' => '1', 'required' => '0');

# relations point to us
has 'sft_vehicle_inspect_proofs' =>
    ('is' => 'rw', 'isa' => 'ArrayObjSftVehicleInspectProof', 'coerce' => '1', 'required' => '0');

# core class for Traits
has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'SftVehicleInspectedItem');

1;
