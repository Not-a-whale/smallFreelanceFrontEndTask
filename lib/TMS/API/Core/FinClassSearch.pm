package TMS::API::Core::FinClassSearch;
use Moose::Role;

has 'Name' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

1;
