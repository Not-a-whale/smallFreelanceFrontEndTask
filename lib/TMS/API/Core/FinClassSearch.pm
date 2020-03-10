package TMS::API::Core::FinClassSearch;
use Moose::Role;

has 'Name' => ('is' => 'rw', 'isa' => 'VarChar45', 'coerce' => '1', 'required' => '0');

1;
