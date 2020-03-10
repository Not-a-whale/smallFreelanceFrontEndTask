package TMS::API::Core::AppAccountLoginStrict;
use Moose::Role;

has 'IPAddress' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');
has 'Type'      => ('is' => 'rw', 'isa' => 'enum_Type',   'coerce' => '1', 'required' => '1', 'default' => 'Login');

1;
