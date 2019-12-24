package TMS::API::Core::DspLoadsRequiredEquipmentStrict;
use Moose::Role;

has 'EquipmentType' => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '1');
has 'LoadId'        => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '1');
has 'LoadsEquipId'  => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '1');

1;
