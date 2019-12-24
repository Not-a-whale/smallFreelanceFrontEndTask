package TMS::API::Core::InvNoteStrict;
use Moose::Role;

has 'EquipmentId' => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');
has 'Notes'       => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');
has 'PostedBy'    => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');

1;
