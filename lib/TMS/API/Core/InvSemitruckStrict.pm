package TMS::API::Core::InvSemitruckStrict;
use Moose::Role;

has 'SemitruckId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');

1;
