package TMS::API::Core::DspTripSearch;
use Moose::Role;

has 'CreatedBy'  => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'TripNumber' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'TripStatus' => ('is' => 'rw', 'isa' => 'Any',              'required' => '0');

1;
