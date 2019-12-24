package TMS::API::Core::DrvScheduleSearch;
use Moose::Role;

has 'ChangeDate'    => ('is' => 'rw', 'isa' => 'DATETIME',    'required' => '0');
has 'DesiredDestId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'DriverId'      => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');
has 'PostedBy'      => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');

1;
