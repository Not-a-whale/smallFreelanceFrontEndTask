package TMS::API::Core::SftVehicleInspectedItemSearch;
use Moose::Role;

has 'InspectedItem' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'InspectionId'  => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'Status'        => ('is' => 'rw', 'isa' => 'Any',         'required' => '0');

1;
