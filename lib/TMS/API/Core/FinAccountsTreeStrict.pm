package TMS::API::Core::FinAccountsTreeStrict;
use Moose::Role;

has 'AncestorId'   => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '1');
has 'DescendantId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '1');

1;
