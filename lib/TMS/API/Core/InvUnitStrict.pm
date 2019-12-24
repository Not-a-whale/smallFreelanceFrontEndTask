package TMS::API::Core::InvUnitStrict;
use Moose::Role;

has 'UnitTag' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');

1;
