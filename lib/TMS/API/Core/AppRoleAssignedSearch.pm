package TMS::API::Core::AppRoleAssignedSearch;
use Moose::Role;

has 'AppAccountId'   => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');
has 'RoleAssignedBy' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');
has 'RoleId'         => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');
has 'ValidFrom'      => ('is' => 'rw', 'isa' => 'DATETIME',    'coerce' => '1', 'required' => '0');

1;
