package TMS::API::Core::InvTiresizeStrict;
use Moose::Role;

has 'Name' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');

1;
