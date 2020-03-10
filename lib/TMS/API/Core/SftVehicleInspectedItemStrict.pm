package TMS::API::Core::SftVehicleInspectedItemStrict;
use Moose::Role;

has 'Status' => ('is' => 'rw', 'isa' => 'enum_Status', 'coerce' => '1', 'required' => '1');

1;
