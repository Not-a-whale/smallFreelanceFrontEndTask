package TMS::API::Core::HrHireRecordStrict;
use Moose::Role;

has 'AstId'                   => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');
has 'EmploymentAuthorization' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');

1;
