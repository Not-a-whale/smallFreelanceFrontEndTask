package TMS::API::Core::InvTiresizeStrict;
use Moose::Role;

has 'Name' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');

1;
