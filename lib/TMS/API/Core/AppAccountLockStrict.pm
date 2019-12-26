package TMS::API::Core::AppAccountLockStrict;
use Moose::Role;

has 'AccLockId'    => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '1');
has 'AppAccountId' => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '1');
has 'IPAddress'    => ('is' => 'rw', 'isa' => 'Int',           'coerce' => '0', 'required' => '1');

1;
