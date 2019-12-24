package TMS::API::Core::CmmAssignmentsGroupStrict;
use Moose::Role;

has 'AddedBy'           => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');
has 'AssociateId'       => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');
has 'CommissionPackage' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');

1;
