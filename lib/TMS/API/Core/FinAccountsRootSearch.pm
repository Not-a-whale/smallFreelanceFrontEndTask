package TMS::API::Core::FinAccountsRootSearch;
use Moose::Role;

has 'DescendantId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'RootId'       => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');

1;
