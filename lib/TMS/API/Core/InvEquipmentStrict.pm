package TMS::API::Core::InvEquipmentStrict;
use Moose::Role;

has 'GeneralName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');
has 'OwnerId'     => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');

1;
