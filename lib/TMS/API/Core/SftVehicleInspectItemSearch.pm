package TMS::API::Core::SftVehicleInspectItemSearch;
use Moose::Role;

has 'ItemAreaName' => ('is' => 'rw', 'isa' => 'VarChar255', 'coerce' => '1', 'required' => '0');

1;
