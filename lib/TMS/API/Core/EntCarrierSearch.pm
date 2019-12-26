package TMS::API::Core::EntCarrierSearch;
use Moose::Role;

has 'CarrierId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '0');

1;
