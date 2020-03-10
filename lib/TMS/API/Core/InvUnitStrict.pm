package TMS::API::Core::InvUnitStrict;
use Moose::Role;

has 'UnitTag' => ('is' => 'rw', 'isa' => 'VarChar45', 'coerce' => '1', 'required' => '1');

1;
