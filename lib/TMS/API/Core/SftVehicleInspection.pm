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

has 'DateInspection'       => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '0');
has 'InspectionId'         => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'coerce' => '0', 'required' => '0');
has 'InspectionScheduleId' => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'InspectorId'          => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'InspectorSignatureId' => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'LocationOfRecords'    => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'Mileage'              => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'Remarks'              => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');

# relations
has 'inspection_schedule'         => ('is' => 'rw', 'isa' => 'ObjSftInspectionSchedule',        'coerce' => '1', 'required' => '0');
has 'inspector'                   => ('is' => 'rw', 'isa' => 'ObjHrAssociate',                  'coerce' => '1', 'required' => '0');
has 'inspector_signature'         => ('is' => 'rw', 'isa' => 'ObjGenFile',                      'coerce' => '1', 'required' => '0');
has 'location_of_records'         => ('is' => 'rw', 'isa' => 'ObjCntAddress',                   'coerce' => '1', 'required' => '0');
has 'sft_vehicle_inspected_items' => ('is' => 'rw', 'isa' => 'ArrayObjSftVehicleInspectedItem', 'coerce' => '1', 'required' => '0');

has '_dbix_class' => (is => 'ro', required => 1, isa => 'Str', init_arg => undef, default => 'SftVehicleInspection');

1;
