package TMS::API::Core::AppAccountLoginStrict;
use Moose::Role;

has 'IPAddress' => ('is' => 'rw', 'isa' => 'Int', 'coerce' => '0', 'required' => '1');
has 'Type'      => ('is' => 'rw', 'isa' => 'Any', 'coerce' => '0', 'required' => '1', 'default' => 'Login');

1;
