package TMS::API::Core::DspCargoCommodityStrict;
use Moose::Role;

has 'CommodityName' => ('is' => 'rw', 'isa' => 'VarChar64', 'coerce' => '1', 'required' => '1');

1;
