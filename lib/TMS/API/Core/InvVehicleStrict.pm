package TMS::API::Core::InvVehicleStrict;
use Moose::Role;

has 'VIN' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'Fuel' => ('is' => 'rw', 'isa' => 'Any', 'coerce' => '0', 'required' => '1', 'default' => 'none');

1;
