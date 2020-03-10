package TMS::API::Core::MsgNoteStrict;
use Moose::Role;

has 'body'        => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'sourceid'    => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '1');
has 'sourcetable' => ('is' => 'rw', 'isa' => 'VarChar64',        'coerce' => '1', 'required' => '1');

1;
