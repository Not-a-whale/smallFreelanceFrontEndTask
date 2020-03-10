package TMS::API::Core::FinChequeSearch;
use Moose::Role;

has 'Amount'       => ('is' => 'rw', 'isa' => 'CurrencyValue', 'coerce' => '1', 'required' => '0');
has 'ChequeNumber' => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');

1;
