package TMS::API::Core::SftVehicleInspectProof;

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

has 'FileRef'         => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'InspectImageId'  => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'coerce' => '1', 'required' => '0');
has 'InspectedItemId' => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'Notes'           => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');

# relations depends on
has 'file_ref' => ('is' => 'rw', 'isa' => 'ObjGenFile', 'coerce' => '1', 'required' => '0');
has 'inspected_item' => ('is' => 'rw', 'isa' => 'ObjSftVehicleInspectedItem', 'coerce' => '1', 'required' => '0');

# relations point to us
has 'msg_sft_vehicle_inspect_proofs' =>
    ('is' => 'rw', 'isa' => 'ArrayObjMsgSftVehicleInspectProof', 'coerce' => '1', 'required' => '0');

# core class for Traits
has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'SftVehicleInspectProof');

1;
