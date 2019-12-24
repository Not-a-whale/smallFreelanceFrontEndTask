package TMS::API::Core::InvUnitReservationStrict;
use Moose::Role;

has 'DateReserved' => ('is' => 'rw', 'isa' => 'DATETIME',    'required' => '1');
has 'InvRoleId'    => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');
has 'PrsnId'       => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');
has 'UnitId'       => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');

1;
