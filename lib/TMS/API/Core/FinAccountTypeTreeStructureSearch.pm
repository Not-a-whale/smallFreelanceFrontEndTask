package TMS::API::Core::FinAccountTypeTreeStructureSearch;
use Moose::Role;

has 'AccountTypeId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'RootTypeId'    => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');

1;
