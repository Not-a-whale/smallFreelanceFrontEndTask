package TMS::API::Core::InvEquipmentTypeStrict;
use Moose::Role;

has 'EquipmentTypeId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'required' => '1');
has 'Name'            => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');

1;
