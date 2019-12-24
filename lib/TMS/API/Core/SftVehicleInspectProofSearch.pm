package TMS::API::Core::SftVehicleInspectProofSearch;
use Moose::Role;

has 'FileRef'         => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'InspectedItemId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');

1;
