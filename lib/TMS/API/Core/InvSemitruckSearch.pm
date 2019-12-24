package TMS::API::Core::InvSemitruckSearch;
use Moose::Role;

has 'SemitruckId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');

1;
