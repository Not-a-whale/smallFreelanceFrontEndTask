package TMS::API::Core::FinJournalEntrySearch;
use Moose::Role;

has 'AccountId'      => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'Amount'         => ('is' => 'rw', 'isa' => 'CurrencyValue', 'coerce' => '1', 'required' => '0');
has 'EntityId'       => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'TransactionId'  => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'Classification' => ('is' => 'rw', 'isa' => 'Any',           'coerce' => '0', 'required' => '0');
has 'DebitCredit'    => ('is' => 'rw', 'isa' => 'Any',           'coerce' => '0', 'required' => '0');

1;