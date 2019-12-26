package TMS::API::Core::AppRoleMenusStrict;
use Moose::Role;

has 'MenuItemId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');
has 'RoleId'     => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');

1;
