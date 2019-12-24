package TMS::API::Core::InvVehicleSearch;
use Moose::Role;

has 'CarrierId' => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'VIN'       => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'VehicleId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'required' => '0');

1;
