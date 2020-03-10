package TMS::API::Core::SftVehicleInspectItemStrict;
use Moose::Role;

has 'ItemAreaName' => ('is' => 'rw', 'isa' => 'VarChar255', 'coerce' => '1', 'required' => '1');

1;
