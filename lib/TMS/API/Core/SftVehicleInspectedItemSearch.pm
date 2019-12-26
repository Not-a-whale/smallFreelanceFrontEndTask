package TMS::API::Core::SftVehicleInspectedItemSearch;
use Moose::Role;

has 'InspectedItem' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');
has 'InspectionId'  => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');
has 'Status'        => ('is' => 'rw', 'isa' => 'Any',         'coerce' => '0', 'required' => '0');

1;
