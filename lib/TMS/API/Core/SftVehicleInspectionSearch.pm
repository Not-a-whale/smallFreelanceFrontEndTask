package TMS::API::Core::SftVehicleInspectionSearch;
use Moose::Role;

has 'InspectionNumber'     => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'InspectionScheduleId' => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'InspectorId'          => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'InspectorSignatureId' => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'LocationOfRecords'    => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'Status'               => ('is' => 'rw', 'isa' => 'Any',              'coerce' => '0', 'required' => '0');

1;
