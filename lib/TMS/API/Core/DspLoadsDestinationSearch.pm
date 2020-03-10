package TMS::API::Core::DspLoadsDestinationSearch;
use Moose::Role;

has 'AppointmentStart' => ('is' => 'rw', 'isa' => 'DATETIME',             'coerce' => '1', 'required' => '0');
has 'AppointmentType'  => ('is' => 'rw', 'isa' => 'enum_AppointmentType', 'coerce' => '1', 'required' => '0');
has 'Commodity'        => ('is' => 'rw', 'isa' => 'VarChar255',           'coerce' => '1', 'required' => '0');
has 'PU_PO'            => ('is' => 'rw', 'isa' => 'VarChar255',           'coerce' => '1', 'required' => '0');
has 'StopType'         => ('is' => 'rw', 'isa' => 'enum_StopType',        'coerce' => '1', 'required' => '0');
has 'StopOrder'        => ('is' => 'rw', 'isa' => 'PositiveInt',          'coerce' => '1', 'required' => '0');

1;
