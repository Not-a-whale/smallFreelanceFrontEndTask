package TMS::API::Core::DspLoadStrict;
use Moose::Role;

has 'LoadRate' => ('is' => 'rw', 'isa' => 'CurrencyValue', 'coerce' => '1', 'required' => '1');

1;
