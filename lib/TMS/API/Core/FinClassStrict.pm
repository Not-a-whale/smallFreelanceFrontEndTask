package TMS::API::Core::FinClassStrict;
use Moose::Role;

has 'Name' => ('is' => 'rw', 'isa' => 'VarChar45', 'coerce' => '1', 'required' => '1');

1;
