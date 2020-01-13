package TMS::API::Core::InvEquipmentSearch;
use Moose::Role;

has 'GeneralName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');

1;
