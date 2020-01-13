package TMS::API::Core::SftLogbookStrict;
use Moose::Role;

has 'DateStarted' => ('is' => 'rw', 'isa' => 'DATETIME', 'coerce' => '1', 'required' => '1');

1;
