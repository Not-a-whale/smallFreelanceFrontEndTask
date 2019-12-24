package TMS::API::Core::InvNoteSearch;
use Moose::Role;

has 'EquipmentId' => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'Notes'       => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'PostedBy'    => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');

1;
