package TMS::API::Core::InvUnitSearch;
use Moose::Role;

has 'UnitTag' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');

1;
