package TMS::API::Core::EntPersonStrict;
use Moose::Role;

has 'BrnchId'   => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');
has 'FirstName' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');
has 'LastName'  => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');

1;
