package TMS::API::Core::DspLoadsRequiredEquipmentStrict;
use Moose::Role;

has 'LoadsEquipId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '0', 'required' => '1');

1;
