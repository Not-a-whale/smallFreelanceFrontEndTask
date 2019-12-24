package TMS::API::Core::FinAccountTypesTreeStructureStrict;
use Moose::Role;

has 'AccountId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');

1;
