package TMS::API::Core::AppRolePermissionSearch;
use Moose::Role;

has 'Permission' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');
has 'Role'       => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');

1;
