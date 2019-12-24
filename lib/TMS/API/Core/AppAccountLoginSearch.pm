package TMS::API::Core::AppAccountLoginSearch;
use Moose::Role;

has 'AppAccountId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'IPAddress'    => ('is' => 'rw', 'isa' => 'Int',         'required' => '0');

1;
