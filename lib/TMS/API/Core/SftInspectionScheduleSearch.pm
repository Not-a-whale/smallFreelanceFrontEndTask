package TMS::API::Core::SftInspectionScheduleSearch;
use Moose::Role;

has 'VehicleId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '0');

1;
