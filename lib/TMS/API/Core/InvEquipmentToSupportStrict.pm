package TMS::API::Core::InvEquipmentToSupportStrict;
use Moose::Role;

has 'EquipmentId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');
has 'SupportId'   => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');

1;
