package TMS::API::Core::SftVehicleInspectItemStrict;
use Moose::Role;

has 'ItemAreaName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');

1;
