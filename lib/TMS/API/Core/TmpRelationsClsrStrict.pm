package TMS::API::Core::TmpRelationsClsrStrict;
use Moose::Role;

has 'Depth' => ('is' => 'rw', 'isa' => 'Int', 'coerce' => '0', 'required' => '1');

1;
