package TMS::API::Core::AppMenuItemSearch;
use Moose::Role;

has 'Label' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');

1;
