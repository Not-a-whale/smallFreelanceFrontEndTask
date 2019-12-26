package TMS::API::Core::EntCarrierStrict;
use Moose::Role;

has 'CarrierId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '1');

1;
