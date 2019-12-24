package TMS::API::Core::FinAccountTypesTreeStructureSearch;
use Moose::Role;

has 'AccountId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');

1;
