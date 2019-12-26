package TMS::API::Core::FinJournalEntryStrict;
use Moose::Role;

has 'AccountId'     => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '1');
has 'Amount'        => ('is' => 'rw', 'isa' => 'CurrencyValue', 'coerce' => '1', 'required' => '1');
has 'EntityId'      => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '1');
has 'TransactionId' => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '1');

1;
