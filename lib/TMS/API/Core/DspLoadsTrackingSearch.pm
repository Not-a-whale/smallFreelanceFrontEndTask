package TMS::API::Core::DspLoadsTrackingSearch;
use Moose::Role;

has 'DestinationId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'coerce' => '0', 'required' => '0');
has 'DriverId'      => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'Status'        => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'BolPod'        => ('is' => 'rw', 'isa' => 'Any',              'coerce' => '0', 'required' => '0');

1;
