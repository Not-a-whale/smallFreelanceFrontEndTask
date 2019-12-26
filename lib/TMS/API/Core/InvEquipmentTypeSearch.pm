package TMS::API::Core::InvEquipmentTypeSearch;
use Moose::Role;

has 'EquipmentTypeId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'coerce' => '0', 'required' => '0');
has 'Name'            => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');

1;
