package TMS::API::Core::FinChequeStrict;
use Moose::Role;

has 'Amount'       => ('is' => 'rw', 'isa' => 'CurrencyValue', 'coerce' => '1', 'required' => '1');
has 'ChequeNumber' => ('is' => 'rw', 'isa' => 'Int',           'coerce' => '0', 'required' => '1');

1;
