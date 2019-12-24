package TMS::API::Core::BizCompanyTreeStrict;
use Moose::Role;

has 'AncestorId'   => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');
has 'Depth'        => ('is' => 'rw', 'isa' => 'Int',         'required' => '1');
has 'DescendantId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');

1;
