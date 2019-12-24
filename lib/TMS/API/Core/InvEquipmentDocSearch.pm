package TMS::API::Core::InvEquipmentDocSearch;
use Moose::Role;

has 'EquipmentId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'FileId'      => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');

1;
