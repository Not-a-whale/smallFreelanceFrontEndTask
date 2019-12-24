package TMS::API::Core::DspLoadDispatchedStrict;
use Moose::Role;

has 'DispatchedBy' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');
has 'LoadId'       => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');
has 'UnitId'       => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');

1;
