package TMS::API::Core::AppAccountLockStrict;
use Moose::Role;

has 'AccLockId'     => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '1', 'required' => '1');
has 'IPAddress'     => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '1');
has 'Locked'        => ('is' => 'rw', 'isa' => 'BoolInt',       'coerce' => '1', 'required' => '1', 'default' => '0');
has 'LoginAttempts' => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '1', 'default' => '0');

1;
