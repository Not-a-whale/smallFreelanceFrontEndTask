package TMS::API::Core::DrvScheduleStrict;
use Moose::Role;

has 'ChangeDate'    => ('is' => 'rw', 'isa' => 'DATETIME',    'coerce' => '1', 'required' => '1');
has 'DesiredDestId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');
has 'DriverId'      => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');
has 'PostedBy'      => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');

1;
