package TMS::API::Core::SftVehicleInspectProofStrict;
use Moose::Role;

has 'FileRef'         => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');
has 'InspectedItemId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');

1;
