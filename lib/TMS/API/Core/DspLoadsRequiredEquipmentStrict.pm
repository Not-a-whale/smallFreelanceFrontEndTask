package TMS::API::Core::DspLoadsRequiredEquipmentStrict;
use Moose::Role;

has 'LoadsEquipId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt', 'coerce' => '1', 'required' => '1');

1;
