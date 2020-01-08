package TMS::API::Core::EntBlacklistSearch;
use Moose::Role;

has 'DateCreated' => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '0');
has 'Reason'      => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'Type'        => ('is' => 'rw', 'isa' => 'Any',              'coerce' => '0', 'required' => '0');

1;
