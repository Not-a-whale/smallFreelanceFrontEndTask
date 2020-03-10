package TMS::API::Core::SftVehicleInspectedItemSearch;
use Moose::Role;

has 'Status' => ('is' => 'rw', 'isa' => 'enum_Status', 'coerce' => '1', 'required' => '0');

1;
