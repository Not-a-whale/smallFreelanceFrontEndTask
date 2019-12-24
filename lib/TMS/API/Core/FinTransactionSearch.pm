package TMS::API::Core::FinTransactionSearch;
use Moose::Role;

has 'TransactionType' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');

1;
