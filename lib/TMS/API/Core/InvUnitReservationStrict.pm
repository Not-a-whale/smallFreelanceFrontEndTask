package TMS::API::Core::InvUnitReservationStrict;
use Moose::Role;

has 'DateReserved' => ('is' => 'rw', 'isa' => 'DATETIME',    'coerce' => '1', 'required' => '1');
has 'InvRoleId'    => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');
has 'PrsnId'       => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');
has 'UnitId'       => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');

1;
