package TMS::API::Core::MsgAccessStrict;
use Moose::Role;

has 'PermissionName' => ('is' => 'rw', 'isa' => 'VarChar255', 'coerce' => '1', 'required' => '1');

1;
