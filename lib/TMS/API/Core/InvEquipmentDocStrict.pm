package TMS::API::Core::InvEquipmentDocStrict;
use Moose::Role;

has 'EquipmentId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');
has 'FileId'      => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');

1;
