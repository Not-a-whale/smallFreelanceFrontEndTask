package TMS::API::Core::EntPersonSearch;
use Moose::Role;

has 'BrnchId'   => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'FirstName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'LastName'  => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

1;
