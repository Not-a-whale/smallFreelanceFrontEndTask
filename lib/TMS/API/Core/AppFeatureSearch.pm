package TMS::API::Core::AppFeatureSearch;
use Moose::Role;

has 'Name' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

1;
