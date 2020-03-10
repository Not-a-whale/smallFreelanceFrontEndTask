package TMS::API::Core::FinJournalEntrySearch;
use Moose::Role;

has 'Amount'         => ('is' => 'rw', 'isa' => 'CurrencyValue',       'coerce' => '1', 'required' => '0');
has 'Classification' => ('is' => 'rw', 'isa' => 'enum_Classification', 'coerce' => '1', 'required' => '0');
has 'DebitCredit'    => ('is' => 'rw', 'isa' => 'enum_DebitCredit',    'coerce' => '1', 'required' => '0');

1;
