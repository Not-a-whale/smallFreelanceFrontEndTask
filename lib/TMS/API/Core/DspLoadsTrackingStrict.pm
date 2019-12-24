package TMS::API::Core::DspLoadsTrackingStrict;
use Moose::Role;

has 'DestinationId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'required' => '1');
has 'DriverId'      => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');
has 'Status'        => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');

1;
