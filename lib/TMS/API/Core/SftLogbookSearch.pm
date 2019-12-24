package TMS::API::Core::SftLogbookSearch;
use Moose::Role;

has 'DateStarted' => ('is' => 'rw', 'isa' => 'DATETIME',    'required' => '0');
has 'Trip'        => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');

1;
