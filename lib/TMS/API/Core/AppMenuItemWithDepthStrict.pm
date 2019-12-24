package TMS::API::Core::AppMenuItemWithDepthStrict;
use Moose::Role;

has 'Label' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');

1;
