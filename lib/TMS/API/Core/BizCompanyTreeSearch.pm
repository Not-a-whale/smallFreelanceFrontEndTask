package TMS::API::Core::BizCompanyTreeSearch;
use Moose::Role;

has 'AncestorId'   => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'Depth'        => ('is' => 'rw', 'isa' => 'Int',         'required' => '0');
has 'DescendantId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');

1;
