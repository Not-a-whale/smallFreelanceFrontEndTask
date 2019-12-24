package TMS::API::Core::EntCarrierStrict;
use Moose::Role;

has 'CarrierId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '1');

1;
