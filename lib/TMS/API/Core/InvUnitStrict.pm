package TMS::API::Core::InvUnitStrict;
use Moose::Role;

has 'UnitTag' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');

1;
