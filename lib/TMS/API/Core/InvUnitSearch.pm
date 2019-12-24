package TMS::API::Core::InvUnitSearch;
use Moose::Role;

has 'UnitTag' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');

1;
