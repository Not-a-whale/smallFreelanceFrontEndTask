package TMS::API::Core::FinAccountsRootStrict;
use Moose::Role;

has 'DescendantId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');
has 'RootId'       => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');

1;
