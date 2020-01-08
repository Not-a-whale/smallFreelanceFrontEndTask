package TMS::API::Core::DrvScheduleSearch;
use Moose::Role;

has 'ChangeDate' => ('is' => 'rw', 'isa' => 'DATETIME', 'coerce' => '1', 'required' => '0');

1;
