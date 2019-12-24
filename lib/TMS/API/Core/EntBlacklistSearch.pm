package TMS::API::Core::EntBlacklistSearch;
use Moose::Role;

has 'Creator'     => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'DateCreated' => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'EntityId'    => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'Reason'      => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

1;
