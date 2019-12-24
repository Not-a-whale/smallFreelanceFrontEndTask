package TMS::API::Core::InvUnitsToEquipmentSearch;
use Moose::Role;

has 'AddedBy'     => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'EquipmentId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'UnitId'      => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');

1;
