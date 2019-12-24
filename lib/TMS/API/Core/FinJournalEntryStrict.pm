package TMS::API::Core::FinJournalEntryStrict;
use Moose::Role;

has 'AccountId'     => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '1');
has 'Amount'        => ('is' => 'rw', 'isa' => 'CurrencyValue', 'required' => '1');
has 'EntityId'      => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '1');
has 'TransactionId' => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '1');

1;
