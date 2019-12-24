package TMS::API::Core::InvRoleSearch;
use Moose::Role;

has 'RoleName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

1;
