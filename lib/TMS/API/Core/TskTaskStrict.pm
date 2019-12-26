package TMS::API::Core::TskTaskStrict;
use Moose::Role;

has 'PrsnId' => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '1');
has 'name'   => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');

1;
