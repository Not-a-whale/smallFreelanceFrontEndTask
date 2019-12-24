package TMS::API::Core::FinJournalEntrySearch;
use Moose::Role;

has 'AccountId'     => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '0');
has 'Amount'        => ('is' => 'rw', 'isa' => 'CurrencyValue', 'required' => '0');
has 'EntityId'      => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '0');
has 'TransactionId' => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '0');

1;
