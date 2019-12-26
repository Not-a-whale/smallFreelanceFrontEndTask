package TMS::API::Core::MsgAccessStrict;
use Moose::Role;

has 'PermissionName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');

1;
