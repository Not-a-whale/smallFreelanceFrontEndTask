package TMS::API::Core::AppRoleMenusSearch;
use Moose::Role;

has 'MenuItemId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');
has 'RoleId'     => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');

1;
