package TMS::API::Core::DspLoadsDestinationSearch;
use Moose::Role;

has 'AppointmentStart' => ('is' => 'rw', 'isa' => 'DATETIME',         'required' => '0');
has 'AppointmentType'  => ('is' => 'rw', 'isa' => 'Any',              'required' => '0');
has 'Branch'           => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'Commodity'        => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'LoadId'           => ('is' => 'rw', 'isa' => 'PositiveInt',      'required' => '0');
has 'PU_PO'            => ('is' => 'rw', 'isa' => 'TidySpacesString', 'required' => '0');
has 'StopType'         => ('is' => 'rw', 'isa' => 'Any',              'required' => '0');

1;
