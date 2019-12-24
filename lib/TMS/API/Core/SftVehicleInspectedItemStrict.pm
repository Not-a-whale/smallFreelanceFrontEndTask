package TMS::API::Core::SftVehicleInspectedItemStrict;
use Moose::Role;

has 'InspectedItem' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');
has 'InspectionId'  => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');
has 'Status'        => ('is' => 'rw', 'isa' => 'Any',         'required' => '1');

1;
