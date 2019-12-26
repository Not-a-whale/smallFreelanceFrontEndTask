package TMS::API::Core::AppAccountLockSearch;
use Moose::Role;

has 'AccLockId'    => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '0');
has 'AppAccountId' => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'IPAddress'    => ('is' => 'rw', 'isa' => 'Int',           'coerce' => '0', 'required' => '0');

1;
