package TMS::API::Core::SftVehicleInspectItemStrict;
use Moose::Role;

has 'ItemAreaName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');

1;
