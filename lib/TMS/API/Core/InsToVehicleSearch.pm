package TMS::API::Core::InsToVehicleSearch;
use Moose::Role;

has 'AddedBy'   => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'DateAdded' => ('is' => 'rw', 'isa' => 'DATETIME',    'required' => '0');
has 'InsId'     => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'VehicleId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');

1;
