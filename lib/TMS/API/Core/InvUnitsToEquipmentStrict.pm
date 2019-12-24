package TMS::API::Core::InvUnitsToEquipmentStrict;
use Moose::Role;

has 'AddedBy'     => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');
has 'EquipmentId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');
has 'UnitId'      => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');

1;
