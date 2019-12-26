package TMS::API::Core::DspTripSearch;
use Moose::Role;

has 'CreatedBy'  => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'TripNumber' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'TripStatus' => ('is' => 'rw', 'isa' => 'Any',              'coerce' => '0', 'required' => '0');
has 'IsValid'    => ('is' => 'rw', 'isa' => 'BoolInt',          'coerce' => '1', 'required' => '0');

1;
