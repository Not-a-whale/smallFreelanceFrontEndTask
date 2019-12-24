package TMS::API::Core::FinAccountsTreeStructureSearch;
use Moose::Role;

has 'AccountId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');

1;
