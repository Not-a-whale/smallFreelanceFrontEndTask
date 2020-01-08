package TMS::API::Core::InvNoteStrict;
use Moose::Role;

has 'Notes' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');

1;
