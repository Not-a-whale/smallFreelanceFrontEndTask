package TMS::API::Core::InvUnitReservationSearch;
use Moose::Role;

has 'DateReserved' => ('is' => 'rw', 'isa' => 'DATETIME',    'coerce' => '1', 'required' => '0');
has 'InvRoleId'    => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');
has 'PrsnId'       => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');
has 'UnitId'       => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');

1;
