package TMS::API::Core::AppAccountLockStrict;
use Moose::Role;

has 'AccLockId'    => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '1');
has 'AppAccountId' => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '1');
has 'IPAddress'    => ('is' => 'rw', 'isa' => 'Int',           'required' => '1');

1;
