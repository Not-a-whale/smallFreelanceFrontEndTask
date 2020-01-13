package TMS::API::Core::HrResidenceSearch;
use Moose::Role;

has 'DateMovedIn' => ('is' => 'rw', 'isa' => 'DATETIME', 'coerce' => '1', 'required' => '0');

1;
