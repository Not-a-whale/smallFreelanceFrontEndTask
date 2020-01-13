package TMS::API::Core::AppRoleAssignedStrict;
use Moose::Role;

has 'ValidFrom' => ('is' => 'rw', 'isa' => 'DATETIME', 'coerce' => '1', 'required' => '1');

1;
