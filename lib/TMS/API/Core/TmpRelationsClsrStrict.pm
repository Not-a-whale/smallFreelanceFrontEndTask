package TMS::API::Core::TmpRelationsClsrStrict;
use Moose::Role;

has 'AncestorId'   => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');
has 'Depth'        => ('is' => 'rw', 'isa' => 'Int',         'coerce' => '0', 'required' => '1');
has 'DescendantId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');

1;
