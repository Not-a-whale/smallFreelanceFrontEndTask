package TMS::API::Core::InvRoleStrict;
use Moose::Role;

has 'RoleName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');

1;
