package TMS::API::Core::FinTransactionStrict;
use Moose::Role;

has 'TransactionType' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');

1;
