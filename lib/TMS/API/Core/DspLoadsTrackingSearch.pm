package TMS::API::Core::DspLoadsTrackingSearch;
use Moose::Role;

has 'Status' => ('is' => 'rw', 'isa' => 'VarChar64',   'coerce' => '1', 'required' => '0');
has 'BolPod' => ('is' => 'rw', 'isa' => 'enum_BolPod', 'coerce' => '1', 'required' => '0');

1;
