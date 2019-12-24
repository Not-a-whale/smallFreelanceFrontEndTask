package TMS::API::Core::InvSemitruckStrict;
use Moose::Role;

has 'SemitruckId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');

1;
