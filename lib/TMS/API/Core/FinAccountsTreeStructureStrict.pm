package TMS::API::Core::FinAccountsTreeStructureStrict;
use Moose::Role;

has 'AccountId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');

1;
