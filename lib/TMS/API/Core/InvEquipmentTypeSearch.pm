package TMS::API::Core::InvEquipmentTypeSearch;
use Moose::Role;

has 'EquipmentTypeId' => ('is' => 'rw', 'isa' => 'PrimaryKeyInt',    'required' => '0');
has 'Name'            => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

1;
