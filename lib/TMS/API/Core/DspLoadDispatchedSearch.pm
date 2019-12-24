package TMS::API::Core::DspLoadDispatchedSearch;
use Moose::Role;

has 'DispatchedBy' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'LoadId'       => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'UnitId'       => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');

1;
