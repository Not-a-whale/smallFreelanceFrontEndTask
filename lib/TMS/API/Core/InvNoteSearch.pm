package TMS::API::Core::InvNoteSearch;
use Moose::Role;

has 'Notes' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');

1;
