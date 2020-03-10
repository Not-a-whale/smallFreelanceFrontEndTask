package TMS::API::Core::DspTripSearch;
use Moose::Role;

has 'TripNumber' => ('is' => 'rw', 'isa' => 'VarChar12',       'coerce' => '1', 'required' => '0');
has 'TripStatus' => ('is' => 'rw', 'isa' => 'enum_TripStatus', 'coerce' => '1', 'required' => '0');
has 'IsValid'    => ('is' => 'rw', 'isa' => 'BoolInt',         'coerce' => '1', 'required' => '0');

1;
