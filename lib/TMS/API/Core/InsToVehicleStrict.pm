package TMS::API::Core::InsToVehicleStrict;
use Moose::Role;

has 'AddedBy'   => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');
has 'DateAdded' => ('is' => 'rw', 'isa' => 'DATETIME',    'required' => '1');
has 'InsId'     => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');
has 'VehicleId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');

1;
