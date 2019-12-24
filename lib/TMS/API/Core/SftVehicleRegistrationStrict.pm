package TMS::API::Core::SftVehicleRegistrationStrict;
use Moose::Role;

has 'DateExpiration'   => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '1');
has 'PlateNumber'      => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');
has 'RegistrationCard' => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');
has 'RegistrationDate' => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '1');
has 'RegistrationId'   => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'required' => '1');
has 'State'            => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');
has 'VehicleId'        => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');

1;
