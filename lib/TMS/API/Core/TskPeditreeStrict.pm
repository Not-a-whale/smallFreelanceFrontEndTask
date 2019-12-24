package TMS::API::Core::TskPeditreeStrict;
use Moose::Role;

has 'Child'  => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');
has 'Parent' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');

1;
