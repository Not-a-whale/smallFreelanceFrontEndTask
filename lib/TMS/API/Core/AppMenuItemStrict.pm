package TMS::API::Core::AppMenuItemStrict;
use Moose::Role;

has 'Label' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');

1;
