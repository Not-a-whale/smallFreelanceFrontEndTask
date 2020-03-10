package TMS::API::Core::DspLoadsDestinationStrict;
use Moose::Role;

has 'AppointmentStart' => ('is' => 'rw', 'isa' => 'DATETIME',             'coerce' => '1', 'required' => '1');
has 'AppointmentType'  => ('is' => 'rw', 'isa' => 'enum_AppointmentType', 'coerce' => '1', 'required' => '1');
has 'Commodity'        => ('is' => 'rw', 'isa' => 'VarChar255',           'coerce' => '1', 'required' => '1');
has 'PU_PO'            => ('is' => 'rw', 'isa' => 'VarChar255',           'coerce' => '1', 'required' => '1');
has 'StopType'         => ('is' => 'rw', 'isa' => 'enum_StopType',        'coerce' => '1', 'required' => '1');
has 'StopOrder' => ('is' => 'rw', 'isa' => 'PositiveInt', 'coerce' => '1', 'required' => '1', 'default' => '0');

1;
