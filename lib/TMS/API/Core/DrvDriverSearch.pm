package TMS::API::Core::DrvDriverSearch;
use Moose::Role;

has 'InternationalRoutes' => ('is' => 'rw', 'isa' => 'BoolInt', 'coerce' => '1', 'required' => '0');
has 'LocalRoutes'         => ('is' => 'rw', 'isa' => 'BoolInt', 'coerce' => '1', 'required' => '0');

1;
