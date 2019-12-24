package TMS::API::Core::TskTaskSearch;
use Moose::Role;

has 'PrsnId' => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'name'   => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

1;
