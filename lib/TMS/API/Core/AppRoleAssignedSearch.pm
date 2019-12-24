package TMS::API::Core::AppRoleAssignedSearch;
use Moose::Role;

has 'AppAccountId'   => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'RoleAssignedBy' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'RoleId'         => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'ValidFrom'      => ('is' => 'rw', 'isa' => 'DATETIME',    'required' => '0');

1;
