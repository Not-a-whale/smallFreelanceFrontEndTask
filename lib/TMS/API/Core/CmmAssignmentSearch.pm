package TMS::API::Core::CmmAssignmentSearch;
use Moose::Role;

has 'DateAdded' => ('is' => 'rw', 'isa' => 'Any', 'coerce' => '0', 'required' => '0');

1;
