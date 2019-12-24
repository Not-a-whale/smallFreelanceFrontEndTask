package TMS::API::Core::SftVehicleInspection;

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

has 'DateInspection' => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'InspectionId'   => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'required' => '0');
has 'Mileage'        => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'Remarks'        => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'Status'         => ('is' => 'rw', 'isa' => 'Any',              'required' => '1', 'default' => 'Other');

# relations
has 'inspection_schedule' => ('is' => 'rw', 'isa' => 'ObjSftInspectionSchedule', 'required' => '0');
has 'inspector_signature' => ('is' => 'rw', 'isa' => 'ObjGenFile', 'required' => '0');
has 'sft_vehicle_inspected_items' =>
    ('is' => 'rw', 'isa' => 'ArrayObjSftVehicleInspectedItem', 'required' => '0');
has 'inspector'           => ('is' => 'rw', 'isa' => 'ObjHrAssociate', 'required' => '0');
has 'location_of_records' => ('is' => 'rw', 'isa' => 'ObjCntAddress',  'required' => '0');

has '_dbix_class' =>
    (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'SftVehicleInspection');

1;
