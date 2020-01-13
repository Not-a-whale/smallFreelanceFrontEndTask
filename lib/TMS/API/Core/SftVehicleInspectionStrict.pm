package TMS::API::Core::SftVehicleInspectionStrict;
use Moose::Role;

has 'InspectionNumber' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'Status' => ('is' => 'rw', 'isa' => 'Any', 'coerce' => '0', 'required' => '1', 'default' => 'Other');

1;
