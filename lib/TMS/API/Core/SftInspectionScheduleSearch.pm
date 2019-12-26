package TMS::API::Core::SftInspectionScheduleSearch;
use Moose::Role;

has 'VehicleId' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '0');

1;
