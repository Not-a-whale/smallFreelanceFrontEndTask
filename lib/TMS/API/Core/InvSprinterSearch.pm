package TMS::API::Core::InvSprinterSearch;
use Moose::Role;

has 'SprinterId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');

1;
