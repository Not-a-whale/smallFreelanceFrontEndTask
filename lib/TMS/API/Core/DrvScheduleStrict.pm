package TMS::API::Core::DrvScheduleStrict;
use Moose::Role;

has 'ChangeDate' => ('is' => 'rw', 'isa' => 'DATETIME', 'coerce' => '1', 'required' => '1');

1;
