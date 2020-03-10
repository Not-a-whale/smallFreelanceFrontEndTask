package TMS::API::Core::SftVehicleInspectionSearch;
use Moose::Role;

has 'InspectionNumber' => ('is' => 'rw', 'isa' => 'VarChar10',   'coerce' => '1', 'required' => '0');
has 'Status'           => ('is' => 'rw', 'isa' => 'enum_Status', 'coerce' => '1', 'required' => '0');

1;
