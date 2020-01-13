package TMS::API::Core::SftVehicleInspectionSearch;
use Moose::Role;

has 'InspectionNumber' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'Status' => ('is' => 'rw', 'isa' => 'Any', 'coerce' => '0', 'required' => '0');

1;
