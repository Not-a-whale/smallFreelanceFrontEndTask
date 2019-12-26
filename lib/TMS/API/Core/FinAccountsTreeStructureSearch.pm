package TMS::API::Core::FinAccountsTreeStructureSearch;
use Moose::Role;

has 'AccountId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');

1;
