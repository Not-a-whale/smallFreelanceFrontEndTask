package TMS::API::Core::InvSprinterStrict;
use Moose::Role;

has 'SprinterId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');

1;
