package TMS::API::Core::AppAccountLockStrict;
use Moose::Role;

has 'AccLockId'     => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '1');
has 'IPAddress'     => ('is' => 'rw', 'isa' => 'Int',           'coerce' => '0', 'required' => '1');
has 'Locked'        => ('is' => 'rw', 'isa' => 'BoolInt',       'coerce' => '1', 'required' => '1', 'default' => '0');
has 'LoginAttempts' => ('is' => 'rw', 'isa' => 'Int',           'coerce' => '0', 'required' => '1', 'default' => '0');

1;
