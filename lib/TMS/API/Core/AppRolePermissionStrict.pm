package TMS::API::Core::AppRolePermissionStrict;
use Moose::Role;

has 'Permission' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');
has 'Role'       => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');

1;
