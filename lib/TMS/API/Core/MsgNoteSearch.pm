package TMS::API::Core::MsgNoteSearch;
use Moose::Role;

has 'body' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');

1;
