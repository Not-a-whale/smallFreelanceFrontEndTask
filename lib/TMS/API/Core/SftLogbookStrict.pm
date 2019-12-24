package TMS::API::Core::SftLogbookStrict;
use Moose::Role;

has 'DateStarted' => ('is' => 'rw', 'isa' => 'DATETIME',    'required' => '1');
has 'Trip'        => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');

1;
