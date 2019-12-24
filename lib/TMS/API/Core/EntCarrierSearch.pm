package TMS::API::Core::EntCarrierSearch;
use Moose::Role;

has 'CarrierId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '0');

1;
