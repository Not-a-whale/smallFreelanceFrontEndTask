package TMS::API::Core::HrResidenceStrict;
use Moose::Role;

has 'DateMovedIn' => ('is' => 'rw', 'isa' => 'DATETIME', 'coerce' => '1', 'required' => '1');

1;
