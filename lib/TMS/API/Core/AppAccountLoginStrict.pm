package TMS::API::Core::AppAccountLoginStrict;
use Moose::Role;

has 'AppAccountId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');
has 'IPAddress'    => ('is' => 'rw', 'isa' => 'Int',         'required' => '1');

1;
