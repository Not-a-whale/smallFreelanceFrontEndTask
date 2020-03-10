package TMS::API::Core::FinChequeStrict;
use Moose::Role;

has 'Amount'       => ('is' => 'rw', 'isa' => 'CurrencyValue', 'coerce' => '1', 'required' => '1');
has 'ChequeNumber' => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '1');

1;
