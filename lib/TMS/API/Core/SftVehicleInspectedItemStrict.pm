package TMS::API::Core::SftVehicleInspectedItemStrict;
use Moose::Role;

has 'InspectedItem' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');
has 'InspectionId'  => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');
has 'Status'        => ('is' => 'rw', 'isa' => 'Any',         'coerce' => '0', 'required' => '1');

1;
