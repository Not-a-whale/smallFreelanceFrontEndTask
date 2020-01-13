package TMS::API::Core::SftVehicleInspectedItemSearch;
use Moose::Role;

has 'Status' => ('is' => 'rw', 'isa' => 'Any', 'coerce' => '0', 'required' => '0');

1;
