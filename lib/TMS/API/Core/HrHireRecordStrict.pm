package TMS::API::Core::HrHireRecordStrict;
use Moose::Role;

has 'Status' => ('is' => 'rw', 'isa' => 'Any', 'coerce' => '0', 'required' => '1', 'default' => 'active');

1;
