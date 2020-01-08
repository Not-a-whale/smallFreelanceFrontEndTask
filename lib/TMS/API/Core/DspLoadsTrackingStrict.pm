package TMS::API::Core::DspLoadsTrackingStrict;
use Moose::Role;

has 'Status' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'BolPod' => ('is' => 'rw', 'isa' => 'Any', 'coerce' => '0', 'required' => '1', 'default' => 'na');

1;
