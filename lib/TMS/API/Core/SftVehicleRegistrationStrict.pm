package TMS::API::Core::SftVehicleRegistrationStrict;
use Moose::Role;

has 'DateExpiration'   => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '1');
has 'PlateNumber'      => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'RegistrationCard' => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '1');
has 'RegistrationDate' => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '1');
has 'RegistrationId'   => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'coerce' => '0', 'required' => '1');
has 'State'            => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'VehicleId'        => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '1');

1;
