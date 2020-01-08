package TMS::API::Core::TskTaskSearch;
use Moose::Role;

has 'name'     => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'priority' => ('is' => 'rw', 'isa' => 'Int',              'coerce' => '0', 'required' => '0');
has 'severity' => ('is' => 'rw', 'isa' => 'Int',              'coerce' => '0', 'required' => '0');

1;
