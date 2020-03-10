package TMS::API::Core::MsgAccessSearch;
use Moose::Role;

has 'PermissionName' => ('is' => 'rw', 'isa' => 'VarChar255', 'coerce' => '1', 'required' => '0');

1;
