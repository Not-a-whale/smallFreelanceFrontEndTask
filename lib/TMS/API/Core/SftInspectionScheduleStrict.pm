package TMS::API::Core::SftInspectionScheduleStrict;
use Moose::Role;

has 'VehicleId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1');

1;
