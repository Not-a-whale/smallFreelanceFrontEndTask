package TMS::API::Core::InvTiresizeSearch;
use Moose::Role;

has 'Name' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

1;
