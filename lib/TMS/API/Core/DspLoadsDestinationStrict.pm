package TMS::API::Core::DspLoadsDestinationStrict;
use Moose::Role;

has 'AppointmentStart' => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '1');
has 'AppointmentType'  => ('is' => 'rw', 'isa' => 'Any',              'coerce' => '0', 'required' => '1');
has 'Branch'           => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '1');
has 'Commodity'        => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'LoadId'           => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '1');
has 'PU_PO'            => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '1');
has 'StopType'         => ('is' => 'rw', 'isa' => 'Any',              'coerce' => '0', 'required' => '1');
has 'StopOrder'        => ('is' => 'rw', 'isa' => 'Int',              'coerce' => '0', 'required' => '1', 'default' => '0');

1;
