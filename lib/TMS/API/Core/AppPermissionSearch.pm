package TMS::API::Core::AppPermissionSearch;
use Moose::Role;

has 'AccessName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'Feature'    => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');

1;
