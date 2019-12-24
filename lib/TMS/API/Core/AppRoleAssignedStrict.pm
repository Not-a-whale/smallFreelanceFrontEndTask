package TMS::API::Core::AppRoleAssignedStrict;
use Moose::Role;

has 'AppAccountId'   => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');
has 'RoleAssignedBy' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');
has 'RoleId'         => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');
has 'ValidFrom'      => ('is' => 'rw', 'isa' => 'DATETIME',    'required' => '1');

1;
