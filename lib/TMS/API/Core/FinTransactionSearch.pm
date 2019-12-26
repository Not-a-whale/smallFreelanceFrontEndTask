package TMS::API::Core::FinTransactionSearch;
use Moose::Role;

has 'TransactionType' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');

1;
