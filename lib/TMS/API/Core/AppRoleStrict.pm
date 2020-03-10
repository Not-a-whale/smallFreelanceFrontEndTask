package TMS::API::Core::AppRoleStrict;
use Moose::Role;

has 'RoleName'    => ('is' => 'rw', 'isa' => 'VarChar255', 'coerce' => '1', 'required' => '1');
has 'Editable'    => ('is' => 'rw', 'isa' => 'BoolInt',    'coerce' => '1', 'required' => '0', 'default' => '1');
has 'UserDefined' => ('is' => 'rw', 'isa' => 'BoolInt',    'coerce' => '1', 'required' => '0', 'default' => '1');

1;
