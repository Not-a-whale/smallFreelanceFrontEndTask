package TMS::API::Core::SftVehicleInspectItemSearch;
use Moose::Role;

has 'ItemAreaName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

1;
