package TMS::API::Core::MsgAccessSearch;
use Moose::Role;

has 'PermissionName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

1;
