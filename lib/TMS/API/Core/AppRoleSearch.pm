package TMS::API::Core::AppRoleSearch;
use Moose::Role;

has 'RoleName'    => ('is' => 'rw', 'isa' => 'VarChar255', 'coerce' => '1', 'required' => '0');
has 'Editable'    => ('is' => 'rw', 'isa' => 'BoolInt',    'coerce' => '1', 'required' => '0');
has 'UserDefined' => ('is' => 'rw', 'isa' => 'BoolInt',    'coerce' => '1', 'required' => '0');

1;
