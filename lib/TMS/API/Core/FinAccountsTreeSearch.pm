package TMS::API::Core::FinAccountsTreeSearch;
use Moose::Role;

has 'AncestorId'   => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '0');
has 'DescendantId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '0');

1;
