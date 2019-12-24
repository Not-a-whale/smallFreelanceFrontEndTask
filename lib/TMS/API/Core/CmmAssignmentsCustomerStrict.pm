package TMS::API::Core::CmmAssignmentsCustomerStrict;
use Moose::Role;

has 'AddedBy'           => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');
has 'AssociateId'       => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');
has 'CommissionPackage' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '1');
has 'CustomerId'        => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '1');

1;
