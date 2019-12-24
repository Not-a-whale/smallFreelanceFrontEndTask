package TMS::API::Core::HrHireRecordSearch;
use Moose::Role;

has 'AstId'                   => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'EmploymentAuthorization' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');

1;
