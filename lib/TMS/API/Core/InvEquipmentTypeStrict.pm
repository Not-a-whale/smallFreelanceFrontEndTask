package TMS::API::Core::InvEquipmentTypeStrict;
use Moose::Role;

has 'EquipmentTypeId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'coerce' => '0', 'required' => '1');
has 'Name'            => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');

1;
