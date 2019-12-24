package TMS::API::Core::EntShipperSearch;
use Moose::Role;

has 'ShipperId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '0');

1;
