package TMS::API::Core::MsgNoteStrict;
use Moose::Role;

has 'author'      => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');
has 'body'        => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');
has 'macsid'      => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');
has 'sourceid'    => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');
has 'sourcetable' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');

1;
