package TMS::API::Core::FinAccountTypesRootSearch;
use Moose::Role;

has 'DescendantId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'RootId'       => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');

1;
