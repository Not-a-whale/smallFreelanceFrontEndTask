package TMS::API::Core::AppMenuItemStrict;
use Moose::Role;

has 'Label' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');

1;
