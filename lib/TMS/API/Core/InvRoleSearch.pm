package TMS::API::Core::InvRoleSearch;
use Moose::Role;

has 'RoleName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');

1;
