package TMS::API::Core::AppPermissionStrict;
use Moose::Role;

has 'AccessName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');

1;
