package TMS::API::Core::EntShipperStrict;
use Moose::Role;

has 'ShipperId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '1');

1;
