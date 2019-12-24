package TMS::API::Core::InvVehicleStrict;
use Moose::Role;

has 'CarrierId' => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');
has 'VIN'       => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');
has 'VehicleId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'required' => '1');

1;
