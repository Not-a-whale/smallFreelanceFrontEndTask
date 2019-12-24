package TMS::API::Core::DrvDriverStrict;
use Moose::Role;

has 'DriverId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '1');

1;
