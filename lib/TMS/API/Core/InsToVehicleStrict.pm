package TMS::API::Core::InsToVehicleStrict;
use Moose::Role;

has 'DateAdded' => ('is' => 'rw', 'isa' => 'DATETIME', 'coerce' => '1', 'required' => '1');

1;
