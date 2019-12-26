package TMS::API::Core::InvSprinterStrict;
use Moose::Role;

has 'SprinterId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');

1;
