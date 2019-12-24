package TMS::API::Core::DspTripStrict;
use Moose::Role;

has 'CreatedBy'  => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');
has 'TripNumber' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');
has 'TripStatus' => ('is' => 'rw', 'isa' => 'Any',              'required' => '1');

1;
