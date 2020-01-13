package TMS::API::Core::AppRoleAssignedSearch;
use Moose::Role;

has 'ValidFrom' => ('is' => 'rw', 'isa' => 'DATETIME', 'coerce' => '1', 'required' => '0');

1;
