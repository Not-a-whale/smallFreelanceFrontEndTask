package TMS::API::Core::EntShipperSearch;
use Moose::Role;

has 'ShipperId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '0');

1;
