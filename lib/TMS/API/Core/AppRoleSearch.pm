package TMS::API::Core::AppRoleSearch;
use Moose::Role;

has 'RoleName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

1;
