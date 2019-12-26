package TMS::API::Core::TskTaskStrict;
use Moose::Role;

has 'PrsnId'   => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '1');
has 'name'     => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'priority' => ('is' => 'rw', 'isa' => 'Int',              'coerce' => '0', 'required' => '0', 'default' => '0');
has 'severity' => ('is' => 'rw', 'isa' => 'Int',              'coerce' => '0', 'required' => '0', 'default' => '0');

1;
