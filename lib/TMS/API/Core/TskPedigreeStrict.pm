package TMS::API::Core::TskPedigreeStrict;
use Moose::Role;

has 'Child'      => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'Parent'     => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'ancestor'   => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '1');
has 'descendant' => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '1');
has 'length'     => ('is' => 'rw', 'isa' => 'Int',              'coerce' => '0', 'required' => '1', 'default' => '0');

1;
