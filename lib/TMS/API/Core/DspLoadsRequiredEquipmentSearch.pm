package TMS::API::Core::DspLoadsRequiredEquipmentSearch;
use Moose::Role;

has 'EquipmentType' => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '0');
has 'LoadId'        => ('is' => 'rw', 'isa' => 'PositiveInt',   'required' => '0');
has 'LoadsEquipId'  => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'required' => '0');

1;
