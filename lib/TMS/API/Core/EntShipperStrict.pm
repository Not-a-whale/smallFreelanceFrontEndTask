package TMS::API::Core::EntShipperStrict;
use Moose::Role;

has 'ShipperId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '1');

1;
