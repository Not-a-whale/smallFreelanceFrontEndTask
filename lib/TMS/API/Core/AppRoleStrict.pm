package TMS::API::Core::AppRoleStrict;
use Moose::Role;

has 'RoleName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');

1;
