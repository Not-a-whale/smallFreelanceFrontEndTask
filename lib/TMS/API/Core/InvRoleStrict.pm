package TMS::API::Core::InvRoleStrict;
use Moose::Role;

has 'RoleName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');

1;
