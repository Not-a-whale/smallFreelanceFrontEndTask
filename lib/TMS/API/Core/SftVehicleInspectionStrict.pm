package TMS::API::Core::SftVehicleInspectionStrict;
use Moose::Role;

has 'InspectionNumber' => ('is' => 'rw', 'isa' => 'VarChar10',   'coerce' => '1', 'required' => '1');
has 'Status'           => ('is' => 'rw', 'isa' => 'enum_Status', 'coerce' => '1', 'required' => '1', 'default' => 'Other');

1;
