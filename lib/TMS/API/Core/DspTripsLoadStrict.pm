package TMS::API::Core::DspTripsLoadStrict;
use Moose::Role;

has 'LoadDispatcher' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');
has 'LoadId'         => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');
has 'TripId'         => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');

1;
