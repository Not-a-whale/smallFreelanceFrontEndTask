package TMS::API::Core::InvUnitSearch;
use Moose::Role;

has 'UnitTag' => ('is' => 'rw', 'isa' => 'VarChar45', 'coerce' => '1', 'required' => '0');

1;
