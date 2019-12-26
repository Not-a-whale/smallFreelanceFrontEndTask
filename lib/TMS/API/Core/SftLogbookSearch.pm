package TMS::API::Core::SftLogbookSearch;
use Moose::Role;

has 'DateStarted' => ('is' => 'rw', 'isa' => 'DATETIME',    'coerce' => '1', 'required' => '0');
has 'Trip'        => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');

1;
