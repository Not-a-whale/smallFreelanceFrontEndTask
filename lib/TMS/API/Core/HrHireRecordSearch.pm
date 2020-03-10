package TMS::API::Core::HrHireRecordSearch;
use Moose::Role;

has 'Status' => ('is' => 'rw', 'isa' => 'enum_Status', 'coerce' => '1', 'required' => '0');

1;
