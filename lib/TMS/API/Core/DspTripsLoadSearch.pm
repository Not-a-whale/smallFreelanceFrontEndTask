package TMS::API::Core::DspTripsLoadSearch;
use Moose::Role;

has 'LoadDispatcher' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'LoadId'         => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'TripId'         => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');

1;
