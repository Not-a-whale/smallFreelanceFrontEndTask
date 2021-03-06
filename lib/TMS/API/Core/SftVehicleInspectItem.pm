package TMS::API::Core::SftVehicleInspectItem;

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

has 'InspItmId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'coerce' => '1', 'required' => '0');
has 'Notes'     => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');

# relations point to us
has 'msg_sft_vehicle_inspect_items' =>
    ('is' => 'rw', 'isa' => 'ArrayObjMsgSftVehicleInspectItem', 'coerce' => '1', 'required' => '0');
has 'sft_vehicle_inspected_items' => ('is' => 'rw', 'isa' => 'ArrayObjSftVehicleInspectedItem', 'coerce' => '1', 'required' => '0');

# core class for Traits
has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'SftVehicleInspectItem');

1;
