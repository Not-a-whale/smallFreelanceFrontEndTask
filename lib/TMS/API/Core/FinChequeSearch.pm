package TMS::API::Core::FinChequeSearch;
use Moose::Role;

has 'Amount'        => ('is' => 'rw', 'isa' => 'CurrencyValue', 'coerce' => '1', 'required' => '0');
has 'Bank'          => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'ChequeId'      => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '0');
has 'ChequeNumber'  => ('is' => 'rw', 'isa' => 'Int',           'coerce' => '0', 'required' => '0');
has 'CreatedBy'     => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'Payee'         => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'Payer'         => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'TransactionId' => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');

1;
