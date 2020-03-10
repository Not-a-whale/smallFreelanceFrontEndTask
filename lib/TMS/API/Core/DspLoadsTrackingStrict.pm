package TMS::API::Core::DspLoadsTrackingStrict;
use Moose::Role;

has 'Status' => ('is' => 'rw', 'isa' => 'VarChar64',   'coerce' => '1', 'required' => '1');
has 'BolPod' => ('is' => 'rw', 'isa' => 'enum_BolPod', 'coerce' => '1', 'required' => '1', 'default' => 'na');

1;
