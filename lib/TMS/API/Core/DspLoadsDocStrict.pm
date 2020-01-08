package TMS::API::Core::DspLoadsDocStrict;
use Moose::Role;

has 'FactoredDoc' => ('is' => 'rw', 'isa' => 'BoolInt', 'coerce' => '1', 'required' => '1', 'default' => '0');

1;
