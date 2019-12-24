package TMS::API::Core::AppRolePermissionSearch;
use Moose::Role;

has 'Permission' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'Role'       => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');

1;
