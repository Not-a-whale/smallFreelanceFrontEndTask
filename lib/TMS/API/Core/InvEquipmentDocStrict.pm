package TMS::API::Core::InvEquipmentDocStrict;
use Moose::Role;

has 'EquipmentId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');
has 'FileId'      => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');

1;
