package TMS::API::Core::FinAccountTypeTreeStructureStrict;
use Moose::Role;

has 'AccountTypeId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');
has 'RootTypeId'    => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');

1;
