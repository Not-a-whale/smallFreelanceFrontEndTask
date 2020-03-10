package TMS::API::Core::InvRoleStrict;
use Moose::Role;

has 'RoleName' => ('is' => 'rw', 'isa' => 'VarChar255', 'coerce' => '1', 'required' => '1');

1;
