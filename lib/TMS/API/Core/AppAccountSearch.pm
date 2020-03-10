package TMS::API::Core::AppAccountSearch;
use Moose::Role;

has 'PasswordHash' => ('is' => 'rw', 'isa' => 'VarChar64', 'coerce' => '1', 'required' => '0');
has 'Salt'         => ('is' => 'rw', 'isa' => 'VarChar64', 'coerce' => '1', 'required' => '0');
has 'Username'     => ('is' => 'rw', 'isa' => 'VarChar64', 'coerce' => '1', 'required' => '0');
has 'Locked'       => ('is' => 'rw', 'isa' => 'BoolInt',   'coerce' => '1', 'required' => '0');

1;
