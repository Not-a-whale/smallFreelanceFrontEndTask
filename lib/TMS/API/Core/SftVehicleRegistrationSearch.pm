package TMS::API::Core::SftVehicleRegistrationSearch;
use Moose::Role;

has 'DateExpiration'   => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'PlateNumber'      => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'RegistrationCard' => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'RegistrationDate' => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'RegistrationId'   => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'required' => '0');
has 'State'            => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'VehicleId'        => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');

1;
