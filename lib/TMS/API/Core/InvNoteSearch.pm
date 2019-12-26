package TMS::API::Core::InvNoteSearch;
use Moose::Role;

has 'EquipmentId' => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'Notes'       => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'PostedBy'    => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');

1;
