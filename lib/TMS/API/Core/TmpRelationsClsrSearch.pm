package TMS::API::Core::TmpRelationsClsrSearch;
use Moose::Role;

has 'Depth' => ('is' => 'rw', 'isa' => 'Int', 'coerce' => '0', 'required' => '0');

1;
