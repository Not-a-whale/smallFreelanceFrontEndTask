package TMS::API::Core::CmmAssignmentsCustomerSearch;
use Moose::Role;

has 'AddedBy'           => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'AssociateId'       => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'CommissionPackage' => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'CustomerId'        => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');

1;
