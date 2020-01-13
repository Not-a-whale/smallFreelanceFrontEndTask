package TMS::API::Core::DspLoadSearch;
use Moose::Role;

has 'LoadRate' => ('is' => 'rw', 'isa' => 'CurrencyValue', 'coerce' => '1', 'required' => '0');

1;
