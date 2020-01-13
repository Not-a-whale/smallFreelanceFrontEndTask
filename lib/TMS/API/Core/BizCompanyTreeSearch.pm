package TMS::API::Core::BizCompanyTreeSearch;
use Moose::Role;

has 'Depth' => ('is' => 'rw', 'isa' => 'Int', 'coerce' => '0', 'required' => '0');

1;
