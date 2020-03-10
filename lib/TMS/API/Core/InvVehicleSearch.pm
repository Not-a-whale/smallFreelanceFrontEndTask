package TMS::API::Core::InvVehicleSearch;
use Moose::Role;

has 'VIN'  => ('is' => 'rw', 'isa' => 'VarChar19', 'coerce' => '1', 'required' => '0');
has 'Fuel' => ('is' => 'rw', 'isa' => 'enum_Fuel', 'coerce' => '1', 'required' => '0');

1;
