package TMS::API::Core::MsgNoteSearch;
use Moose::Role;

has 'author'      => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'body'        => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'macsid'      => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'sourceid'    => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'sourcetable' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

1;
