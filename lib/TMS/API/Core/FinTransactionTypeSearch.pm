package TMS::API::Core::FinTransactionTypeSearch;
use Moose::Role;

has 'TransTypeName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

1;
