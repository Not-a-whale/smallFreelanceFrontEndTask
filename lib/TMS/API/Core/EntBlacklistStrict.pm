package TMS::API::Core::EntBlacklistStrict;
use Moose::Role;

has 'Creator'     => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');
has 'DateCreated' => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '1');
has 'EntityId'    => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');
has 'Reason'      => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');

1;
