package TMS::API::Core::DspLoadsRequiredEquipmentSearch;
use Moose::Role;

has 'LoadsEquipId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '1', 'required' => '0');

1;
