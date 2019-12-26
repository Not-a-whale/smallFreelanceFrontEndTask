package TMS::API::Core::FinTransactionTypeStrict;
use Moose::Role;

has 'TransTypeName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');

1;
