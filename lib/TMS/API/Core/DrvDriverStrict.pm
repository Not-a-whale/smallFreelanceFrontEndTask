package TMS::API::Core::DrvDriverStrict;
use Moose::Role;

has 'InternationalRoutes' => ('is' => 'rw', 'isa' => 'BoolInt', 'coerce' => '1', 'required' => '1', 'default' => '0');
has 'LocalRoutes'         => ('is' => 'rw', 'isa' => 'BoolInt', 'coerce' => '1', 'required' => '1', 'default' => '0');

1;
