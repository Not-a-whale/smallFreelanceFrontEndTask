package TMS::API::Core::BizCompanyTreeSearch;
use Moose::Role;

has 'Depth' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');

1;
