package TMS::API::Core::AppPermissionStrict;
use Moose::Role;

has 'AccessName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');
has 'Feature'    => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');

1;
