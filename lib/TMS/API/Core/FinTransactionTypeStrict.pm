package TMS::API::Core::FinTransactionTypeStrict;
use Moose::Role;

has 'TransTypeName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');

1;
