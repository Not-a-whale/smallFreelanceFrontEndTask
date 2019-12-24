package TMS::API::Core::SftVehicleInspectionStrict;
use Moose::Role;

has 'InspectionNumber'     => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');
has 'InspectionScheduleId' => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');
has 'InspectorId'          => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');
has 'InspectorSignatureId' => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');
has 'LocationOfRecords'    => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');

1;
