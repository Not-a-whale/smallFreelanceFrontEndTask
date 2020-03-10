package TMS::API::Core::InvVehicleStrict;
use Moose::Role;

has 'VIN'  => ('is' => 'rw', 'isa' => 'VarChar19', 'coerce' => '1', 'required' => '1');
has 'Fuel' => ('is' => 'rw', 'isa' => 'enum_Fuel', 'coerce' => '1', 'required' => '1', 'default' => 'none');

1;
