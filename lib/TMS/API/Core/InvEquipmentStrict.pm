package TMS::API::Core::InvEquipmentStrict;
use Moose::Role;

has 'GeneralName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');

1;
