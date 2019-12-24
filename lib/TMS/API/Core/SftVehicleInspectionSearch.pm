package TMS::API::Core::SftVehicleInspectionSearch;
use Moose::Role;

has 'InspectionNumber'     => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'InspectionScheduleId' => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'InspectorId'          => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'InspectorSignatureId' => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'LocationOfRecords'    => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');

1;
