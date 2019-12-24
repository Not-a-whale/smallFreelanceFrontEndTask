package TMS::API::Core::AppMenuItemSearch;
use Moose::Role;

has 'Label' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

1;
