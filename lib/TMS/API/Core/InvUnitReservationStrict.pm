package TMS::API::Core::InvUnitReservationStrict;
use Moose::Role;

has 'DateReserved' => ('is' => 'rw', 'isa' => 'DATETIME', 'coerce' => '1', 'required' => '1');

1;
