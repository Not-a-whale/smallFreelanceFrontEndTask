package TMS::API::Core::FinTransactionTypeSearch;
use Moose::Role;

has 'TransTypeName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');

1;
