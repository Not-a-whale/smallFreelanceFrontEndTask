package TMS::API::Core::AppMenuItemWithDepthSearch;
use Moose::Role;

has 'Label' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

1;
