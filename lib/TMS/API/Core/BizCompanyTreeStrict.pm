package TMS::API::Core::BizCompanyTreeStrict;
use Moose::Role;

has 'Depth' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');

1;
