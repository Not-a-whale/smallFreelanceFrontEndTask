package TMS::API::Core::TskTreeStrict;
use Moose::Role;

has 'length' => ('is' => 'rw', 'isa' => 'Int', 'coerce' => '0', 'required' => '1', 'default' => '0');

1;
