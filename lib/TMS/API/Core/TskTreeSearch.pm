package TMS::API::Core::TskTreeSearch;
use Moose::Role;

has 'length' => ('is' => 'rw', 'isa' => 'Int', 'coerce' => '0', 'required' => '0');

1;
