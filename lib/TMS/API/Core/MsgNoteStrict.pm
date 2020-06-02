package TMS::API::Core::MsgNoteStrict;
use Moose::Role;

has 'body' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');

1;
