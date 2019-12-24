package TMS::API::Core::TskTreeStrict;
use Moose::Role;

has 'ancestor'   => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');
has 'descendant' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');

1;
