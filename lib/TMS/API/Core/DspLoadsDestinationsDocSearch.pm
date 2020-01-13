package TMS::API::Core::DspLoadsDestinationsDocSearch;
use Moose::Role;

has 'Verified'    => ('is' => 'rw', 'isa' => 'Any',     'coerce' => '0', 'required' => '0');
has 'FactoredDoc' => ('is' => 'rw', 'isa' => 'BoolInt', 'coerce' => '1', 'required' => '0');

1;
