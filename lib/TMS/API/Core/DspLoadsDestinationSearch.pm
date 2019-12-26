package TMS::API::Core::DspLoadsDestinationSearch;
use Moose::Role;

has 'AppointmentStart' => ('is' => 'rw', 'isa' => 'DATETIME',         'coerce' => '1', 'required' => '0');
has 'AppointmentType'  => ('is' => 'rw', 'isa' => 'Any',              'coerce' => '0', 'required' => '0');
has 'Branch'           => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'Commodity'        => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'LoadId'           => ('is' => 'rw', 'isa' => 'PositiveInt',      'coerce' => '1', 'required' => '0');
has 'PU_PO'            => ('is' => 'rw', 'isa' => 'TidySpacesString', 'coerce' => '1', 'required' => '0');
has 'StopType'         => ('is' => 'rw', 'isa' => 'Any',              'coerce' => '0', 'required' => '0');

1;
