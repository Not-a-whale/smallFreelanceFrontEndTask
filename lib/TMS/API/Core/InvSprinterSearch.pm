package TMS::API::Core::InvSprinterSearch;
use Moose::Role;

has 'SprinterId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');

1;
