package TMS::API::Core::DspLoadsTrackingSearch;
use Moose::Role;

has 'DestinationId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'required' => '0');
has 'DriverId'      => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'Status'        => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

1;
