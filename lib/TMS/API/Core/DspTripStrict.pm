package TMS::API::Core::DspTripStrict;
use Moose::Role;

has 'CreatedBy'  => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '1');
has 'TripNumber' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'TripStatus' => ('is' => 'rw', 'isa' => 'Any',              'coerce' => '0', 'required' => '1');

1;
