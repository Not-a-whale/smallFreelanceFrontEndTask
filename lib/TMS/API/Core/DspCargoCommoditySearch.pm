package TMS::API::Core::DspCargoCommoditySearch;
use Moose::Role;

has 'CommodityName' => ('is' => 'rw', 'isa' => 'VarChar64', 'coerce' => '1', 'required' => '0');

1;
