package TMS::API::Core::InvEquipmentSearch;
use Moose::Role;

has 'GeneralName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'OwnerId'     => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');

1;
