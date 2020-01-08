package TMS::API::Core::HrHireRecordSearch;
use Moose::Role;

has 'Status' => ('is' => 'rw', 'isa' => 'Any', 'coerce' => '0', 'required' => '0');

1;
