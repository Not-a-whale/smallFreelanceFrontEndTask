package TMS::API::Core::FinAccountsTreeSearch;
use Moose::Role;

has 'AncestorId'   => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '0');
has 'DescendantId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '0');

1;
