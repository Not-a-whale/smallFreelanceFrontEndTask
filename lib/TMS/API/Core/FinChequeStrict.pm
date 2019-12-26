package TMS::API::Core::FinChequeStrict;
use Moose::Role;

has 'Amount'        => ('is' => 'rw', 'isa' => 'CurrencyValue', 'coerce' => '1', 'required' => '1');
has 'Bank'          => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '1');
has 'ChequeId'      => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '1');
has 'ChequeNumber'  => ('is' => 'rw', 'isa' => 'Int',           'coerce' => '0', 'required' => '1');
has 'CreatedBy'     => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '1');
has 'Payee'         => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '1');
has 'Payer'         => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '1');
has 'TransactionId' => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '1');

1;
