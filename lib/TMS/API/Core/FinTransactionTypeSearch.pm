package TMS::API::Core::FinTransactionTypeSearch;
use Moose::Role;

has 'TransTypeName' => ('is' => 'rw', 'isa' => 'VarChar64', 'coerce' => '1', 'required' => '0');

1;
