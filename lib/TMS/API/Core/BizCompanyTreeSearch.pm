package TMS::API::Core::BizCompanyTreeSearch;
use Moose::Role;

has 'AncestorId'   => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');
has 'Depth'        => ('is' => 'rw', 'isa' => 'Int',         'coerce' => '0', 'required' => '0');
has 'DescendantId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');

1;
