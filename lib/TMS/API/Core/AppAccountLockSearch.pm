package TMS::API::Core::AppAccountLockSearch;
use Moose::Role;

has 'AccLockId'    => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '0');
has 'AppAccountId' => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '0');
has 'IPAddress'    => ('is' => 'rw', 'isa' => 'Int',           'required' => '0');

1;
