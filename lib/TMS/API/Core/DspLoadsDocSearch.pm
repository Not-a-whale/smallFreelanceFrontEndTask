package TMS::API::Core::DspLoadsDocSearch;
use Moose::Role;

has 'FactoredDoc' => ('is' => 'rw', 'isa' => 'BoolInt', 'coerce' => '1', 'required' => '0');

1;
