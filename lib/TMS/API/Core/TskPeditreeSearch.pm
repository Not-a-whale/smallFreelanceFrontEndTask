package TMS::API::Core::TskPeditreeSearch;
use Moose::Role;

has 'Child'  => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'Parent' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

1;
