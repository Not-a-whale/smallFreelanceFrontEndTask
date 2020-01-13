package TMS::API::Core::DspTripStrict;
use Moose::Role;

has 'TripNumber' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'TripStatus' => ('is' => 'rw', 'isa' => 'Any',              'coerce' => '0', 'required' => '1');
has 'IsValid'    => ('is' => 'rw', 'isa' => 'BoolInt',          'coerce' => '1', 'required' => '1', 'default' => '1');

1;
