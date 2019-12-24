package TMS::API::Core::TskTaskStrict;
use Moose::Role;

has 'PrsnId' => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');
has 'name'   => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');

1;
