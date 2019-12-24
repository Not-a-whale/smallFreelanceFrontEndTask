package TMS::API::Core::FinTransactionStrict;
use Moose::Role;

has 'TransactionType' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');

1;
