package TMS::API::Core::TskPedigreeStrict;
use Moose::Role;

has 'Child'      => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');
has 'Parent'     => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');
has 'ancestor'   => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');
has 'descendant' => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');

1;
