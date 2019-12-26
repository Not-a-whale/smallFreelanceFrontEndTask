package TMS::API::Core::SftVehicleInspectItemSearch;
use Moose::Role;

has 'ItemAreaName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');

1;
