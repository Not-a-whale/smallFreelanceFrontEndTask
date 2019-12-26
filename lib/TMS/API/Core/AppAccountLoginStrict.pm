package TMS::API::Core::AppAccountLoginStrict;
use Moose::Role;

has 'AppAccountId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');
has 'IPAddress'    => ('is' => 'rw', 'isa' => 'Int',         'coerce' => '0', 'required' => '1');
has 'Type'         => ('is' => 'rw', 'isa' => 'Any',         'coerce' => '0', 'required' => '1', 'default' => 'Login');

1;
