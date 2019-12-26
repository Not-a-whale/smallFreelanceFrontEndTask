package TMS::API::Core::FinAccountTypesTreeStructureStrict;
use Moose::Role;

has 'AccountId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');

1;
