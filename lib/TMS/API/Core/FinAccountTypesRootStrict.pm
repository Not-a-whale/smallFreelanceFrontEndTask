package TMS::API::Core::FinAccountTypesRootStrict;
use Moose::Role;

has 'DescendantId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');
has 'RootId'       => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');

1;
