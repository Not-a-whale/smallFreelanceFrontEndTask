package TMS::API::Core::DrvDriverStrict;
use Moose::Role;

has 'DriverId'            => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '1');
has 'InternationalRoutes' => ('is' => 'rw', 'isa' => 'BoolInt',       'coerce' => '1', 'required' => '1', 'default' => '0');
has 'LocalRoutes'         => ('is' => 'rw', 'isa' => 'BoolInt',       'coerce' => '1', 'required' => '1', 'default' => '0');

1;
