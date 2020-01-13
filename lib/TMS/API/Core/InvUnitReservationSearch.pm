package TMS::API::Core::InvUnitReservationSearch;
use Moose::Role;

has 'DateReserved' => ('is' => 'rw', 'isa' => 'DATETIME', 'coerce' => '1', 'required' => '0');

1;
