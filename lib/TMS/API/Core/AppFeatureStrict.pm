package TMS::API::Core::AppFeatureStrict;
use Moose::Role;

has 'Name' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');

1;
