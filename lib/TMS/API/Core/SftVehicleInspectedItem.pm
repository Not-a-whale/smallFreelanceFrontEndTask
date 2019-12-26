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

extends 'TMS::SchemaWrapper';
with 'MooseX::Traits';

has 'InspectedDate' => ('is' => 'rw', 'isa' => 'DATETIME',      'coerce' => '1', 'required' => '0');
has 'InspectedId'   => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '0');

# relations
has 'inspection' => ('is' => 'rw', 'isa' => 'ObjSftVehicleInspection', 'coerce' => '1', 'required' => '0');
has 'sft_vehicle_inspect_proofs' =>
    ('is' => 'rw', 'isa' => 'ArrayObjSftVehicleInspectProof', 'coerce' => '1', 'required' => '0');
has 'inspected_item' => ('is' => 'rw', 'isa' => 'ObjSftVehicleInspectItem', 'coerce' => '1', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'SftVehicleInspectedItem');

1;
