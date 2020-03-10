package TMS::API::Core::InvRoleSearch;
use Moose::Role;

has 'RoleName' => ('is' => 'rw', 'isa' => 'VarChar255', 'coerce' => '1', 'required' => '0');

1;
