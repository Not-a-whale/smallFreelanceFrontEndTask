package TMS::API::Core::DrvDriverSearch;
use Moose::Role;

has 'DriverId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '0');

1;
