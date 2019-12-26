package TMS::API::Core::InvEquipmentToSupportStrict;
use Moose::Role;

has 'EquipmentId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');
has 'SupportId'   => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');

1;
