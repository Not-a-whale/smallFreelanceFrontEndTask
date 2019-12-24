package TMS::API::Core::FinAccountTypesTreeStrict;
use Moose::Role;

has 'AncestorId'   => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '1');
has 'DescendantId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '1');

1;
