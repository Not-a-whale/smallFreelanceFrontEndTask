package TMS::API::Core::AppAccountLoginSearch;
use Moose::Role;

has 'AppAccountId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');
has 'IPAddress'    => ('is' => 'rw', 'isa' => 'Int',         'coerce' => '0', 'required' => '0');

1;
