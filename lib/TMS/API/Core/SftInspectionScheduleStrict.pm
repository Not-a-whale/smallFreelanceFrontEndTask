package TMS::API::Core::SftInspectionScheduleStrict;
use Moose::Role;

has 'VehicleId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'required' => '1');

1;
