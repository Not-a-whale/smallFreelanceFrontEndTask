package TMS::API::Core::MsgAccessStrict;
use Moose::Role;

has 'PermissionName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');

1;
