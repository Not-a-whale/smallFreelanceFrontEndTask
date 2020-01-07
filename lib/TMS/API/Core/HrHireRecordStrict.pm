package TMS::API::Core::HrHireRecordStrict;
use Moose::Role;

has 'AstId'                   => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');
has 'EmploymentAuthorization' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');
has 'Status'                  => ('is' => 'rw', 'isa' => 'Any',         'coerce' => '0', 'required' => '1', 'default' => 'active');

1;
