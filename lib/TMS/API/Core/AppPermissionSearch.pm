package TMS::API::Core::AppPermissionSearch;
use Moose::Role;

has 'AccessName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'Feature'    => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');

1;
