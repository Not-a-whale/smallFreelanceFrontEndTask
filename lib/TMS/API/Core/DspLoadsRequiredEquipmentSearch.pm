package TMS::API::Core::DspLoadsRequiredEquipmentSearch;
use Moose::Role;

has 'EquipmentType' => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'LoadId'        => ('is' => 'rw', 'isa' => 'PositiveInt',   'coerce' => '1', 'required' => '0');
has 'LoadsEquipId'  => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '0');

1;
