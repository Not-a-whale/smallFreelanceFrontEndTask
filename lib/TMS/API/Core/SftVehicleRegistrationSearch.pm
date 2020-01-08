package TMS::API::Core::SftVehicleRegistrationSearch;
use Moose::Role;

has 'DateExpiration'   => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '0');
has 'PlateNumber'      => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'RegistrationDate' => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '0');
has 'RegistrationId'   => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'coerce' => '0', 'required' => '0');
has 'State'            => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'ProRate'          => ('is' => 'rw', 'isa' => 'BoolInt',          'coerce' => '1', 'required' => '0');

1;
