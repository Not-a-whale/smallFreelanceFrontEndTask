package TMS::API::Core::InsToVehicleSearch;
use Moose::Role;

has 'DateAdded' => ('is' => 'rw', 'isa' => 'DATETIME', 'coerce' => '1', 'required' => '0');

1;
