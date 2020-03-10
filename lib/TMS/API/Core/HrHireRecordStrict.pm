package TMS::API::Core::HrHireRecordStrict;
use Moose::Role;

has 'Status' => ('is' => 'rw', 'isa' => 'enum_Status', 'coerce' => '1', 'required' => '1', 'default' => 'active');

1;
