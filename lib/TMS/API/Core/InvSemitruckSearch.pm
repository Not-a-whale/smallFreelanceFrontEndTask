package TMS::API::Core::InvSemitruckSearch;
use Moose::Role;

has 'SemitruckId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');

1;
