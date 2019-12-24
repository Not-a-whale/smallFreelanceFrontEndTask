package TMS::API::Core::AppRoleMenusStrict;
use Moose::Role;

has 'MenuItemId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');
has 'RoleId'     => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');

1;
