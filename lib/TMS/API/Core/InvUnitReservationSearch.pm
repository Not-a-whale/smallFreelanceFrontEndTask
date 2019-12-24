package TMS::API::Core::InvUnitReservationSearch;
use Moose::Role;

has 'DateReserved' => ('is' => 'rw', 'isa' => 'DATETIME',    'required' => '0');
has 'InvRoleId'    => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'PrsnId'       => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'UnitId'       => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');

1;
