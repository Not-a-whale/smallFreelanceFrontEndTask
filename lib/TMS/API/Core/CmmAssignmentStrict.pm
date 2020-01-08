package TMS::API::Core::CmmAssignmentStrict;
use Moose::Role;

has 'DateAdded' => ('is' => 'rw', 'isa' => 'Any', 'coerce' => '0', 'required' => '1', 'default' => 'SCALAR(0x82480a630)');

1;
