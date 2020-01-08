package TMS::API::Core::SftVehicleInspectedItemStrict;
use Moose::Role;

has 'Status' => ('is' => 'rw', 'isa' => 'Any', 'coerce' => '0', 'required' => '1');

1;
