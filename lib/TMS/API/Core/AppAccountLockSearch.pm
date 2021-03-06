package TMS::API::Core::AppAccountLockSearch;
use Moose::Role;

has 'AccLockId'     => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '1', 'required' => '0');
has 'IPAddress'     => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'Locked'        => ('is' => 'rw', 'isa' => 'BoolInt',       'coerce' => '1', 'required' => '0');
has 'LoginAttempts' => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');

1;
